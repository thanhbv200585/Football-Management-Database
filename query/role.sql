revoke create on schema public from public;
revoke all on database final_project from public;

drop role app_readonly;
create role app_readonly;

grant connect on database final_project to app_readonly;
create schema app_schema;
grant usage on schema app_schema to app_readonly;
grant select on all tables in schema app_schema to app_readonly;
alter default privileges in schema app_schema grant select on tables to app_readonly;


drop role read_write;
create role read_write;

grant connect on database final_project to read_write;
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

grant app_readonly to app_reporting_user1;
grant app_readonly to app_reporting_user2;
grant read_write to app_user1;
grant read_write to app_user2;



