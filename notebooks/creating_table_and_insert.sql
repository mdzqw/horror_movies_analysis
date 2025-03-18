-- Step 1: Create the initial table for horror movies
CREATE TABLE horror_movies (
    tconst TEXT PRIMARY KEY,        -- Unique movie identifier
    primaryTitle TEXT,              -- Movie title
    startYear INTEGER,              -- Release year (integer)
    runtimeMinutes INTEGER,         -- Runtime in minutes (can be NULL)
    genres TEXT,                    -- Genres (text)
    averageRating REAL,             -- Average rating (floating-point number)
    numVotes INTEGER                -- Number of votes (integer)
);

-- Step 2: Create a new table with the same structure
CREATE TABLE horror_movies_new (
    tconst TEXT PRIMARY KEY,        -- Unique movie identifier
    primaryTitle TEXT,              -- Movie title
    startYear INTEGER,              -- Release year
    runtimeMinutes INTEGER,         -- Runtime in minutes
    genres TEXT,                    -- Genres
    averageRating REAL,             -- Average rating
    numVotes INTEGER                -- Number of votes
);

-- Step 3: Copy data from the old table to the new table
INSERT INTO horror_movies_new (tconst, primaryTitle, startYear, runtimeMinutes, genres, averageRating, numVotes)
SELECT tconst, primaryTitle, startYear, runtimeMinutes, genres, averageRating, numVotes
FROM horror_movies;

-- Step 4: Drop the old table
DROP TABLE horror_movies;

-- Step 5: Rename the new table to the original table name
ALTER TABLE horror_movies_new RENAME TO horror_movies;

-- Step 6: Add a new column for weighted rating
ALTER TABLE horror_movies ADD COLUMN weightedRating REAL;

-- Step 7: Calculate and populate the weighted rating
UPDATE horror_movies
SET weightedRating = 
    (numVotes / (numVotes + (SELECT AVG(numVotes) FROM horror_movies))) * averageRating + 
    ((SELECT AVG(numVotes) FROM horror_movies) / (numVotes + (SELECT AVG(numVotes) FROM horror_movies))) * 
    (SELECT AVG(averageRating) FROM horror_movies);

-- Step 8: Verify the results
SELECT * FROM horror_movies LIMIT 10;