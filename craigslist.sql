DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE regions (id SERIAL PRIMARY KEY,
                    region_name TEXT NOT NULL);

CREATE TABLE categories (id SERIAL PRIMARY KEY,
                    category_name TEXT NOT NULL);

CREATE TABLE posts (id SERIAL PRIMARY KEY,
                     post_title TEXT NOT NULL,
                     post_text TEXT NOT NULL,
                     post_location TEXT,
                     user_id INTEGER REFERENCES users ON DELETE CASCADE,
                     region_id INTEGER REFERENCES regions ON DELETE CASCADE,
                     category_id INTEGER REFERENCES categories ON DELETE CASCADE);

CREATE TABLE users (id SERIAL PRIMARY KEY,
                     user_name TEXT NOT NULL,
                     user_password TEXT NOT NULL,
                     preffered_region_id INTEGER REFERENCES regions ON DELETE CASCADE);
