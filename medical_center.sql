DROP DATABASE IF EXISTS medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db

CREATE TABLE doctors (id SERIAL PRIMARY KEY,
                    doctor_name TEXT NOT NULL, 
                    practice TEXT NOT NULL);

CREATE TABLE patients (id SERIAL PRIMARY KEY, 
                    patient_name TEXT NOT NULL, 
                    insurance TEXT NOT NULL,
                    birthday DATE NOT NULL);

CREATE TABLE diseases (id SERIAL PRIMARY KEY, 
                      disease_name TEXT NOT NULL, 
                      disease_description TEXT NOT NULL);

CREATE TABLE visits (id SERIAL PRIMARY KEY, 
                     doctor_id INTEGER REFERENCES doctors ON DELETE CASCADE,
                     patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
                     visit_date DATE NOT NULL);

CREATE TABLE diagnoses (id SERIAL PRIMARY KEY, 
                        visit_id INTEGER REFERENCES visits ON DELETE CASCADE,
                        disease_id INTEGER REFERENCES diseases ON DELETE CASCADE,
                        notes TEXT NOT NULL);

                   