create table if not exists stadium(
	stadium_id serial primary key,
	team varchar(50),
	name varchar(50),
	capacity int
);

create table if not exists club(
	club_id serial primary key,
	club_name varchar(50),
	country varchar(5),
	stadium_id int,
	foreign key(stadium_id) references stadium(stadium_id) on delete set null
);

create table if not exists player(
	player_id serial primary key,
	player_name varchar(50),
	nation varchar(5),
	positions varchar(10),
	age int
);

create table if not exists is_member(
	player_id int,
	club_id int,
	season varchar(15), -- khoảng thời gian thi đấu. E.g: 2013 - 2016
	match_played int,
	goal int,
	assist int,
    primary key(player_id, club_id, season),
	foreign key(player_id) references player(player_id) on delete set null,
	foreign key(club_id) references club(club_id) on delete set null
);

create table if not exists league(
	league_id serial primary key,
	name varchar(30),
	first_season varchar(10),
	won_most_title_club varchar(30)
);
create table if not exists lyear(
	lyear_id serial primary key,
	season varchar(20),
	num_of_squad int,
	champion varchar(30),
	champion_point int,
	top_scorer_name varchar(50),
	goals int,
	league_id int,
	foreign key(league_id) references league(league_id) on delete set null
);
create table if not exists match(
	match_id serial primary key,
	home_club_id int,
	away_club_id int,
	lyear_id int,
	score varchar(10) not null,
	attendance int not null,
	referee varchar(50)  not null,
	foreign key(lyear_id) references lyear(lyear_id) on delete set null,
	foreign key(home_club_id) references club(club_id) on delete set null,
	foreign key(away_club_id) references club(club_id) on delete set null
);

create table if not exists stats(
	match_id serial,
	player_id serial,
	-- passing -- 
	short_passes_completed int,
	short_passes_attempted int,
	long_passes_completed int,
	long_passes_attempted int,
	assists int,
	-- 	pass type -- 
	live int, 
	dead int,
	free_kick int,
	TB int, -- completed passes sent between back defenders into open space
	sw int, -- pass > 40 yards
	TI int, -- throws-in taken 
	CK int, -- corner kicks
	-- possession --
	def_pen int, -- Touches in penalty area
	def_3rd int, -- Touches in defensive 1/3
	mid_3rd int, -- Touch in middle 1/3
	att_3rd int, -- Touch in attacking 1/3 
	succ int, -- Dribbles completed successfully
	att int, -- Dribbles attempted
	mis int, -- Number of times a player when attempting to gain control of a ball
	dis int, -- Number of times a player loss control of a ball after being tackled by an opposing player
	-- Defensive Action --
	tkl_def_3rd int, -- Tackles in defensive 1/3
	tkl_mid_3rd int, -- Tackles in middle 1/3
	tkl_att_3rd int, -- Tackles in attacking 1/3
	dribbler_tkl int, -- Number of dribblers tackled
	dribbled_att int, -- Number of times dribbled past plus number of tackles
	inceptions int,
	pass_block int, -- Number of times blocking a pass by standing in its path
	shot_block int, -- Number of times blocking a shot by standing in its path
	-- shot --
	total_shot int,
	goal int, 
	shot_on_target int,
-- 	free_kick int, will mention in shot view but it is duplicate 
	penalty_made int,
	penalty_attempted int,
	average_distance int, -- distance of the shot ???
	primary key(match_id, player_id),
	foreign key(match_id) references match(match_id) on delete set null,
	foreign key(player_id) references player(player_id) on delete set null
);

create table if not exists standings(
	lyear_id int,
	club_id int,
	match_play int,
	points int,
	pts int,
	goal int,
	goal_against int,
	primary key(lyear_id,club_id),
	foreign key(club_id) references club(club_id) on delete set null,
	foreign key(lyear_id) references lyear(lyear_id) on delete set null
);