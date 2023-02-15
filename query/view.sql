	--1.view player information--
create or replace view view_player_infor as select 
	player_name ,nation ,positions ,age from player;
	--2.view stadium information--
create or replace view view_stadium_infor as 
	select team,name,capacity from stadium;
	--3.view passing information--
create or replace view view_player_passing as
	select player_name,
	h.club_name as home,
	"a".club_name as away,
	short_passes_completed,
	short_passes_attempted,
	long_passes_completed,
	long_passes_attempted,
	assists from stats join player on player.player_id=stats.player_id
						  join match on stats.match_id=match.match_id
						  join club h on home_club_id=h.club_id
						  join club "a" on away_club_id="a".club_id;
	--4.view passtype information--
create or replace view view_player_passtype as
	select player_name,
	h.club_name as home,
	"a".club_name as away,
	live, 
	dead,
	free_kick,
	TB , -- completed passes sent between back defenders into open space
	sw , -- pass > 40 yards
	TI , -- throws-in taken 
	CK from stats join player on player.player_id=stats.player_id
						  join match on stats.match_id=match.match_id
						  join club h on home_club_id=h.club_id
						  join club "a" on away_club_id="a".club_id;
	--5.view possessison information--
create or replace view view_player_possession as
	select player_name,
	h.club_name as home,
	"a".club_name as away,
	def_pen, -- Touches in penalty area
	def_3rd, -- Touches in defensive 1/3
	mid_3rd, -- Touch in middle 1/3
	att_3rd, -- Touch in attacking 1/3 
	succ, -- Dribbles completed successfully
	att, -- Dribbles attempted
	mis, -- Number of times a player when attempting to gain control of a ball
	dis from stats join player on player.player_id=stats.player_id
						  join match on stats.match_id=match.match_id
						  join club h on home_club_id=h.club_id
						  join club "a" on away_club_id="a".club_id;
	--6.view defensive action information--
create or replace view view_player_defensive_action as
	select player_name,
	h.club_name as home,
	"a".club_name as away,
	tkl_def_3rd, -- Tackles in defensive 1/3
	tkl_mid_3rd, -- Tackles in middle 1/3
	tkl_att_3rd, -- Tackles in attacking 1/3
	dribbler_tkl, -- Number of dribblers tackled
	dribbled_att, -- Number of times dribbled past plus number of tackles
	inceptions,
	pass_block, -- Number of times blocking a pass by standing in its path
	shot_block from stats join player on player.player_id=stats.player_id
						  join match on stats.match_id=match.match_id
						  join club h on home_club_id=h.club_id
						  join club "a" on away_club_id="a".club_id;
	--7.view shot action--
create or replace view view_player_shoot as
	select player_name,
	h.club_name as home,
	"a".club_name as away,
	total_shot,
	goal, 
	shot_on_target,
	penalty_made,
	penalty_attempted,
	average_distance from stats join player on player.player_id=stats.player_id
								join match on stats.match_id=match.match_id
								join club h on home_club_id=h.club_id
								join club "a" on away_club_id="a".club_id;
	--8.view season information
create or replace view view_season_infor as
	select "name",
	season,
	num_of_squad,
	champion,
	champion_point,
	top_scorer_name,
	goals from lyear join league on lyear.league_id=league.league_id;
	--9.view history of league--
create or replace view view_league_history as
	select
	name ,
	first_season,
	won_most_title_club from league;
	
	--10.view all club in a league
create or replace view view_rank_infor as
	select club_name,"name",season,
	match_play ,
	points ,
	pts,
	goal,
	goal_against
	from standings join club on club.club_id = standings.club_id
			  join lyear on lyear.lyear_id=standings.lyear_id
			  join league on lyear.league_id=league.league_id
			  order by points asc;
	--11.view player record
create or replace view view_ismember_infor as
	select player_name,club_name,season,
	match_played,
	goal,
	assist from is_member join player on player.player_id=is_member.player_id
						  join club on club.club_id=is_member.club_id;

	-- 12. view for club
create or replace view view_club_infor as
	select club_name, country, "name" from club "c" join stadium s on "c".stadium_id=s.stadium_id;

	-- 13 view for match
create or replace view view_match_infor as 
	select h.club_name home, a.club_name away, season,
		m.score, m.attendance, m.referee from match m 
						join club h on m.home_club_id = h.club_id
						join club a on m.away_club_id = a.club_id
						join lyear on lyear.lyear_id=m.lyear_id;
	--view player full stats
create or replace view view_player_full_stats as
	select player_name,
	h.club_name as home,
	"a".club_name as away,
	short_passes_completed,
	short_passes_attempted,
	long_passes_completed,
	long_passes_attempted,
	assists,
	live, 
	dead,
	free_kick,
	TB , -- completed passes sent between back defenders into open space
	sw , -- pass > 40 yards
	TI , -- throws-in taken 
	CK,
	def_pen, -- Touches in penalty area
	def_3rd, -- Touches in defensive 1/3
	mid_3rd, -- Touch in middle 1/3
	att_3rd, -- Touch in attacking 1/3 
	succ, -- Dribbles completed successfully
	att, -- Dribbles attempted
	mis, -- Number of times a player when attempting to gain control of a ball
	dis,
	tkl_def_3rd, -- Tackles in defensive 1/3
	tkl_mid_3rd, -- Tackles in middle 1/3
	tkl_att_3rd, -- Tackles in attacking 1/3
	dribbler_tkl, -- Number of dribblers tackled
	dribbled_att, -- Number of times dribbled past plus number of tackles
	inceptions,
	pass_block, -- Number of times blocking a pass by standing in its path
	shot_block,
	total_shot,
	goal, 
	shot_on_target,
	penalty_made,
	penalty_attempted,
	average_distance
	from stats join player on player.player_id=stats.player_id
						  join match on stats.match_id=match.match_id
						  join club h on home_club_id=h.club_id
						  join club "a" on away_club_id="a".club_id;
