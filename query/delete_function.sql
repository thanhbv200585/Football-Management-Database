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
	delete from is_member where clbId=club_id;
	delete from standings where clbId=club_id;
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
	--delete lyear infor
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