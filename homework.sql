-- Select all columns and rows from the movies table
SELECT * 
  FROM movies;

-- Select only the title and id of the first 10 rows
SELECT id, title 
  FROM movies
    LIMIT 10;

-- Find the movie with the id of 485
SELECT title 
  FROM movies 
    WHERE id = 485;

-- Find the id (only that column) of the movie Made in America (1993)
SELECT id 
  FROM movies 
    WHERE title 
      LIKE “made in America%”;

-- Find the first 10 sorted alphabetically
SELECT * 
  FROM movies 
    ORDER BY title 
      LIMIT 10;

-- Find all movies from 2002
SELECT title 
  FROM movies 
    WHERE title 
      LIKE “%(2002)”;

-- Find out what year the Godfather came out
SELECT title 
  FROM movies 
    WHERE title 
      LIKE “Godfather%”;

-- Without using joins find all the comedies
SELECT * 
  FROM movies 
    WHERE genres 
      LIKE “Comedy%”

-- Find all comedies in the year 2000
SELECT * 
  FROM movies 
    WHERE genres=”Comedy” 
      AND title 
        LIKE “%(2000)”;

-- Find any movies that are about death and are a comedy
SELECT * 
  FROM movies 
    WHERE genres= “Comedy” 
      AND title 
        LIKE “%death%”;

-- Find any movies from either 2001 or 2002 with a title containing super
SELECT * 
  FROM movies 
    WHERE title 
      LIKE “%(2001)%” 
        AND title 
          LIKE “%super%”;

-- Find all the ratings for the movie Godfather, show just the title and the rating
SELECT title, rating 
  FROM movies 
    INNER JOIN ratings 
      ON movies.id = ratings.movie_id 
        WHERE movies.title 
          LIKE “%Godfather, The%”;

-- Order the previous objective by newest to oldest
SELECT * 
  FROM movies 
    INNER JOIN ratings 
      ON movies.id = ratings.movie_id 
        WHERE movies.title 
          LIKE “%Godfather, The%” 
            ORDER BY ratings.”timestamp”;

-- Find the comedies from 2005 and get the title and imdbid from the links table
SELECT movies.title, links.imdb_id 
  FROM movies 
    INNER JOIN links 
      ON movies.id = links.movie_id 
        WHERE movies.title 
          LIKE “%2005%” 
            AND movies.genres 
              LIKE “%Comedy%”;

-- Find all movies that have no ratings
SELECT movies.title, ratings.rating
  FROM movies
    LEFT JOIN ratings 
      ON movies.id = ratings.movie_id
        WHERE ratings.rating = NULL;              

-- Get the average rating for a movie
SELECT movies.title, ratings.movie_id,
  AVG(ratings.rating)
    FROM movies
      LEFT JOIN ratings 
        ON movies.id = ratings.movie_id
          WHERE movies.id = 9;

-- Get the total ratings for a movie
SELECT movies.title, ratings.movie_id,
  COUNT(ratings.rating)
    FROM movies
      LEFT JOIN ratings 
        ON movies.id = ratings.movie_id
          WHERE movies.id = 5;

-- Get the total movies for a genre
SELECT title, genres
  FROM movies
    WHERE genres 
      LIKE "%Comedy";      

-- Get the average rating for a user
SELECT user_id,
  AVG(rating)
    FROM ratings
      WHERE user_id = 14;    

-- Find the user with the most ratings
SELECT user_id,
  COUNT(rating)
    FROM ratings
      GROUP BY user_id
        ORDER BY COUNT(rating) DESC
          LIMIT 1                

-- Find the user with the highest average rating
SELECT user_id,
  AVG(rating)
    FROM ratings
      GROUP BY user_id
        ORDER BY AVG(rating) DESC
          LIMIT 1

-- Find the user with the highest average rating with more than 50 reviews
SELECT user_id,
  AVG(rating),
    COUNT(rating)
      FROM ratings
        GROUP BY user_id
          HAVING COUNT(rating) > 50
            ORDER BY AVG(rating) DESC

-- Find the movies with an average rating over 4
SELECT  movies.title, ratings.movie_id, AVG(ratings.rating)
  FROM movies
    LEFT JOIN ratings ON movies.id = ratings.movie_id
      GROUP BY movies.id
        HAVING(ratings.rating) > 4            

