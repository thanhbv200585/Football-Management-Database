explain
select club_id from club where club_name = 'Arsenal';
create index on club using hash(club_name);

select * from where name = ''
create index on league using hash(name);
create index on lyear using hash(season);

explain 
select * from lyear where season > '2018-2019';

create index on match(home_club_id);
create index on match(match_id);

explain
select * from match where match_id = 10;

explain
select * from match where home_club_id = 10;

-- Player table

create index on player(player_name);
explain
select * from player where player_id = 100;

explain 
select * from player where player_name = 'Miguel Almirón';