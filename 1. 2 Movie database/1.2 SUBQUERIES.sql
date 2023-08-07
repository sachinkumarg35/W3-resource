use movie;

/*1. From the following table, write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Return all the fields of actor table.
Sample table: actor
Sample table: movie_cast
Sample table: movie*/
SELECT * 
FROM actor 
WHERE act_id IN(
SELECT act_id 
FROM movie_cast 
WHERE mov_id IN (
SELECT mov_id 
FROM movie 
WHERE mov_title='Annie Hall'
));

/*2. From the following tables, write a SQL query to find the director of a film that cast a role in 'Eyes Wide Shut'. Return director first name, last name.
Sample table: director
Sample table: movie_direction
Sample table: movie_cast
Sample table: movie*/
SELECT dir_fname, dir_lname
FROM  director
WHERE dir_id in (
SELECT dir_id 
FROM movie_direction
WHERE mov_id in(
SELECT mov_id 
FROM movie_cast WHERE role = ANY (
SELECT role 
FROM movie_cast 
WHERE mov_id IN (
SELECT  mov_id 
FROM movie 
WHERE mov_title='Eyes Wide Shut'))));

/*3. From the following table, write a SQL query to find those movies that have been released in countries other than the United Kingdom. 
Return movie title, movie year, movie time, and date of release, releasing country.
Sample table: movie*/
SELECT mov_title, mov_year, mov_time, 
mov_dt_rel AS Date_of_Release, 
mov_rel_country AS Releasing_Country
FROM movie
WHERE mov_rel_country<>'UK';

/*4. From the following tables, write a SQL query to find for movies whose reviewer is unknown. 
Return movie title, year, release date, director first name, last name, actor first name, last name.
Sample table: movie
Sample table: actor
Sample table: director
Sample table: movie_direction
Sample table: movie_cast
Sample table: reviewer
Sample table: rating*/
SELECT mov_title, mov_year, mov_dt_rel, dir_fname, dir_lname, 
       act_fname, act_lname
	   FROM movie a, movie_direction b, director c, 
                rating d, reviewer e, actor f, movie_cast g
	   WHERE a.mov_id=b.mov_id
AND  b.dir_id=c.dir_id 
 AND a.mov_id=d.mov_id 
  AND  d.rev_id=e.rev_id 
   AND  a.mov_id=g.mov_id 
    AND g.act_id=f.act_id 
	 AND e.rev_name IS NULL;
     
/*5. From the following tables, write a SQL query to find those movies directed by the director whose first name is Woddy and last name is Allen. Return movie title.
Sample table: movie
Sample table: director
Sample table: movie_direction*/
SELECT mov_title 
FROM movie 
WHERE mov_id=(
SELECT mov_id 
FROM movie_direction 
WHERE dir_id=(
SELECT dir_id 
FROM director 
WHERE dir_fname='Woody' AND dir_lname='Allen'
));

/*6. From the following tables, write a SQL query to determine those years in which there was at least one movie that received a rating of at least three stars. 
Sort the result-set in ascending order by movie year. Return movie year.
Sample table: movie
Sample table: rating*/
SELECT DISTINCT mov_year 
FROM movie 
WHERE mov_id IN (
SELECT mov_id 
FROM rating 
WHERE rev_stars>3) 
ORDER BY mov_year;

/*7. From the following table, write a SQL query to search for movies that do not have any ratings. Return movie title.
Sample table: movie
Sample table: rating*/
SELECT DISTINCT mov_title 
FROM movie 
WHERE mov_id IN (
SELECT mov_id 
FROM movie 
WHERE mov_id NOT IN (
SELECT mov_id FROM Rating));

/*8. From the following table, write a SQL query to find those reviewers who have not given a rating to certain films. Return reviewer name.
Sample table: reviewer
Sample table: rating*/
SELECT DISTINCT rev_name 
FROM reviewer 
WHERE rev_id IN (
SELECT rev_id 
FROM rating 
WHERE rev_stars IS NULL);

/*9. From the following tables, write a SQL query to find movies that have been reviewed by a reviewer and received a rating. 
Sort the result-set in ascending order by reviewer name, movie title, review Stars. Return reviewer name, movie title, review Stars.
Sample table: reviewer
Sample table: rating
Sample table: movie*/
SELECT rev_name, mov_title, rev_stars 
 FROM reviewer, rating, movie 
  WHERE reviewer.rev_id=rating.rev_id 
   AND movie.mov_id=rating.mov_id 
     AND reviewer.rev_name IS NOT NULL 
       AND rating.rev_stars IS NOT NULL
ORDER BY rev_name, mov_title, rev_stars;

/*10. From the following table, write a SQL query to find movies that have been reviewed by a reviewer and received a rating. 
Group the result set on reviewer’s name, movie title. Return reviewer’s name, movie title.
Sample table: reviewer
Sample table: rating
Sample table : movie*/
SELECT rev_name, mov_title 
FROM reviewer, movie, rating, rating r2
WHERE rating.mov_id=movie.mov_id 
  AND reviewer.rev_id=rating.rev_ID 
    AND rating.rev_id = r2.rev_id 
GROUP BY rev_name, mov_title HAVING count(*) > 1;

/*11. From the following tables, write a SQL query to find those movies, which have received highest number of stars. 
Group the result set on movie title and sorts the result-set in ascending order by movie title. Return movie title and maximum number of review stars.
Sample table: rating
Sample table: movie*/
SELECT mov_title, MAX(rev_stars)
FROM movie, rating 
WHERE movie.mov_id=rating.mov_id 
AND rating.rev_stars IS NOT NULL
GROUP BY  mov_title
ORDER BY mov_title;

/*12. From the following tables, write a SQL query to find all reviewers who rated the movie 'American Beauty'. Return reviewer name.
Sample table: reviewer
Sample table: rating
Sample table: movie*/
SELECT DISTINCT reviewer.rev_name
FROM reviewer, rating, movie
WHERE reviewer.rev_id = rating.rev_id
AND movie.mov_id = rating.mov_id
AND movie.mov_title = 'American Beauty';

/*13. From the following table, write a SQL query to find the movies that have not been reviewed by any reviewer body other than 'Paul Monks'. Return movie title.
Sample table: reviewer
Sample table: rating
Sample table: movie*/
SELECT movie.mov_title
FROM movie 
WHERE movie.mov_id IN(
SELECT mov_id 
FROM rating 
WHERE rev_id NOT IN (
SELECT rev_id 
FROM reviewer 
WHERE rev_name='Paul Monks'));

/*14. From the following table, write a SQL query to find the movies with the lowest ratings. Return reviewer name, movie title, and number of stars for those movies.
Sample table: reviewer
Sample table: rating
Sample table: movie*/
SELECT reviewer.rev_name, movie.mov_title, rating.rev_stars
FROM reviewer, movie, rating
WHERE rating.rev_stars = (
SELECT MIN(rating.rev_stars)
FROM rating
)
AND rating.rev_id = reviewer.rev_id
AND rating.mov_id = movie.mov_id;

/*15. From the following tables, write a SQL query to find the movies directed by 'James Cameron'. Return movie title.
Sample table: director
Sample table: movie_direction
Sample table: movie*/
SELECT mov_title
FROM movie
WHERE mov_id IN (
SELECT mov_id 
FROM movie_direction 
WHERE dir_id IN (
SELECT dir_id 
FROM director 
WHERE dir_fname = 'James' AND dir_lname='Cameron'
));

/* OR */

SELECT mov_title FROM movie 
JOIN  movie_direction 
 ON movie.mov_id=movie_direction.mov_id
JOIN  director 
 ON movie_direction.dir_id=director.dir_id
WHERE dir_fname = 'James' AND dir_lname='Cameron';

/*16. Write a query in SQL to find the movies in which one or more actors appeared in more than one film.
Sample table: movie
Sample table: movie_cast
Sample table: actor*/
SELECT mov_title 
FROM movie 
WHERE mov_id IN (
SELECT mov_id 
FROM movie_cast 
WHERE act_id IN (
SELECT act_id 
FROM actor 
WHERE act_id IN (
SELECT act_id 
FROM movie_cast GROUP BY act_id 
HAVING COUNT(act_id)>1)));