	--sort_club
create or replace function sort_club(order_by text,trend text)
	returns setof view_club as $$
	begin
	return query execute 
	'select * from view_club
	order by ' || quote_ident(order_by) ||' '|| trend || ' ;';
	end;
$$ language plpgsql;

	--sort_stadium
create or replace function sort_stadium(order_by text,trend text)
	returns setof view_stadium_infor as $$
	begin
	return query execute 
	'select * from view_stadium_infor 
	order by ' || quote_ident(order_by) ||' '|| trend || ' ;';
	end;
$$ language plpgsql;
	--sort stats
create or replace function sort_stats(order_by text,trend text) -- còn hàm này
	returns setof view_player_full_stats as $$
	begin
	return query execute 
	'select * from view_player_full_stats 
	order by ' || quote_ident(order_by) ||' '|| trend || ' ;';
	end;
$$ language plpgsql;
	--sort player record
create or replace function sort_player_record(order_by text,trend text)
	returns setof view_ismember_infor as $$
	begin
	return query execute 
	'select * from view_ismember_infor 
	order by ' || quote_ident(order_by) ||' '|| trend || ' ;';
	end;
$$ language plpgsql;
	--sort league
	create or replace function sort_league(order_by text,trend text)
	returns setof view_rank_infor as $$
	begin
	return query execute 
	'select * from view_rank_infor 
	order by ' || quote_ident(order_by) ||' '|| trend || ' ;';
	end;
$$ language plpgsql;
	--sort player information
	create or replace function sort_player_infor(order_by text,trend text)
	returns setof view_player_infor as $$
	begin
	return query execute 
	'select * from view_player_infor 
	order by ' || quote_ident(order_by) ||' '|| trend || ' ;';
	end;
$$ language plpgsql;
	--sort season infor
	create or replace function sort_season(order_by text,trend text)
	returns setof view_season_infor as $$
	begin
	return query execute 
	'select * from view_season_infor 
	order by ' || quote_ident(order_by) ||' '|| trend || ' ;';
	end;
$$ language plpgsql;