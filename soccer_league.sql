DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (id SERIAL PRIMARY KEY,
                    team_name TEXT NOT NULL);

CREATE TABLE players (id SERIAL PRIMARY KEY,
                    player_name TEXT NOT NULL,
                    birthday DATE NOT NULL,
                    height FLOAT,
                    current_team_id INTEGER REFERENCES teams ON DELETE CASCADE);

CREATE TABLE referees (id SERIAL PRIMARY KEY,
                    referee_name TEXT NOT NULL);

CREATE TABLE matches (id SERIAL PRIMARY KEY,
                     match_location TEXT NOT NULL,
                     match_date DATE NOT NULL,
                     start_time TIMESTAMP,
                     home_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
                     away_team_id INTEGER REFERENCES teams ON DELETE CASCADE,
                     season_id INTEGER REFERENCES seasons ON DELETE CASCADE,
                     main_referee_id INTEGER REFERENCES referees ON DELETE CASCADE,
                     asst_ref_1_id INTEGER REFERENCES referees ON DELETE CASCADE,
                     asst_ref_1_id INTEGER REFERENCES referees ON DELETE CASCADE);

CREATE TABLE lineups (id SERIAL PRIMARY KEY, 
                     player_id INTEGER REFERENCES players ON DELETE CASCADE,
                     match_id INTEGER REFERENCES matches ON DELETE CASCADE,
                     team_id INTEGER REFERENCES teams ON DELETE CASCADE);

CREATE TABLE goals (id SERIAL PRIMARY KEY, 
                     player_id INTEGER REFERENCES players ON DELETE CASCADE,
                     match_id INTEGER REFERENCES matches ON DELETE CASCADE);

CREATE TABLE seasons (id SERIAL PRIMARY KEY,
                      start_date DATE,
                      end_date DATE);

CREATE TABLE results (id SERIAL PRIMARY KEY, 
                     team_id INTEGER REFERENCES teams ON DELETE CASCADE,
                     match_id INTEGER REFERENCES matches ON DELETE CASCADE,
                     result TEXT NOT NULL);

