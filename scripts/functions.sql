--Функция, возвращающая затраты на зарплату футболистам.
--Может быть полезна для сотрудников финансового сектора клуба.
create or replace function football.get_salary_expenses(fc_name text)
    returns integer as
$$
begin
    return (
        select sum (salary) as salary_expenses
        from football.players
        where command_nm like fc_name
        );
end;

$$ language plpgsql;

--Функция, возвращающая прибыль клуба, начиная с определенной даты.
--Может быть полезна для сотрудников финансового сектора клуба.
create or replace function football.get_current_profit(fc_name text, start_date date)
    returns integer as
$$
begin
    return coalesce((
        select sum (t3.prize_pool) as salary_expenses
        from football.football_clubs t1
            inner join football.tournaments t3
                on t1.command_nm = t3.winner_nm
            inner join football.tournament_seasons t4
                on t3.tournament_id = t4.tournament_id
            inner join football.seasons t5
                on t4.season_id = t5.season_id
        where 1=1
            and t1.command_nm like fc_name
            and t5.season_end > start_date
        ) - football.get_salary_expenses(fc_name) * (current_date - start_date)::numeric / 365, -football.get_salary_expenses(fc_name) * (current_date - start_date)::numeric / 365);
end

$$ language plpgsql;