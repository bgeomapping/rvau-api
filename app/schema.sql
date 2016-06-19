CREATE TABLE League
(
	league_year INT NOT NULL,
	league_type TEXT NOT NULL,
	PRIMARY KEY (league_year, league_type)
);
CREATE TABLE Team
(
	team_name TEXT NOT NULL PRIMARY KEY
);

CREATE TABLE LeaguePlayer
(
	league_year INT NOT NULL,
	league_type TEXT NOT NULL,
	team_name TEXT NOT NULL,
	player_first_name TEXT NOT NULL,
	player_last_name TEXT NOT NULL,

	FOREIGN KEY (team_name) 
		REFERENCES Team(team_name)
		ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (league_year, league_type)
		REFERENCES League(league_year, league_type)
		ON UPDATE CASCADE ON DELETE NO ACTION,
	FOREIGN KEY (player_first_name, player_last_name)
		REFERENCES Player(first_name, last_name)
		ON UPDATE CASCADE ON DELETE CASCADE,
	UNIQUE (league_year, league_type, team_name, player_first_name, player_last_name)
);

CREATE TABLE Player
(
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT,
	PRIMARY KEY (first_name, last_name)
);

CREATE TABLE Game
(
	game_date DATE NOT NULL,
	game_type TEXT NOT NULL,
	league_year INTEGER NOT NULL,
	league_type TEXT NOT NULL,
	home_team TEXT NOT NULL,
	away_team TEXT NOT NULL,
	home_score INTEGER DEFAULT(0),
	away_score INTEGER DEFAULT(0),

	FOREIGN KEY (away_team) 
		REFERENCES Team(team_name)
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (home_team) 
		REFERENCES Team(team_name)
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	FOREIGN KEY (league_year, league_type) 
		REFERENCES League(league_year, league_type)
		ON UPDATE CASCADE ON DELETE NO ACTION,
	UNIQUE (game_date, game_type, league_year, league_type, home_team, away_team)
);


--Enable Cascade
pragma foreign_keys=on;