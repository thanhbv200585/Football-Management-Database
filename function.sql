-- SELECT ALL VIEWS IN SCHEMA --

	--view one player or compare--	
create or replace function search_player_infor(name text)
returns setof view_player_infor as $$
	select * from view_player_infor where player_name=name;
 $$ language sql;
	--view stadium infor
create or replace function search_stadium_infor(name1 text)
returns setof view_stadium_infor as $$
	select * from view_stadium_infor where team=name1;
	$$ language sql;
	--view player passing
create or replace function search_player_passing(name text)
returns setof view_player_passing as $$
	select * from view_player_passing where player_name=name;
	$$ language sql;
	--view player passtype
create or replace function search_player_passtype(name text)
returns setof view_player_passtype as $$
	select * from view_player_passtype where player_name=name;
	$$ language sql;
	--view player possessison
create or replace function search_player_possession(name text)
returns setof view_player_possession as $$
	select * from view_player_possession where player_name=name;
	$$ language sql;
	--view player defensive_action
create or replace function search_player_defensive_action(name text)
returns setof view_player_defensive_action as $$
	select * from view_player_defensive_action where player_name=name;
	$$ language sql;
	--view player shoot
create or replace function search_player_shoot(name text)
returns setof view_player_shoot as $$
	select * from view_player_shoot where player_name=name;
	$$ language sql;
	--view league information
create or replace function search_season_infor(name1 text,name2 text)
returns view_season_infor as $$
	select * from view_season_infor where "name"=name1 and season=name2;
	$$ language sql;
	--view league history
create or replace function search_league_history(name1 text)
returns setof view_season_infor as $$
	select * from view_season_infor where name=name1;
	$$ language sql;
	--view first champion
create or replace function search_first_champion(name1 text)
returns view_league_history as $$
	select * from view_league_history where name=name1;
	$$ language sql;
	--view rank infor
create or replace function search_rank_infor(name1 text,name2 text)
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
	goal_against from view_rank_infor where "name"=name1 and season=name2; 
	$$ language sql;
	--view player record
create or replace function search_player_record(name1 text, name2 text)
returns view_ismember_infor as $$
	select * from view_ismember_infor where player_name=name1 and club_name=name2;
	$$ language sql;
--example
select * from search_rank_infor('epl','2015-2016')

-- DELETIONS --


-- SEARCHING --


-- SORTING --


-- INSERTION --



-- MODIFICATION --




