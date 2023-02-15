select insert_stadium_infor('ha noi','hang day',20000);
select insert_stadium_infor('ha noi','hang day',30000);
select insert_stadium_infor('lach tray');
select insert_club_infor('ha noi','VN');
select insert_club_infor('hai phong','VN');
select * from sort_club('club_name','asc');
select * from sort_club('country','desc');
select insert_league_infor('Thai League 1','1995-1996','Buriram United');
select insert_lyear_infor('vleague 1','2019-2020',13,'Ha noi',52,'Rimario',18);
select * from sort_season('goals','desc')
select delete_stadium_infor('lach tray');
select delete_club_infor('ha noi');
select delete_lyear_infor('Serie A','2022-2023')
select * from search_player_infor('Gabriel Jesus');
select * from search_season_infor('Serie A','2019-2020');
