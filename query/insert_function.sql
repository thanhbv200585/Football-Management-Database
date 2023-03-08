	--insert stadium
	create or replace function insert_stadium_infor(team text,stadium_name text,capacity integer)
returns void as $$
declare std_id integer;
begin
	select(select stadium_id from stadium where stadium_name="name") into std_id;
	if std_id is NULL
	then
		select(select max(stadium_id) from stadium) + 1 into std_id;
		insert into stadium values(std_id,team,stadium_name,capacity);
		raise notice 'insert success';
	else
		raise notice 'duplicate data';
	end if;
end; $$ language plpgsql;
	--insert club
	create or replace function insert_club_infor(clb_name text,country text)
returns void as $$
declare
	std_id integer;
	clb_id integer;
begin
	select(select club_id from club where club_name = clb_name) into clb_id;
	if clb_id is NULL
	then
		select(select max(club_id) from club)+1 into clb_id;
		select(select stadium_id from stadium where team = clb_name) into std_id;
		insert into club values(clb_id,clb_name,country,std_id);
		raise notice 'insert success';
	else
		raise notice 'duplicate data';
	end if;
end; $$ language plpgsql;
	--insert player infor
create or replace function insert_player_infor(player_name text,nation text,positions text,age integer)
returns void as $$
declare player_id integer;
begin
	select(select max(player.player_id) from player) + 1 into player_id;
	insert into player values(player_id,player_name,nation,positions,age);
	raise notice 'insert success';
end; $$ language plpgsql;
	--insert league infor
create or replace function insert_league_infor(league_name text,first_season text,won_most_title_club text)
returns void as $$
declare leagueId integer;
begin
	select(select league_id from league where league_name="name") into leagueId;
	if leagueId is NULL
	then
		select(select max(league_id) from league) + 1 into leagueId;
		insert into league values(leagueId,league_name ,first_season,won_most_title_club);
		raise notice 'insert success';
	else 
		raise notice 'duplicate data';
	end if;
end; $$ language plpgsql;
	-- insert lyear infor
	drop function if exists insert_lyear_infor;
create or replace function insert_lyear_infor(league_name text,seasons text,num_of_squad integer,champion text,champion_point integer,top_scorer_name text,goals integer)
returns void as $$
declare
	lyearId integer;
	leagueId integer;
begin
	select(select lyear_id from lyear join league on lyear.league_id=league.league_id where (league_name="name" and seasons=season)) into lyearId;
	if lyearId is NULL
	then
		select(select max(lyear_id) from lyear)+1 into lyearId;
		select(select league_id from league where "name"=league_name) into leagueId;
	if leagueId is NULL
	then
		raise notice '% is not exist',league_name;
	else
		insert into lyear values(lyearId,seasons,num_of_squad,champion,champion_point,top_scorer_name,goals,leagueId);
		raise notice 'insert success';
	end if;							 
	else
		raise notice 'duplicate data';
	end if;
end; $$ language plpgsql;
	--insert match infor
create or replace function insert_match_infor(leaugue_name text,home text, away text, seasons text, score text, attendance integer, referee text)
returns void as $$
declare
	homeId integer;
	awayId integer;
	matchId integer;
	lyearId integer;
begin
	select(select max(match_id) from "match")+1 into matchId;
	select(select club_id from club where home=club_name) into homeId;
	select(select club_id from club where away=club_name) into awayId;
	select(select lyear_id from lyear join league on lyear.league_id=league.league_id where season=seasons and leaugue_name="name") into lyearId;
	if homeId is NULL
	then
		raise notice '% is not exist',home;
	elseif awayId is NULL
	then
		raise notice '% is not exist',away;
	elseif lyearId is NULL
	then
		raise notice 'seasons % or % is not exist',seasons,leaugue_name;
	else
		insert into "match" values(matchId,homeId,awayId,lyearId,score,attendance,referee);
	end if;
end; $$ language plpgsql;

	--insert player stats
	create or replace function insert_stats_infor(playerName text,home text, away text, seasons text,short_passes_completed int,
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
	average_distance int)
returns void as $$
declare
	matchId integer;
	playerId integer;
begin
	select(select playerId from player where player_name=playerName) into playerId;
	select(select match_id from "match"
						  join club h on home_club_id=h.club_id
						  join club "a" on away_club_id="a".club_id
		   				  join lyear on "match".lyear_id=lyear.lyear_id where season=seasons and h.club_name=home and "a".club_name=away) into matchId;
	if playerId is NULL
	then
		raise notice '% is not exist',playerId;
	elseif matchId is NULL
	then
		raise notice '% or % or % is not exist',home,away,seasons;
	else
		insert into stats values(matchId,playerId,short_passes_completed,
	short_passes_attempted,
	long_passes_completed,
	long_passes_attempted,
	assists,
	live, 
	dead,
	free_kick,
	TB,
	sw,
	TI,
	CK,
	def_pen,
	def_3rd,
	mid_3rd,
	att_3rd,
	succ,
	att,
	mis,
	dis,
	tkl_def_3rd,
	tkl_mid_3rd,
	tkl_att_3rd,
	dribbler_tkl,
	dribbled_att,
	pass_block,
	shot_block,
	total_shot,
	goal, 
	shot_on_target,
	penalty_made,
	penalty_attempted,
	average_distance);
	end if;
end; $$ language plpgsql;