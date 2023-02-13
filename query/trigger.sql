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

-- 2. Trigger update the champion, champion point, top scorer, goals
create or replace function update_lyear()
	returns trigger as
	$$
	begin 
		update lyear 
		set champion = (select champion from (select * from ))
	end;
	$$ language plpgsql;
