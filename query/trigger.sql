-- 1. Trigger update the team won the most titles
create or replace function update_league()
    returns trigger as $$
begin 
	update league l
	set won_most_title_club = (select champion from 
		(select count(*), champion from lyear
		where league_id = new.league_id and champion is not null
		group by champion 
		 order by count desc
		 limit 1) r)
	where l.league_id = new.league_id;
	return new;
end;
$$ language plpgsql;

create trigger trigger_league
after insert on lyear
for each row 
execute procedure update_league();

-- Test trigger
-- insert into lyear values(300,'2041-2042',20,'Liverpool',93,'Son Heung-min, Mohamed Salah',23,1);
-- insert into lyear values(301,'2041-2042',20,'Liverpool',93,'Son Heung-min, Mohamed Salah',23,1);

-- delete from lyear 
-- where season = '2041-2042';

-- 2 insert stats

drop function if exists insert_stats cascade;
create or replace function insert_stats()
	returns trigger as $$
	begin 
		update is_member
		set match_played = match_played + 1, 
			goal = goal + new.goal,
			assist = assist + new.assists
		where player_id = new.player_id 
		and season = (select season from lyear where lyear_id = 
					(select lyear_id from match where match.match_id = new.match_id)); 
		return new;
	end;
$$ language plpgsql;

drop trigger if exists trigger_ismember_insert on stats;
create trigger trigger_ismember_insert
after insert on stats
for each row execute procedure insert_stats();

-- 3 delete stats
drop function if exists delete_stats cascade;
create or replace function delete_stats()
	returns trigger as $$
	begin 
		update is_member 
		set match_played = match_played - 1,
			goal = goal - old.goal,
			assist = assist - old.assists
		where player_id = old.player_id 
		and season = (select season from lyear where lyear_id = 
					(select lyear_id from match where match.match_id = old.match_id)); 
			return old;
	end;
$$ language plpgsql;

drop trigger if exists trigger_ismember_update on stats;
create trigger  trigger_ismember_update
after delete on stats
for each row execute procedure delete_stats();


-- 4 update stats
drop function if exists update_stats cascade;
create or replace function update_stats()
	returns trigger as $$
	begin 
		update is_member 
		set goal = goal - old.goal + new.goal, 
			assist = assist - old.assists + new.assists
		where player_id = new.player_id 
		and season = (select season from lyear where lyear_id = 
					(select lyear_id from match where match.match_id = new.match_id)); 
			return new;
	end;
$$ language plpgsql;

drop trigger if exists trigger_ismember_update on stats;
create trigger trigger_ismember_update
after update on stats
for each row execute procedure update_stats();

-- insert into stats(match_id, player_id, goal, assists) values(2, 1, 0, 1);
-- insert into stats(match_id, player_id, goal, assists) values(3, 1, 0, 1);
-- insert into stats(match_id, player_id, goal, assists) values(4, 1, 0, 1);
-- insert into stats(match_id, player_id, goal, assists) values(5, 1, 0, 1);

-- delete from stats where match_id = 4;
-- select match_id, player_id, goal, assists from stats
-- order by match_id desc;


-- 5. Trigger update standings when inserting match record
drop function if exists insert_match() cascade;
create or replace function insert_match()
	returns trigger as $$
	declare G int;
		GA int;
	begin 
		G := cast(substring(new.score, 2, 1) as integer);
		GA := cast(substring(new.score, 6, 1) as integer);
		-- update for home team
		update standings
		set goal = goal + G, goal_against = goal_against + GA,
			pts = pts + G - GA, match_play = match_play + 1
		where club_id = new.home_club_id and lyear_id = new.lyear_id;
		-- update for away team
		update standings
		set goal = goal + GA, goal_against = goal_against + G,
			pts = pts - G + GA, match_play = match_play + 1
		where club_id = new.away_club_id and lyear_id = old.lyear_id;
		if G > GA then
			-- Home wins
			update standings
			set points = points + 3
			where club_id = new.home_club_id and lyear_id = new.lyear_id;
		elsif G < GA then 
			-- Away wins 
			update standings
			set points = points + 3
			where club_id = new.away_club_id and lyear_id = new.lyear_id;
		else 
			update standings
			set points = points + 1
			where (club_id = new.home_club_id or club_id = new.away_club_id) and lyear_id = new.lyear_id;
		end if;
		return new;
	end;
$$ language plpgsql;

drop trigger if exists trigger_insert_match on match;
create trigger trigger_insert_match
after insert on match
for each row execute procedure insert_match();

-- 6. Delete match
drop function if exists delete_match() cascade;
create or replace function delete_match()
	returns trigger as $$
	declare G int;
		GA int;
	begin 
		G := cast(substring(old.score, 2, 1) as integer);
		GA := cast(substring(old.score, 6, 1) as integer);
		-- update for home team
		update standings
		set goal = goal - G, goal_against = goal_against - GA,
			pts = pts - G + GA, match_play = match_play - 1
		where club_id = old.home_club_id and lyear_id = old.lyear_id;
		-- update for away team
		update standings
		set goal = goal - GA, goal_against = goal_against - G,
			pts = pts + G - GA, match_play = match_play - 1
		where club_id = old.away_club_id and lyear_id = old.lyear_id;
		if G > GA then
			-- Home wins
			update standings
			set points = points - 3
			where club_id = old.home_club_id and lyear_id = old.lyear_id;
		elsif G < GA then 
			-- Away wins 
			update standings
			set points = points - 3
			where club_id = old.away_club_id and lyear_id = old.lyear_id;
		else 
			update standings
			set points = points - 1
			where (club_id = old.home_club_id or club_id = old.away_club_id)
			and lyear_id = old.lyear_id;
		end if;
		return old;
	end;
$$ language plpgsql;

drop trigger if exists trigger_delete_match on match;
create trigger trigger_delete_match
after delete on match
for each row execute procedure delete_match();