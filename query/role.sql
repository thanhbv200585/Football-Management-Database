grant create on schema public to public;
revoke all on database DS2_database from public;

drop role if exists viewer;
create role viewer;
grant connect on database library to viewer;

grant usage on schema public to viewer;
grant select on all tables in schema public to viewer;
alter default privileges in schema public grant select on tables to viewer;

drop role if exists customer;
create role customer;

grant connect on database public to read_write;
grant usage, create on schema app_schema to read_write;
grant select, insert, update, delete on all tables in schema app_schema to read_write;
alter default privileges in schema app_schema grant select, insert, update, delete on tables to read_write;
grant usage on all sequences in schema app_schema to read_write;
alter default privileges in schema app_schema grant usage on sequences to read_write;


create user app_reporting_user1 with password 'password1';
-- drop user app_reporting_user1;
create user app_reporting_user2 with password 'password2';
create user app_user1 with password 'password3';
create user app_user2 with password 'password4';

grant viewer to app_reporting_user1;
grant viewer to app_reporting_user2;
grant read_write to app_user1;
grant read_write to app_user2;

select * from club
order by 2;


