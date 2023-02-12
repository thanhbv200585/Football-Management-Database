
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
	foreign key(club_id) references club(club_id) on delete set null,
	foreign key(lyear_id) references lyear(lyear_id) on delete set null,
	primary key(club_id, lyear_id)
);	