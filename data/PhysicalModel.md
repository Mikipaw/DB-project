# Физическая модель

---

Таблица `Players`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `name `         | Имя футболиста     | `VARCHAR(50)`  | `PRIMARY KEY` |
| `command_nm`    | Клуб               | `VARCHAR(30)`  | `FOREIGN KEY` |
| `national_nm`   | Сборная            | `VARCHAR(20)`  | `FOREIGN KEY` |
| `salary`        | Зарплата           | `INTEGER`      | `NOT NULL`    |
| `market_value`  | Рыночная стоимость | `INTEGER`      | `NOT NULL`    |
| `joindate`      | Дата присоединения | `TIMESTAMP`    | `NOT NULL`    |

Таблица `Nominations`:

| Название             | Описание                                         | Тип данных     | Ограничение   |
|----------------------|--------------------------------------------------|----------------|---------------|
| `player_nm`          | Имя футболиста                                   | `VARCHAR(50)`  | `FOREIGN KEY` |
| `award_id`           | Идентификатор награды                            | `INTEGER`      | `PRIMARY KEY` |
| `season_id`          | Сезон, в котором вручалась награда               | `INTEGER`      | `FOREIGN KEY` |
| `description_txt`    | Описание награды                                 | `TEXT`         | `NOT NULL`    |

Таблица `Awards`:

| Название    | Описание                        | Тип данных  | Ограничение   |
|-------------|---------------------------------|-------------|---------------|
| `award_id`  | Идентификатор награды           | `INTEGER`   | `PRIMARY KEY` |
| `award_nm`  | Название награды                | `VARCHAR(20)`| `NOT NULL  ` |
| `tournament_id`|Идентификатор турнира         | `INTEGER`   | `FOREIGN KEY` |

Таблица `Seasons`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `season_id`     | Идентификтор сезона| `INTEGER    `  | `PRIMARY KEY` |
| `season_start`  | Дата начала сезона | `TIMESTAMP`    | `NOT NULL`    |
| `season_end`    | Дата конца сезона  | `TIMESTAMP`    | `NOT NULL`    |

Таблица `Tournament_Seasons`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `season_id`     | ID сезона          | `INTEGER    `  | `FOREIGN KEY` |
| `tournament_id` | ID турнира         | `INTEGER`      | `FOREIGN KEY` |

Таблица `Tournaments`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `tournament_id` | ID турнира         | `INTEGER    `  | `PRIMARY KEY` |
| `place_nm  `    | Точка проведения   | `VARCHAR(40)`  | `NOT NULL`    |
| `winner_nm  `   | Победитель         | `VARCHAR(30)`  | `FOREIGN KEY`|
| `prize_pool`    | Призовой фонд      | `INTEGER`      | `NOT NULL`    |

Таблица `National_Tournaments`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `tournament_id` | ID турнира         | `INTEGER    `  | `FOREIGN KEY` |
| `country_nm`    | Сборная            | `VARCHAR(30)`  | `FOREIGN KEY` |

Таблица `National_Teams`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `country_nm`    | Название сборной   | `VARCHAR(30)`  | `PRIMARY KEY` |

Таблица `Club_Tournaments`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `tournament_id` | ID турнира         | `INTEGER    `  | `FOREIGN KEY` |
| `command_nm`    | Название клуба     | `VARCHAR(40)`  | `FOREIGN KEY` |


Таблица `Football_Clubs`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `command_nm`    | Имя команды        | `VARCHAR(40)`  | `PRIMARY KEY` |
| `sponsor_nm`    | Титульный спонсор  | `VARCHAR(30)`  | `FOREIGN KEY` |
| `transfer_budget`| Трансферный бюджет | `INTEGER   `  |               |
| `coach `        | Главный тренер     | `VARCHAR(50)`  |     |
| `city_nm     `  | Город клуба        | `VARCHAR(40)`  | `NOT NULL`    |


Таблица `Sponsors`:

| Название        | Описание           | Тип данных     | Ограничение   |
|-----------------|--------------------|----------------|---------------|
| `sponsor_nm`    | Имя спонсора       | `VARCHAR(40)`  | `PRIMARY KEY` |
| `country_nm`    | Страна спонсора    | `VARCHAR(30)`  | `NOT NULL`    |
| `category   `   | Категория          | `VARCHAR(30)`  | `NOT NULL`    |

---
Таблица `Players`:
```postgresql
CREATE TABLE Players (
  name          VARCHAR(50) PRIMARY KEY,
  command_nm    VARCHAR(30) REFERENCES Football_Clubs (command_nm),
  national_nm   VARCHAR(20) REFERENCES National_Teams (country_nm),
  salary        INTEGER NOT NULL,
  market_value  INTEGER NOT NULL,
  joindate      TIMESTAMP NOT NULL
);

```
Таблица `Nominations`:
```postgresql
CREATE TABLE Nominations (
    player_nm       VARCHAR(50) REFERENCES Players (name),
    award_id        INTEGER     PRIMARY KEY,
    season_id       INTEGER     REFERENCES Seasons (season_id),
    description_txt TEXT        NOT NULL
);
```
Таблица `Awards`:
```postgresql
CREATE TABLE Awards (
    award_id        INTEGER     PRIMARY KEY,
    award_nm        VARCHAR(20) NOT NULL,
    tournament_id   INTEGER     REFERENCES Tournaments (tournament_id)
);
```
Таблица `Seasons`:
```postgresql
CREATE TABLE Seasons (
    season_id       INTEGER     PRIMARY KEY,
    season_start    TIMESTAMP   NOT NULL,
    season_end      TIMESTAMP   NOT NULL
);
```
Таблица `Tournament_Seasons`:
```postgresql
CREATE TABLE Tournament_Seasons (
    season_id       INTEGER     REFERENCES Seasons (season_id),
    tournament_id   INTEGER     REFERENCES Tournaments (tournament_id)
);
```
Таблица `Tournaments`:
```postgresql
CREATE TABLE Tournaments (
    tournament_id   INTEGER     PRIMARY KEY,
    place_nm        VARCHAR(40) NOT NULL,
    winner_nm       VARCHAR(30) REFERENCES Football_Clubs (command_nm),
    prize_pool      INTEGER     NOT NULL
);
```
Таблица `National_Tournaments`:
```postgresql
CREATE TABLE National_Tournaments (
    tournament_id   INTEGER     REFERENCES Tournaments (tournament_id),
    country_nm      VARCHAR(30) REFERENCES National_Teams (country_nm)
);
```
Таблица `National_Teams`:
```postgresql
CREATE TABLE National_Teams (
    country_nm      VARCHAR(30) PRIMARY KEY
);
```
Таблица `Club_Tournaments`:
```postgresql
CREATE TABLE Club_Tournaments (
    tournament_id   INTEGER     REFERENCES Tournaments (tournament_id),
    command_nm      VARCHAR(40) REFERENCES Football_Clubs (command_nm)
);

```
Таблица `Sponsors`:
```postgresql
CREATE TABLE Sponsors (
    sponsor_nm      VARCHAR(40) PRIMARY KEY,
    country_nm      VARCHAR(30) NOT NULL,
    category        VARCHAR(30) NOT NULL
);
```
Таблица `Football_Clubs`:
```postgresql
CREATE TABLE Football_Clubs (
    command_nm      VARCHAR(40) PRIMARY KEY,
    sponsor_nm      VARCHAR(30) REFERENCES Sponsors (sponsor_nm),
    transfer_budget INTEGER,
    coach           VARCHAR(50),
    city_nm         VARCHAR(40) NOT NULL
);
```