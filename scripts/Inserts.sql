INSERT INTO football.Football_Clubs (command_nm, sponsor_nm, transfer_budget, coach, city_nm)
VALUES
    ('Real Madrid', 'Fly Emirates', 100000000, 'Carlo Ancelotti', 'Madrid'),
    ('Barcelona', 'Spotify', 90000000, 'Xavi Hernandez', 'Barcelona'),
    ('Bayern Munich', 'T-Mobile', 95000000, 'Thomas Tuchel', 'Munich'),
    ('Liverpool', 'Standard Chartered', 85000000, 'Jurgen Klopp', 'Liverpool'),
    ('Manchester City', 'Etihad Airways', 110000000, 'Pep Guardiola', 'Manchester'),
    ('Paris Saint-Germain', 'Qatar Airways', 120000000, 'Mauricio Pochettino', 'Paris'),
    ('Juventus', 'Jeep', 80000000, 'Massimiliano Allegri', 'Turin'),
    ('Chelsea', 'Three', 95000000, 'Thomas Tuchel', 'London'),
    ('Atletico Madrid', 'Plus500', 90000000, 'Diego Simeone', 'Madrid'),
    ('Roma', 'DigitalBits', 60000000, 'Jose Mourinho', 'Rome'),
    ('Manchester United', 'TeamViewer', 100000000, 'Erik ten Hag', 'Manchester');

INSERT INTO football.Sponsors (sponsor_nm, country_nm, category)
VALUES
    ('DigitalBits', 'Cayman Islands', 'Blockchain'),
    ('Fly Emirates', 'UAE', 'Airline'),
    ('Spotify', 'Sweden', 'Technology'),
    ('T-Mobile', 'Germany', 'Telecommunications'),
    ('Standard Chartered', 'United Kingdom', 'Banking'),
    ('Etihad Airways', 'UAE', 'Airline'),
    ('Qatar Airways', 'Qatar', 'Airline'),
    ('Jeep', 'United States', 'Automotive'),
    ('Three', 'United Kingdom', 'Telecommunications'),
    ('Plus500', 'Israel', 'Finance'),
    ('TeamViewer', 'Germany', 'Technology');

INSERT INTO football.National_Teams (country_nm)
VALUES
    ('Belgium'),
    ('Brazil'),
    ('France'),
    ('England'),
    ('Portugal'),
    ('Spain'),
    ('Italy'),
    ('Argentina'),
    ('Uruguay'),
    ('Denmark'),
    ('Netherlands'),
    ('Germany'),
    ('Mexico'),
    ('Switzerland'),
    ('Sweden'),
    ('Croatia'),
    ('Colombia'),
    ('Wales'),
    ('Senegal'),
    ('Chile'),
    ('Peru'),
    ('Austria'),
    ('Norway'),
    ('Ukraine'),
    ('Japan'),
    ('Turkey'),
    ('Tunisia'),
    ('Russia'),
    ('Australia'),
    ('Poland');

INSERT INTO football.Players (name, command_nm, national_nm, salary, market_value, joindate)
VALUES
    ('Cristiano Ronaldo', 'Juventus', 'Portugal', 3000000, 50000000, '2020-08-31'),
    ('Giorgio Chiellini', 'Juventus', 'Italy', 1500000, 20000000, '2005-07-01'),
    ('Paulo Dybala', 'Juventus', 'Argentina', 2000000, 40000000, '2015-06-01');

INSERT INTO football.Players (name, command_nm, national_nm, salary, market_value, joindate)
VALUES
    ('Lionel Messi', 'Paris Saint-Germain', 'Argentina', 3500000, 80000000, '2021-08-10'),
    ('Neymar Jr', 'Paris Saint-Germain', 'Brazil', 3000000, 60000000, '2017-08-03'),
    ('Kylian Mbappé', 'Paris Saint-Germain', 'France', 4000000, 90000000, '2017-07-01');

INSERT INTO football.Players (name, command_nm, national_nm, salary, market_value, joindate)
VALUES
    ('Sergio Busquets', 'Barcelona', 'Spain', 2500000, 35000000, '2008-07-01'),
    ('Ansu Fati', 'Barcelona', 'Spain', 1000000, 30000000, '2019-07-01');

INSERT INTO football.Players (name, command_nm, national_nm, salary, market_value, joindate)
VALUES
    ('Mason Mount', 'Chelsea', 'England', 1500000, 50000000, '2017-07-01'),
    ('Edouard Mendy', 'Chelsea', 'Senegal', 2000000, 40000000, '2020-09-24');

INSERT INTO football.Players (name, command_nm, national_nm, salary, market_value, joindate)
VALUES
    ('Bruno Fernandes', 'Manchester United', 'Portugal', 3000000, 80000000, '2020-01-30'),
    ('Marcus Rashford', 'Manchester United', 'England', 2500000, 70000000, '2015-07-01'),
    ('Harry Maguire', 'Manchester United', 'England', 2000000, 60000000, '2019-08-05');

INSERT INTO football.Players (name, command_nm, national_nm, salary, market_value, joindate)
VALUES
    ('Kevin De Bruyne', 'Manchester City', 'Belgium', 3500000, 90000000, '2015-08-30'),
    ('Raheem Sterling', 'Manchester City', 'England', 3000000, 80000000, '2015-07-14'),
    ('Phil Foden', 'Manchester City', 'England', 2000000, 60000000, '2017-11-24');

INSERT INTO football.Players (name, command_nm, national_nm, salary, market_value, joindate)
VALUES
    ('Robert Lewandowski', 'Bayern Munich', 'Poland', 4000000, 100000000, '2014-07-01'),
    ('Manuel Neuer', 'Bayern Munich', 'Germany', 3000000, 60000000, '2011-07-01'),
    ('Joshua Kimmich', 'Bayern Munich', 'Germany', 2500000, 70000000, '2015-07-01');

INSERT INTO football.Players (name, command_nm, national_nm, salary, market_value, joindate)
VALUES
    ('Jan Oblak', 'Atletico Madrid', NULL, 3000000, 80000000, '2014-07-16'),
    ('Luis Suárez', 'Atletico Madrid', 'Uruguay', 2500000, 50000000, '2020-09-25');

INSERT INTO football.Players (name, command_nm, national_nm, salary, market_value, joindate)
VALUES
    ('Virgil van Dijk', 'Liverpool', 'Netherlands', 3000000, 80000000, '2018-01-01'),
    ('Mohamed Salah', 'Liverpool', NULL, 3500000, 90000000, '2017-06-22');

INSERT INTO football.Players (name, command_nm, national_nm, salary, market_value, joindate)
VALUES
    ('Karim Benzema', 'Real Madrid', 'France', 4000000, 100000000, '2009-07-01'),
    ('Sergio Ramos', 'Real Madrid', 'Spain', 3500000, 80000000, '2005-08-31');

INSERT INTO football.Tournaments (tournament_id, place_nm, winner_nm, prize_pool)
VALUES
    (1, 'England', 'Manchester City', 50000000), -- English Premier League
    (2, 'Spain', 'Real Madrid', 40000000), -- La Liga
    (3, 'Germany', 'Bayern Munich', 40000000), -- Bundesliga
    (4, 'Italy', 'Juventus', 30000000), -- Serie A
    (5, 'France', 'Paris Saint-Germain', 25000000), -- Ligue 1
    (1001, 'Europe', 'Real Madrid', 40000000), -- UEFA Champions League
    (1002, 'Europe', 'Chelsea', 20000000), -- UEFA Europa League
    (1003, 'Europe', 'Roma', 15000000), -- UEFA Conference League
    (1004, 'Morocco', 'Real Madrid', 10000000), -- FIFA Club World Cup
    (1005, 'Finland', 'Real Madrid', 8000000), -- UEFA Super Cup
    (1101, 'Europe', 'Italy', 0), -- Euro 2020
    (1102, 'Qatar', 'Argentina', 0), -- World Championship 2022
    (1103, 'Brazil', 'Argentina', 0); -- Copa America 2021

INSERT INTO football.Awards (award_id, award_nm, tournament_id)
VALUES
    (1, 'Golden Shoe', NULL),
    (2, 'Golden Shoe', NULL),
    (4, 'Golden Shoe', NULL),
    (11, 'Golden ball', NULL),
    (12, 'Golden ball', NULL),
    (13, 'Golden ball', NULL),
    (21, 'Golden glove', NULL),
    (112, 'Player of the month', 1),
    (101, 'Best player of the season', 1),
    (201, 'Best player of tournament', 1102),
    (202, 'Best player of tournament', 1101),
    (203, 'Best player of tournament', 1103),
    (113, 'Best scorer of the season', 1),
    (124, 'Best player of the month', 2);

INSERT INTO football.Nominations (player_nm, award_id, season_id, description_txt)
VALUES
    ('Lionel Messi', 12, 2021, 'The best player in the world'),
    ('Lionel Messi', 13, 2019, 'The best player in the world'),
    ('Karim Benzema', 11, 2022, 'The best player in the world'),
    ('Robert Lewandowski', 1, 2022, 'The best goal scorer in the world'),
    ('Robert Lewandowski', 2, 2021, 'The best goal scorer in the world'),
    ('Lionel Messi', 4, 2019, 'The best goal scorer in the world'),
    ('Lionel Messi', 201, 2022, 'Best player of tournament'),
    ('Kevin De Bruyne', 112, 2022, 'Best player of April in English Premier League'),
    ('Mohamed Salah', 113, 2021, 'Best scorer of the season in English Premier League'),
    ('Lionel Messi', 203, 2021, 'The best player in Copa America 2021');

INSERT INTO football.Seasons (season_id, season_start, season_end)
VALUES
    (2012, '2012-07-01', '2013-06-30'),
    (2013, '2013-07-01', '2014-06-30'),
    (2014, '2014-07-01', '2015-06-30'),
    (2015, '2015-07-01', '2016-06-30'),
    (2016, '2016-07-01', '2017-06-30'),
    (2017, '2017-07-01', '2018-06-30'),
    (2018, '2018-07-01', '2019-06-30'),
    (2019, '2019-07-01', '2020-06-30'),
    (2020, '2020-07-01', '2021-06-30'),
    (2021, '2021-07-01', '2022-06-30'),
    (2022, '2022-07-01', '2023-06-30');

INSERT INTO football.Tournament_Seasons (season_id, tournament_id)
VALUES
    (2012, 1), -- English Premier League, Season 2012
    (2013, 1), -- English Premier League, Season 2013
    (2014, 1), -- English Premier League, Season 2014
    (2015, 1), -- English Premier League, Season 2015
    (2016, 1), -- English Premier League, Season 2016
    (2017, 1), -- English Premier League, Season 2017
    (2018, 1), -- English Premier League, Season 2018
    (2019, 1), -- English Premier League, Season 2019
    (2020, 1), -- English Premier League, Season 2020
    (2021, 1), -- English Premier League, Season 2021
    (2022, 1), -- English Premier League, Season 2022
    (2021, 2), -- La Liga, Season 2021
    (2022, 2), -- La Liga, Season 2022
    (2021, 3), -- Bundesliga, Season 2021
    (2022, 3), -- Bundesliga, Season 2022
    (2020, 4), -- Serie A, Season 2020
    (2021, 4), -- Serie A, Season 2021
    (2022, 4), -- Serie A, Season 2022
    (2022, 5), -- Ligue 1, Season 2022
    (2020, 1001), -- UEFA Champions League, Season 2020
    (2021, 1001), -- UEFA Champions League, Season 2021
    (2022, 1001), -- UEFA Champions League, Season 2022
    (2021, 1002), -- UEFA Europa League, Season 2018
    (2022, 1002), -- UEFA Europa League, Season 2019
    (2022, 1003), -- UEFA Conference League 2022-2023
    (2022, 1004), -- FIFA Club World Cup 2022-2023
    (2022, 1005), -- UEFA Super Cup 2022-2023
    (2020, 1101), -- Euro 2020
    (2022, 1102), -- World Championship 2022
    (2021, 1103); -- Copa America 2021

INSERT INTO football.National_Tournaments (tournament_id, country_nm)
VALUES
    -- Euro 2020
    (1101, 'Belgium'),
    (1101, 'Italy'),
    (1101, 'France'),
    (1101, 'England'),
    (1101, 'Portugal'),
    (1101, 'Spain'),
    (1101, 'Germany'),

    -- World Championship 2022
    (1102, 'Argentina'),
    (1102, 'Brazil'),
    (1102, 'France'),
    (1102, 'England'),
    (1102, 'Spain'),
    (1102, 'Portugal'),
    (1102, 'Italy'),

    -- Copa America 2021
    (1103, 'Argentina'),
    (1103, 'Brazil'),
    (1103, 'Uruguay'),
    (1103, 'Chile'),
    (1103, 'Colombia'),
    (1103, 'Peru');

INSERT INTO football.Club_Tournaments (tournament_id, command_nm)
VALUES
    -- English Premier League (tournament_id: 1)
    (1, 'Manchester City'),
    (1, 'Liverpool'),
    (1, 'Chelsea'),
    (1, 'Manchester United'),
    -- La Liga (tournament_id: 2)
    (2, 'Real Madrid'),
    (2, 'Barcelona'),
    (2, 'Atletico Madrid'),
    -- Bundesliga (tournament_id: 3)
    (3, 'Bayern Munich'),
    -- Serie A (tournament_id: 4)
    (4, 'Juventus'),
    -- Ligue 1 (tournament_id: 5)
    (5, 'Paris Saint-Germain'),
    -- UEFA Champions League (tournament_id: 1001)
    (1001, 'Real Madrid'),
    (1001, 'Chelsea'),
    (1001, 'Manchester City'),
    (1001, 'Paris Saint-Germain'),
    (1001, 'Bayern Munich'),
    -- UEFA Europa League (tournament_id: 1002)
    (1002, 'Manchester United'),
    (1002, 'Roma'),
    -- UEFA Conference League (tournament_id: 1003)
    (1003, 'Roma'),
    -- FIFA Club World Cup (tournament_id: 1004)
    (1004, 'Real Madrid'),
    (1004, 'Bayern Munich'),
    (1004, 'Liverpool'),
    -- UEFA Super Cup (tournament_id: 1005)
    (1005, 'Chelsea'),
    (1005, 'Bayern Munich'),
    (1005, 'Liverpool');
