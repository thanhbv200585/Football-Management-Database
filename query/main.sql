-- 1. CREATE DATABASE
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
	player_id serial,
	club_id serial,
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
	home_club_id serial,
	away_club_id serial,
	lyear_id serial,
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
    --CREATE VIEW
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
	--12 view player full stats
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
						  
	--13 view club infor
	create or replace view view_club_infor as
select club_name, country, "name" from club "c" join stadium s on "c".stadium_id=s.stadium_id;
    --SORTING
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
	--12 view player full stats
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
						  
	--13 view club infor
	create or replace view view_club_infor as
select club_name, country, "name" from club "c" join stadium s on "c".stadium_id=s.stadium_id;
    -- 14 view for match
create or replace view view_match_infor as 
	select h.club_name home, a.club_name away, season,
		m.score, m.attendance, m.referee from match m 
						join club h on m.home_club_id = h.club_id
						join club a on m.away_club_id = a.club_id
						join lyear on lyear.lyear_id=m.lyear_id;
    --SEARCHING
--1. search one player or compare--	
drop function if exists search_player_infor;
create or replace function search_player_infor(name text)
returns setof view_player_infor as $$
	select * from view_player_infor where position(name in player_name) <> 0 ;
 $$ language sql;
	--2. search stadium infor
drop function if exists search_stadium_infor;
create or replace function search_stadium_infor(club_name text)
returns setof view_stadium_infor as $$
	select * from view_stadium_infor where position(club_name in team) <> 0;
	$$ language sql;

	--3. search player passing
drop function if exists search_player_passing;
create or replace function search_player_passing(name text)
returns setof view_player_passing as $$
	select * from view_player_passing where position(name in player_name) <> 0 ;
	$$ language sql;
	--4. search player passtype
drop function if exists search_player_passtype;
create or replace function search_player_passtype(name text)
returns setof view_player_passtype as $$
	select * from view_player_passtype where position(name in player_name) <> 0;
	$$ language sql;
	--5. search player possessison
drop function if exists search_player_possession;
create or replace function search_player_possession(name text)
returns setof view_player_possession as $$
	select * from view_player_possession where position(name in player_name) <> 0;
	$$ language sql;
	--6. search player defensive_action
drop function if exists search_player_defensive_action;
create or replace function search_player_defensive_action(name text)
returns setof view_player_defensive_action as $$
	select * from view_player_defensive_action where position(name in player_name) <> 0;
	$$ language sql;
	--7. search player shoot
drop function if exists search_player_shoot;
create or replace function search_player_shoot(name text)
returns setof view_player_shoot as $$
	select * from view_player_shoot where position(name in player_name) <> 0;
	$$ language sql;
	--8. search league information
drop function if exists search_season_infor;
create or replace function search_season_infor(league_name text,season text)
returns view_season_infor as $$
	select * from view_season_infor v where v.name=league_name and v.season=season;
	$$ language sql;
	--9. search league history
drop function if exists search_league_history;
create or replace function search_league_history(league_name text)
returns setof view_season_infor as $$
	select * from view_season_infor where name=league_name;
	$$ language sql;
	--10. search first champion
drop function if exists search_first_champion;
create or replace function search_first_champion(name1 text)
returns view_league_history as $$
	select * from view_league_history where name=name1;
	$$ language sql;
	--11. show rank infor
drop function if exists search_rank_infor;
create or replace function search_rank_infor(league_name text,name2 text)
returns table(club_name text,match_play int,
	points int,
	pts int,
	goal int,
	goal_against int) as $$
	select club_name,
	match_play ,
	points ,
	pts,
	goal,
	goal_against from view_rank_infor where position(league_name in name) <> 0 and season=name2; 
	$$ language sql;
	--12. view player record
drop function if exists search_player_record;
create or replace function search_player_record(player_name text, club_name text)
returns view_ismember_infor as $$
	select * from view_ismember_infor v where position(player_name in v.player_name) <> 0 and position(club_name in v.club_name)<> 0;
	$$ language sql;
	--12 view club infor
drop function if exists search_club_infor;
create or replace function search_club_infor(clb_name text)
returns setof view_club_infor as $$
	select * from view_club_infor where position(clb_name in club_name)<> 0;
	$$ language sql;
    --INSERTING
	--insert stadium
	create or replace function insert_stadium_infor(team text,stadium_name text,capacity integer)
returns void as $$
declare std_id integer;
begin
	select(select count(stadium_id) from stadium) + 1 into std_id;
	insert into stadium values(std_id,team,stadium_name,capacity);
end; $$ language plpgsql;
	--insert club
	create or replace function insert_club_infor(clb_name text,country text)
returns void as $$
declare
	std_id integer;
	clb_id integer;
begin
	select(select count(club_id) from club)+1 into clb_id;
	select(select stadium_id from stadium where team = clb_name) into std_id;
	insert into club values(clb_id,clb_name,country,std_id);
end; $$ language plpgsql;
	--insert player infor
create or replace function insert_player_infor(player_name text,nation text,positions text,age integer)
returns void as $$
declare player_id integer;
begin
	select(select count(player.player_id) from player) + 1 into player_id;
	insert into player values(player_id,player_name,nation,positions,age);
end; $$ language plpgsql;
	--insert league infor
create or replace function insert_league_infor(league_name text,first_season text,won_most_title_club text)
returns void as $$
declare league_id integer;
begin
	select(select count(league.league_id) from league) + 1 into league_id;
	insert into league values(league_id,league_name ,first_season,won_most_title_club);
end; $$ language plpgsql;
	-- insert lyear infor
create or replace function insert_lyear_infor(league_name text,season text,num_of_squad integer,champion text,champion_point integer,top_scorer_name text,goals integer)
returns void as $$
declare
	lyearId integer;
	leagueId integer;
begin
	select(select count(lyear_id) from lyear)+1 into lyearId;
	select(select league_id from lyear where "name"=league_name) into leagueId;
	if leagueId is NULL
	then
		raise notice '% is not exist',league_name;
	else
		insert into lyear values(lyearId,season,num_of_squad,champion,champion_point,top_scorer_name,goals,leagueId);
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
	select(select count(match_id) from "match")+1 into matchId;
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
    --DELETING
--delete stadium infor
create or replace function delete_stadium_infor(stadium_name text)
returns setof stadium as $$
	delete from stadium where "name"=stadium_name returning *;
$$ language sql;
	--delete club infor
create or replace function delete_club_infor(clb_name text)
returns void as $$
declare
	clbId integer;
begin
	select(select club_id from club where clb_name = club_name) into clbId;
	delete from "match" where clbId=home_club_id;
	delete from "match" where clbId=away_club_id;
    delete from standings where clbId=club_id;
	delete from is_member where clbId=club_id;
	delete from club where clbId=club_id;	
end; $$ language plpgsql;
	--delete stats infor
create or replace function delete_stats_infor(playerName text)
returns void as $$
declare playerId integer;
begin
	select(select player_id from player where player_name=playerName) into playerId;
	delete from stats where player_id=playerId;
end; $$ language plpgsql;
    --delete match infor
create or replace function delete_match_infor(league_name text,home text, away text, seasons text)
returns void as $$
declare
	homeId integer;
	awayId integer;
	lyearId integer;
	leagueId integer;
	matchId integer;
begin
	select(select club_id from club where home = club_name) into homeId;
	select(select club_id from club where away = club_name) into awayId;
	select(select league_id from league where league_name="name") into leagueId;
	select(select lyear_id from lyear where leagueId=league_id and season=seasons) into lyearId;
	select(select match_id from "match" where( homeId=home_club_id and awayId=away_club_id and lyearId=lyear_id)) into matchId;
	delete from stats where match_id=matchId;
	delete from "match" where match_id=matchId;
end; $$ language plpgsql;
    	--delete player infor
create or replace function delete_player_infor(playerName text)
returns void as $$
declare playerId integer;
begin
	select(select player_id from player where playerName=player_name) into playerId;
	delete from is_member where player_id=playerId;
	delete from "stats" where player_id=playerId;
	delete from player where player_id=playerId;
end; $$ language plpgsql;
    --delete player record
create or replace function delete_player_record(playerName text)
returns void as $$
declare playerId integer;
begin
	select(select player_id from player where playerName=player_name) into playerId;
	delete from is_member where player_id=playerId;
end; $$ language plpgsql;
    --delete lyear record
create or replace function delete_lyear_infor(league_name text,seasons text)
returns void as $$
declare
	leagueId integer;
	lyearId integer;
begin
	select(select league_id from league where league_name="name") into leagueId;
	select(select lyear_id from lyear where leagueId=league_id and season=seasons) into lyearId;
	delete from "match" where lyear_id=lyearId;
	delete from lyear where lyear_id=lyearId;
end; $$ language plpgsql;
    --delete league infor
create or replace function delete_league_infor(league_name text)
returns void as $$
declare
	leagueId integer;
	lyearId integer;
	matchId integer;
begin
	select(select league_id from league where league_name="name") into leagueId;
	delete from lyear where league_id=leagueId;
	delete from league where league_id=leagueId;
end; $$ language plpgsql;