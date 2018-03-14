prompt>Dropping users
DROP USER truck CASCADE;

prompt>Creating users
CREATE USER truck IDENTIFIED BY truck DEFAULT TABLESPACE users;

prompt>Granting privileges
GRANT ALL PRIVILEGES TO truck;

