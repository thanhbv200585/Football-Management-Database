revoke create on schema public from public;
revoke all privileges on database football_management_system from public;
-- revoke all on database football_management_system from viewer, customer, team_leader;
-- REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM viewer, customer, team_leader;
-- REVOKE ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public FROM viewer, customer, team_leader;
-- REVOKE ALL PRIVILEGES ON ALL FUNCTIONS IN SCHEMA public FROM viewer, customer, team_leader;
-- 1. Role Viewer

drop role if exists viewer;
create role viewer;
grant connect on database football_management_system to viewer;

grant usage on schema public to viewer;
grant select on all tables in schema public to viewer;
alter default privileges in schema public grant select on tables to viewer;
alter default privileges in schema public revoke select on tables from viewer;
revoke select on public.stats from viewer;

-- 2. View customer
drop role if exists customer;
create role customer;

grant connect on database football_management_system to customer;
grant usage on schema public to customer;
grant select on all tables in schema public to customer;
alter default privileges in schema public grant select on tables to customer;
grant usage on all sequences in schema public to customer;
alter default privileges in schema public grant usage on sequences to customer;



-- 3. Team leader
drop role if exists team_leader;
create role team_leader;

grant connect on database football_management_system to team_leader;
grant usage on schema public to team_leader;
grant select, insert, delete, update on all tables in schema public to team_leader;
alter default privileges in schema public grant select, insert, delete, update on tables to team_leader;
grant usage on all sequences in schema public to team_leader;
alter default privileges in schema public grant usage on sequences to team_leader;


-- 4. Admin as a superuser
create role admin_system superuser login;



create user app_reporting_user1 with password 'password1';
-- drop user app_reporting_user1;
create user app_reporting_user2 with password 'password2';
create user app_user1 with password 'password3';
create user app_user2 with password 'password4';

grant viewer to app_reporting_user1;
grant viewer to app_reporting_user2;
grant read_write to app_user1;
grant read_write to app_user2;



