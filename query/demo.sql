-- INSERT 
select insert_stadium_infor('ha noi','hang day',20000);
select insert_stadium_infor('ha noi','hang day',30000);
select * from view_stadium_infor;
select insert_stadium_infor('lach tray');
select insert_club_infor('ha noi','VN');
select insert_club_infor('hai phong','VN');

-- SORTING
select * from sort_club('club_name','asc');
select * from sort_club('country','desc');
select insert_league_infor('Thai League 1','1995-1996','Buriram United');
select insert_lyear_infor('vleague 1','2019-2020',13,'Ha noi',52,'Rimario',18);
select * from sort_season('goals','desc') where goals is not null;

-- DELETE
select delete_stadium_infor('ha noi');
select delete_club_infor('ha noi');
select delete_lyear_infor('Serie A','2022-2023')


-- SEARCH
select * from search_player_infor('Gabriel Jesus');
select * from search_season_infor('Serie A','2019-2020');

-- TRIGGER FUNCTION

insert into lyear values(300,'2041-2042',20,'Liverpool',93,'Son Heung-min, Mohamed Salah',23,1);
insert into lyear values(301,'2041-2042',20,'Liverpool',93,'Son Heung-min, Mohamed Salah',23,1);

delete from lyear 
where season = '2041-2042';


insert into stats(match_id, player_id, goal, assists) values(2, 1, 0, 1);
insert into stats(match_id, player_id, goal, assists) values(3, 1, 0, 1);
insert into stats(match_id, player_id, goal, assists) values(4, 1, 0, 1);
insert into stats(match_id, player_id, goal, assists) values(5, 1, 0, 1);

delete from stats where match_id = 4;
select match_id, player_id, goal, assists from stats
order by match_id desc;

select * from match;
SELECT * FROM public.standings
ORDER BY lyear_id ASC, points desc;


SELECT * FROM pg_catalog.pg_user;
SELECT * FROM pg_catalog.pg_roles;

SELECT * FROM information_schema.table_privileges
where grantee not in ('postgres', 'PUBLIC');

SELECT * FROM information_schema.role_table_grants
where grantee not in ('postgres', 'PUBLIC');

SELECT * FROM information_schema.usage_privileges
where grantee not in ('postgres', 'PUBLIC');
