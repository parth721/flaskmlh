DROP TABLE IF EXISTS user_bio;
DROP TABLE IF EXISTS user_auth;

CREATE TABLE user_auth (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(25) NOT NULL,
    password VARCHAR(25) NOT NULL UNIQUE,
);

CREATE TABLE user_bio (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    full_name TEXT NOT NULL,
    phone_number INTEGER(10) NOT NULL UNIQUE,
    lattitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    job_profile TEXT(20)  NOT NULL, 
    FOREIGN KEY(user_id) REFERENCES user_auth(id)
);

CREATE TABLE partner_auth (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    partnername VARCHAR(25) NOT NULL,
    password VARCHAR(25) NOT NULL UNIQUE,
);

CREATE TABLE partner_bio (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    partner_id INTEGER NOT NULL,
    full_name TEXT NOT NULL,
    phone_number INTEGER(10) NOT NULL UNIQUE,
    lattitude FLOAT NOT NULL,
    longitude FLOAT NOT NULL,
    job_profile TEXT(20)  NOT NULL, 
    FOREIGN KEY(partner_id) REFERENCES partner_auth(id)
);