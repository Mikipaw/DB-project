create schema if not exists football;

CREATE TABLE if not exists football.Sponsors (
    sponsor_nm      VARCHAR(40) PRIMARY KEY,
    country_nm      VARCHAR(30) NOT NULL,
    category        VARCHAR(30) NOT NULL
);

CREATE TABLE if not exists football.Football_Clubs (
    command_nm      VARCHAR(40) PRIMARY KEY,
    sponsor_nm      VARCHAR(30) REFERENCES football.Sponsors (sponsor_nm),
    transfer_budget INTEGER,
    coach           VARCHAR(50),
    city_nm         VARCHAR(40) NOT NULL
);

CREATE TABLE if not exists football.National_Teams (
    country_nm      VARCHAR(30) PRIMARY KEY
);

CREATE TABLE if not exists football.Players (
    name         VARCHAR(50) PRIMARY KEY,
    command_nm   VARCHAR(30) REFERENCES football.Football_Clubs (command_nm),
    national_nm  VARCHAR(20) REFERENCES football.National_Teams (country_nm),
    salary       INTEGER     NOT NULL,
    market_value INTEGER     NOT NULL,
    joindate     TIMESTAMP   NOT NULL
);

CREATE TABLE if not exists football.Nominations (
    player_nm       VARCHAR(50) REFERENCES football.Players (name),
    award_id        INTEGER     PRIMARY KEY,
    season_id       INTEGER     REFERENCES football.Seasons (season_id),
    description_txt TEXT        NOT NULL
);

CREATE TABLE if not exists football.Awards (
    award_id        INTEGER     PRIMARY KEY,
    award_nm        VARCHAR(40) NOT NULL,
    tournament_id   INTEGER     REFERENCES football.Tournaments (tournament_id)
);

CREATE TABLE if not exists football.Seasons (
    season_id       INTEGER     PRIMARY KEY,
    season_start    TIMESTAMP   NOT NULL,
    season_end      TIMESTAMP   NOT NULL
);

CREATE TABLE if not exists football.Tournament_Seasons (
    season_id       INTEGER     REFERENCES football.Seasons (season_id),
    tournament_id   INTEGER     REFERENCES football.Tournaments (tournament_id)
);

CREATE TABLE if not exists football.Tournaments (
    tournament_id   INTEGER     PRIMARY KEY,
    place_nm        VARCHAR(40) NOT NULL,
    winner_nm       VARCHAR(30) NOT NULL,
    prize_pool      INTEGER     NOT NULL
);

CREATE TABLE if not exists football.National_Tournaments (
    tournament_id   INTEGER     REFERENCES football.Tournaments (tournament_id),
    country_nm      VARCHAR(30) REFERENCES football.National_Teams (country_nm)
);

CREATE TABLE if not exists football.Club_Tournaments (
    tournament_id   INTEGER     REFERENCES football.Tournaments (tournament_id),
    command_nm      VARCHAR(40) REFERENCES football.Football_Clubs (command_nm)
);
