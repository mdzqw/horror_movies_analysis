-- Count the total number of movies
SELECT COUNT(*) AS total_movies
FROM horror_movies;

-- Calculate the average weighted rating
SELECT AVG(weightedRating) AS avg_weighted_rating
FROM horror_movies;

-- Calculate the average weighted rating by genre
SELECT genres, AVG(weightedRating) AS avg_rating
FROM horror_movies
GROUP BY genres
ORDER BY avg_rating DESC;

-- TOP LISTS ------------------------------------------------------------
-- Top 25 movies by weighted rating
SELECT primaryTitle, startYear, weightedRating, runtimeMinutes, genres, numVotes 
FROM horror_movies
ORDER BY weightedRating DESC
LIMIT 25;

-- Top 25 movies by number of votes
SELECT primaryTitle, startYear, numVotes
FROM horror_movies
ORDER BY numVotes DESC
LIMIT 25;

-- Top 25 genre combinations by number of movies
SELECT genres, COUNT(*) AS num_movies
FROM horror_movies
GROUP BY genres
ORDER BY num_movies DESC
LIMIT 25;

-- Create a table for top 25 movies with box office data
CREATE TABLE top_25_movies_with_box_office (
    primaryTitle TEXT,              -- Movie title
    startYear INTEGER,              -- Release year
    weightedRating REAL,            -- Weighted rating
    numVotes INTEGER,               -- Number of votes
    box_office_gross INTEGER        -- Box office gross (in dollars)
);

-- Select top 25 movies by box office gross
SELECT primaryTitle, box_office_gross 
FROM top_25_movies_with_box_office 
ORDER BY box_office_gross DESC
LIMIT 25;

-- GRAPHS ---------------------------------------------------------------
-- Analysis by decades
SELECT FLOOR(startYear / 10) * 10 AS decade,
       COUNT(*) AS num_movies,
       AVG(weightedRating) AS avg_rating,
       AVG(numVotes) AS avg_votes
FROM horror_movies
GROUP BY FLOOR(startYear / 10) * 10
ORDER BY decade;

-- Distribution of movies by year
SELECT startYear, COUNT(*) AS num_movies
FROM horror_movies
GROUP BY startYear
ORDER BY startYear;

