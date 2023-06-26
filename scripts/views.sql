--№1
--Сокращает полные имена игроков до фамилии и первой буквы имени.
create or replace view football.players_view as
    select
        substring(name, position(' ' in name) + 1) || ' ' || substring(name, 1, 1) || '.' as player_name,
        command_nm as football_club,
        national_nm as national_team,
        market_value,
        salary

    from football.players
    order by player_name;

--№2
--Делает данные с transfermemarkt.com более читаемыми.
create or replace view football.transfermarkt_view as
    select
        name,
        command_nm as football_club,
        national_nm as national_team,
        left(text(market_value), -6) || '.' || right(left(text(market_value), -4), 2) || 'm' as player_cost,
        left(text(salary), -3) || '.' || right(left(text(salary), -1), 2) || 'k' as player_salary

    from football.players
    order by market_value desc;

--№3
--Смотрим, сколько трофеев и денег выиграли 10 сильнейших команд.
create or replace view football.total_won_clubs as
    select
        winner_nm as football_club,
        sum(t3.prize_pool) as total_money_won,
        count(*) as number_of_tropheys

    from football.football_clubs t1
        inner join football.club_tournaments t2
            on t1.command_nm = t2.command_nm
        inner join football.tournaments t3
            on t2.tournament_id = t3.tournament_id

    group by winner_nm
    order by total_money_won desc
    limit 10;

--№4
--Смотрим среднюю зарплату и среднюю стоимость игроков в клубах.
create or replace view football.avg_salary_cost as
    select
        (avg(t1.salary))::integer as avg_salary,
        (avg(t1.market_value))::integer as avg_market_value,
        t2.command_nm

    from football.players t1
        inner join football.football_clubs t2
            on t1.command_nm = t2.command_nm

    group by t2.command_nm
    order by avg_market_value desc;

--№5
--Смотрим самых титулованных игроков.
create or replace view football.players_awards_view as
    select
        t1.name,
        sum(case when winner_nm is null then 0 else 1 end) as number_of_tropheys,
        sum(case when award_id is null then 0 else 1 end) number_of_individual_awards

    from football.players t1
        inner join football.football_clubs t2
            on t1.command_nm = t2.command_nm
        left join football.tournaments t3
            on t3.winner_nm = t2.command_nm
        left join football.nominations t4
            on t4.player_nm = t1.name

    group by t1.name
    order by
        number_of_tropheys desc,
        number_of_individual_awards desc;