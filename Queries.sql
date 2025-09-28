-- 1. Total number of shows
SELECT 
    COUNT(*)
FROM
    shows;

-- 2. Content by type (Movie/Show)
SELECT 
    type, COUNT(*) AS total_count
FROM
    shows
GROUP BY type;

-- 3. Number of shows released every year
SELECT 
    release_year, COUNT(*) AS show_count
FROM
    shows
GROUP BY release_year
ORDER BY release_year;

-- 4. Shows by country (exclude Unknown)
SELECT 
    country, COUNT(*) AS shows_by_country
FROM
    shows
WHERE
    country <> 'Unknown'
GROUP BY country
ORDER BY shows_by_country DESC
LIMIT 10;

-- 5. Most common genre
SELECT 
    g.genre_name, COUNT(*) AS count
FROM
    show_genre sg
        JOIN
    genres g ON sg.genre_id = g.genre_id
GROUP BY g.genre_name
ORDER BY count DESC
LIMIT 10;

-- 6. Top 5 most common rating
SELECT 
    rating, COUNT(*) AS count
FROM
    shows
GROUP BY rating
ORDER BY count DESC
LIMIT 5;

-- 7. Average Duration of Movies and Shows
SELECT 
    type, AVG(duration_num) AS avg_duration
FROM
    shows
GROUP BY type;

-- 8. Top 10 Actors with Most Shows (exclude Unknown)
SELECT 
    a.actor_name, COUNT(*) AS titles_count
FROM
    show_actor sa
        JOIN
    actors a ON sa.actor_id = a.actor_id
WHERE
    a.actor_name <> 'Unknown'
GROUP BY a.actor_name
ORDER BY titles_count DESC
LIMIT 10;

-- 9. Directors with Most Content (exclude Unknown)
SELECT 
    d.director_name, COUNT(*) AS titles_count
FROM
    show_director sd
        JOIN
    directors d ON sd.director_id = d.director_id
WHERE
    d.director_name <> 'Unknown'
GROUP BY d.director_name
ORDER BY titles_count DESC
LIMIT 10;

-- 10. Content from last 10 years (since 2015)
SELECT 
    year_added, COUNT(*) AS count
FROM
    shows
WHERE
    year_added >= YEAR(CURDATE()) - 10
GROUP BY year_added
ORDER BY year_added;

-- 11. Average Duration of Movie by Genre
SELECT 
    g.genre_name, AVG(s.duration_num) AS avg_duration
FROM
    show_genre sg
        JOIN
    genres g ON sg.genre_id = g.genre_id
        JOIN
    shows s ON sg.show_id = s.show_id
WHERE
    s.type = 'Movie'
GROUP BY g.genre_name
ORDER BY avg_duration DESC;

-- 12. Percentage Distribution of Content by Ratings
SELECT 
    rating,
    ROUND(100.0 * COUNT(*) / (SELECT 
                    COUNT(*)
                FROM
                    shows),
            2) AS percent_distribution
FROM
    shows
GROUP BY rating
ORDER BY percent_distribution DESC
LIMIT 3;

-- 13. Monthly Trends of Show Additions from Last 10 Years
SELECT 
    year_added, month_added, COUNT(*) AS num_of_movies
FROM
    shows
WHERE
    year_added >= YEAR(CURDATE()) - 10
GROUP BY year_added , month_added
ORDER BY year_added , month_added;
