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
alter role viewer with login;
-- 2. View customer
drop role if exists customer;
create role customer;

grant connect on database football_management_system to customer;
grant usage on schema public to customer;
grant select on all tables in schema public to customer;
alter default privileges in schema public grant select on tables to customer;
grant usage on all sequences in schema public to customer;
alter default privileges in schema public grant usage on sequences to customer;
alter role customer with login;


-- 3. Team leader
drop role if exists team_leader;
create role team_leader;

grant connect on database football_management_system to team_leader;
grant usage on schema public to team_leader;
grant select, insert, delete, update on all tables in schema public to team_leader;
alter default privileges in schema public grant select, insert, delete, update on tables to team_leader;
grant usage on all sequences in schema public to team_leader;
alter default privileges in schema public grant usage on sequences to team_leader;
alter role team_leader with login;

-- 4. Admin as a superuser
create role admin_system with login;
grant connect on database football_management_system to admin_system;
alter role admin_system with superuser;
GRANT ALL ON SCHEMA public TO admin_system;
grant all on all tables in schema public to admin_system;
grant all on all sequences in schema public to admin_system;
grant all on all functions in schema public to admin_system;
alter default privileges in schema public grant all on tables to admin_system;  
alter default privileges in schema public grant all on sequences to admin_system;  
alter default privileges in schema public grant all on functions to admin_system;  
-- 5. Create user correspond to each role

create user viewer1 with password 'password1';
create user viewer2 with password 'password2';


create user customer1 with password 'password3';
create user customer2 with password 'password4';


create user team_leader1 with password 'password5';
create user team_leader2 with password 'password6';


create user admin1 with password 'admin1';

grant viewer to viewer1;
grant viewer to viewer2;
grant customer to customer1;
grant customer to customer2;


grant team_leader to team_leader1;
grant team_leader to team_leader2;

grant admin1 to admin_system;
