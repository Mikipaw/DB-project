create index idx_season_id
    on football.seasons(season_id);

create index idx_footballer_nm
    on football.players (name);

create index idx_award_id
    on football.nominations (award_id);

create index idx_tournament_id
    on football.tournaments (tournament_id);

create index idx_country
    on football.national_teams (country_nm);