-- SEARCHING --

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
--example
select * from search_rank_infor('English Premier League','2022-2023');

-- DELETIONS --
-- Delete by name
create or replace function delete_player_by_name(player)


-- SORTING --
create or replace function sort_

-- INSERTION --


-- UPDATE --
drop function if exists update_standings_from_stratch;
create or replace function update_standings_from_stratch()
	returns void as $$
		declare f record;
		G int;
		GA int;
	begin
	update standings 
	set match_play = 0, points = 0, pts = 0, goal = 0, goal_against = 0;
		for f in select * from match	
		loop 
			G := cast(substring(f.score, 2, 1) as integer);
			GA := cast(substring(f.score, 6, 1) as integer);
			-- update for home team
			update standings
			set goal = goal + G, goal_against = goal_against + GA,
				pts = pts + G - GA, match_play = match_play + 1
			where club_id = f.home_club_id;
			-- update for away team
			update standings
			set goal = goal + GA, goal_against = goal_against + G,
				pts = pts - G + GA, match_play = match_play + 1
			where club_id = f.away_club_id;
			if G > GA then
				-- Home wins
				update standings
				set points = points + 3
				where club_id = f.home_club_id;
			elsif G < GA then 
				-- Away wins 
				update standings
				set points = points + 3
				where club_id = f.away_club_id;
			else 
				update standings
				set points = points + 1
				where club_id = f.home_club_id or club_id = f.away_club_id;
			end if;
		end loop;
	end;
$$ language plpgsql;




