delete from football.National_Teams
where country_nm in ('Russia', 'Tunisia'); -- Удаляем Россию и Тунис

update football.Tournament_Seasons
set season_id = 2021
where tournament_id = 1101; -- Euro 2020 было перенесено на 2021-ый год

insert into football.awards(award_id, award_nm, tournament_id)
values
    (14, 'Golden ball', NULL); -- Решили все-таки вручить золотой мяч за 2020 год достойному кандидату.

insert into football.Nominations (player_nm, award_id, season_id, description_txt)
values
    ('Robert Lewandowski', 14, 2020, 'The best player in the world'); -- Им оказался Роберт Левандовский


insert into football.football_clubs (command_nm, sponsor_nm, transfer_budget, coach, city_nm)
values
    ('Milan', 'Fly Emirates', 40000000, 'Stefano Pioli', 'Milan'); --Добавляем Милан в нашу БД.

update football.tournaments
set winner_nm = 'Milan'
where tournament_id = 4; -- Ювентус обвинили в коррупции и решили отдать чемпионство Милану

update football.Tournaments
set prize_pool = 60000000
where tournament_id = 1; -- Призовой фонд АПЛ внезапно решили увеличить!

delete from football.National_Tournaments
where country_nm = 'Peru'; -- Недоброжелатели удалили Перу из списка участников кубка Америки

update football.players
set
    command_nm = 'Barcelona',
    salary = 5000000,
    market_value = 80000000,
    joindate = '2021-08-12'
where name like '%Lewandowski'; -- Роберт Левандовский перешёл в Барселону

delete from football.tournament_seasons
where season_id < 2014; -- удаляем старые турниры для освобождения памяти

select description_txt
from football.nominations
where 1=1
    and player_nm like '%Messi'
    and season_id > 2020; -- смотрим индивидуальные награды Месси за последнее время.

--Видим неудачный description для одной из наград и исправляем его:
update football.nominations
set description_txt = 'The best player of World Cup 2022'
where award_id = 1102;


select description_txt
from football.nominations
where 1=1
    and player_nm like '%Messi'
    and season_id > 2020; -- Убеждаемся, что сейчас как-то получше стало...
