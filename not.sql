create or replace function tbkt_egitim1(_name varchar)
	RETURNS table(oid integer, onmae character varying)
	AS
	$$
	BEGIN
	return QUERY
	select gid,iladi from tr_iller where iladi=_name ;
	END;
	$$
  LANGUAGE 'plpgsql' VOLATILE;
  
  select * from tbkt_egitim1('Ankara');
	
	
create or replace function tbkt_egitim2(_name varchar)
	RETURNS table(oid integer, oname character varying)
	AS
	$$
	DECLARE
		var_r record;
	BEGIN
		FOR var_r IN(
			SELECT gid,iladi FROM tr_iller WHERE iladi LIKE _name)
		LOOP
			oid := var_r.gid; oname :=var_r.iladi;
			RETURN NEXT;
		END LOOP;	
	END;
	$$
  LANGUAGE 'plpgsql' VOLATILE;
  
  select * from tbkt_egitim2('%da%');
  
  
  
create or replace function tbtk_egitim3(_x double precision,_y double precision)
	returns table (poi character varying , road character varying)
	AS
	$$
	DECLARE 
	 loc geometry;
	BEGIN
		loc=st_setsrid(st_makepoint(_x,_y),4326);
		
		select name from points into poi
		where st_dwithin(geom,loc,0.01) and
		name is not null
		order by loc <-> geom limit 5;
		
		loc=st_setsrid(st_makepoint(_x,_y),4326);
		
		select name from roads into road
		where st_dwithin(geom,loc,0.0000001) and
		name is not null
		order by loc <-> geom limit 5;
		
		return next;
	END;
	$$
    LANGUAGE 'plpgsql' VOLATILE;
	
	select * from tbtk_egitim3(32.78981,39.95935);
	
		
		
	