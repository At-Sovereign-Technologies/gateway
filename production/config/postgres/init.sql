-- Citizens Query
CREATE USER citizens_query_user WITH PASSWORD 'REPLACE_WITH_CITIZENS_QUERY_DB_PASSWORD';
CREATE DATABASE citizens_query_db OWNER citizens_query_user;

-- Results Service
CREATE USER results_svc_user WITH PASSWORD 'REPLACE_WITH_RESULTS_SVC_DB_PASSWORD';
CREATE DATABASE results_svc_db OWNER results_svc_user;

-- Elections Query
CREATE USER elections_query_user WITH PASSWORD 'REPLACE_WITH_ELECTIONS_QUERY_DB_PASSWORD';
CREATE DATABASE elections_query_db OWNER elections_query_user;

-- Transparency Service
CREATE USER transparency_svc_user WITH PASSWORD 'REPLACE_WITH_TRANSPARENCY_SVC_DB_PASSWORD';
CREATE DATABASE transparency_svc_db OWNER transparency_svc_user;

-- Election Configuration Service
CREATE USER election_conf_svc_user WITH PASSWORD 'REPLACE_WITH_ELECTION_CONF_SVC_DB_PASSWORD';
CREATE DATABASE election_conf_svc_db OWNER election_conf_svc_user;

-- Pre-electoral Service
CREATE USER preelectoral_svc_user WITH PASSWORD 'REPLACE_WITH_PREELECTORAL_SVC_DB_PASSWORD';
CREATE DATABASE preelectoral_svc_db OWNER preelectoral_svc_user;