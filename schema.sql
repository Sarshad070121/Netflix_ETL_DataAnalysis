CREATE SCHEMA IF NOT EXISTS netflix_streaming;

USE netflix_streaming;

DROP TABLE IF EXISTS shows;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS show_genre;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS show_actor;
DROP TABLE IF EXISTS directors;
DROP TABLE IF EXISTS show_director;

CREATE TABLE shows (
    show_id VARCHAR(20) PRIMARY KEY,
    type VARCHAR(20),
    title VARCHAR(255),
    country VARCHAR(255),
    date_added DATE,
    release_year INT,
    rating VARCHAR(20),
    year_added INT,
    month_added INT,
    duration_num INT,
    duration_type VARCHAR(20)
);

CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100)
);

CREATE TABLE show_genre (
    show_id VARCHAR(50),
    genre_id INT,
    PRIMARY KEY (show_id , genre_id),
    FOREIGN KEY (show_id)
        REFERENCES shows (show_id),
    FOREIGN KEY (genre_id)
        REFERENCES genres (genre_id)
);

CREATE TABLE actors (
    actor_name VARCHAR(255),
    actor_id INT PRIMARY KEY
);

CREATE TABLE show_actor (
    show_id VARCHAR(50),
    actor_id INT,
    PRIMARY KEY (show_id , actor_id),
    FOREIGN KEY (show_id)
        REFERENCES shows (show_id),
    FOREIGN KEY (actor_id)
        REFERENCES actors (actor_id)
);

CREATE TABLE directors (
    director_name VARCHAR(255),
    director_id INT PRIMARY KEY
);

CREATE TABLE show_director (
    show_id VARCHAR(50),
    director_id INT,
    PRIMARY KEY (show_id , director_id),
    FOREIGN KEY (show_id)
        REFERENCES shows (show_id),
    FOREIGN KEY (director_id)
        REFERENCES directors (director_id)
);

-- Uncomment if needed
-- SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/shaik/OneDrive/Desktop/SQL/Netflix_ETL/netflix_cleaned.csv' 
INTO TABLE shows
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS
(show_id, type, title, country, @date_added, release_year, rating, year_added, month_added, duration_num, duration_type)
SET date_added = STR_TO_DATE(@date_added, '%Y-%m-%d');


LOAD DATA LOCAL INFILE 'C:/Users/shaik/OneDrive/Desktop/SQL/Netflix_ETL/genres_table.csv'
INTO TABLE genres
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(genre_name, genre_id);


LOAD DATA LOCAL INFILE 'C:/Users/shaik/OneDrive/Desktop/SQL/Netflix_ETL/show_genre_mapping.csv'
INTO TABLE show_genre
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/shaik/OneDrive/Desktop/SQL/Netflix_ETL/actors_table.csv'
INTO TABLE actors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/shaik/OneDrive/Desktop/SQL/Netflix_ETL/show_actor_mapping.csv'
INTO TABLE show_actor
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/shaik/OneDrive/Desktop/SQL/Netflix_ETL/directors_table.csv'
INTO TABLE directors
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/shaik/OneDrive/Desktop/SQL/Netflix_ETL/show_director_mapping.csv'
INTO TABLE show_director
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT 'shows' AS table_name, COUNT(*) AS row_count FROM shows
UNION ALL
SELECT 'genres', COUNT(*) FROM genres
UNION ALL
SELECT 'show_genre', COUNT(*) FROM show_genre
UNION ALL
SELECT 'actors', COUNT(*) FROM actors
UNION ALL
SELECT 'show_actor', COUNT(*) FROM show_actor
UNION ALL
SELECT 'directors', COUNT(*) FROM directors
UNION ALL
SELECT 'show_director', COUNT(*) FROM show_director;

