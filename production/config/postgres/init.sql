-- Citizens Query
CREATE USER sc_citizen_user WITH PASSWORD '123456';
CREATE DATABASE sc_citizen_db OWNER sc_citizen_user;

-- Results Service
CREATE USER sc_results_user WITH PASSWORD '123456';
CREATE DATABASE sc_results_db OWNER sc_results_user;

-- Elections Query
CREATE USER sc_elections_user WITH PASSWORD '123456';
CREATE DATABASE sc_elections_db OWNER sc_elections_user;

-- Transparency Service
CREATE USER sc_transparency_user WITH PASSWORD '123456';
CREATE DATABASE sc_transparency_db OWNER sc_transparency_user;

-- Election Configuration Service
CREATE USER sc_elections_user WITH PASSWORD '123456';
CREATE DATABASE sr_elections_db OWNER sc_elections_user;

-- Pre-electoral Service
CREATE USER sr_pre_elections_user WITH PASSWORD '123456';
CREATE DATABASE sr_pre_elections_db OWNER sr_pre_elections_user;