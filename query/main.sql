-- 1. CREATE DATABASE 





-- 2. CREATE VIEW





-- 3. SORTING 





-- 4. SEARCHING





-- 5. DELETE






-- 6. TRIGGER FUNCTION






-- 7. FUNCTION 





-- 8. ROLE 

-- Show all privileges in the database 
SELECT * FROM information_schema.table_privileges
where grantee not in ('postgres', 'PUBLIC') order by grantee;

-- Show all users in the database
SELECT * FROM pg_catalog.pg_user