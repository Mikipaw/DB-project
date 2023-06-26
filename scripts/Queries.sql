--№1
--Выводим стоимость игроков клубов, где минимальная зарплата игрока не менее 2 млн.

select
    t2.command_nm as Football_Club,
    sum(t1.market_value) as Total_Players_Cost

from football.players t1
    inner join football.football_clubs t2
        on t1.command_nm = t2.command_nm

group by football_club
having min(t1.salary) >= 2000000
order by total_players_cost desc;

--№2
--Выводим список турниров, отсортированный по призовому фонду (если он есть вообще).

select
    tournament_id,
    prize_pool

from football.tournaments
where prize_pool > 0
order by prize_pool desc;

--№3
-- Посчитаем число команд в каждой лиге
select
    t1.command_nm,
    t2.tournament_id,
    count(t2.command_nm) over (partition by t2.tournament_id) as teams_count
from football.football_clubs t1
    inner join football.club_tournaments t2
        on t1.command_nm = t2.command_nm
    inner join football.tournaments t3
        on t2.tournament_id = t3.tournament_id;

--№4
-- Установим соответствие между игроками и клубами, пронумеровав клубы
select
    t1.name,
    t2.command_nm,
    dense_rank() over (order by t2.command_nm) as football_club_num

from football.players t1
    inner join football.football_clubs t2
        on t1.command_nm = t2.command_nm;

--№5
--Сравнение зарплат игроков в каждом клубе с минимальной
select
    name,
    t2.command_nm,
    t1.salary,
    first_value(t1.salary)
        over (
            partition by t2.command_nm
            order by t1.salary
            ) as min_salary_in_the_club

from football.players t1
    inner join football.football_clubs t2
        on t1.command_nm = t2.command_nm;

--№6
--Выводим все индивидуальные награды Лионеля Месси с сезона 2018/2019
select
    t3.tournament_id as tournament,
    t2.description_txt as achievement,
    t2.season_id as season

from football.players t1
    inner join football.nominations t2
        on t1.name = t2.player_nm
    left join football.awards t3
        on t2.award_id = t3.award_id

where 1=1
    and name like '%Messi'
    and season_id > 2018

order by season;