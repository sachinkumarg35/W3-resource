use movie;

/*1. From the following table, write a SQL query to find all reviewers whose ratings contain a NULL value. Return reviewer name.
Sample table: reviewe
Sample table: rating*/
SELECT rev_name
FROM reviewer
INNER JOIN rating USING(rev_id)
WHERE rev_stars IS NULL;

/*2. From the following table, write a SQL query to find out who was cast in the movie 'Annie Hall'. Return actor first name, last name and role.
Sample table: actor
Sample table: movie_cast
Sample table : movie*/
SELECT act_fname,act_lname,role
  FROM actor 
	  JOIN movie_cast ON actor.act_id=movie_cast.act_id
		JOIN movie ON movie_cast.mov_id=movie.mov_id 
		  AND movie.mov_title='Annie Hall';
          
/*3. From the following table, write a SQL query to find the director who directed a movie that featured a role in 'Eyes Wide Shut'. 
Return director first name, last name and movie title.
Sample table: director
Sample table: movie_direction
Sample table: movie_cast
Sample table: movie*/
SELECT dir_fname, dir_lname, mov_title
FROM  director 
NATURAL JOIN movie_direction
NATURAL JOIN movie
NATURAL JOIN movie_cast
WHERE role IS  NOT NULL
AND mov_title='Eyes Wide Shut';

/*4. From the following tables, write a SQL query to find the director of a movie that cast a role as Sean Maguire. 
Return director first name, last name and movie title.
Sample table: director
Sample table: movie_direction
Sample table: movie_cast
Sample table: movie*/
SELECT dir_fname, dir_lname, mov_title
FROM  director 
JOIN movie_direction 
  ON director.dir_id=movie_direction.dir_id
JOIN movie 
  ON movie_direction.mov_id=movie.mov_id
JOIN movie_cast 
  ON movie_cast.mov_id=movie.mov_id
  WHERE role='Sean Maguire';
  
  /* OR */
  
SELECT dir_fname, dir_lname, mov_title
FROM  director, movie_direction, movie, movie_cast
WHERE director.dir_id=movie_direction.dir_id
AND movie_direction.mov_id=movie.mov_id
AND movie.mov_id=movie_cast.mov_id
AND movie_cast.role='Sean Maguire';

/*5. From the following table, write a SQL query to find out which actors have not appeared in any movies between 1990 and 2000 (Begin and end values are included.). 
Return actor first name, last name, movie title and release year.
Sample table: actor
Sample table: movie_cast
Sample table: movie*/
SELECT act_fname, act_lname, mov_title, mov_year
FROM actor
JOIN movie_cast 
ON actor.act_id=movie_cast.act_id
JOIN movie 
ON movie_cast.mov_id=movie.mov_id
WHERE mov_year NOT BETWEEN 1990 and 2000;

/* OR */

SELECT a.act_fname, a.act_lname, c.mov_title, c.mov_year
FROM actor a, movie_cast b, movie c
WHERE a.act_id=b.act_id
AND b.mov_id=c.mov_id
AND c.mov_year NOT BETWEEN 1990 and 2000;

/*6. From the following table, write a SQL query to find the directors who have directed films in a variety of genres. 
Group the result set on director first name, last name and generic title. Sort the result-set in ascending order by director first name and last name. 
Return director first name, last name and number of genres movies.
Sample table: director
Sample table: movie_direction
Sample table: genres
Sample table: movie_genres*/
SELECT dir_fname,dir_lname, gen_title,count(gen_title)
FROM director
NATURAL JOIN movie_direction
NATURAL JOIN movie_genres
NATURAL JOIN genres
GROUP BY dir_fname, dir_lname,gen_title
ORDER BY dir_fname,dir_lname;

/*7. From the following table, write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.
Sample table: movie
Sample table: genres
Sample table: movie_genres*/
SELECT mov_title, mov_year, gen_title
FROM movie
NATURAL JOIN movie_genres
NATURAL JOIN genres;

/*8. From the following tables, write a SQL query to find all the movies with year, genres, and name of the director.
Sample table: movie
Sample table: genres
Sample table: movie_genres
Sample table: director
Sample table: movie_direction*/
SELECT mov_title, mov_year, gen_title, dir_fname, dir_lname
FROM movie
NATURAL JOIN movie_genres
NATURAL JOIN genres
NATURAL JOIN movie_direction
NATURAL JOIN director;

/*9. From the following tables, write a SQL query to find the movies released before 1st January 1989. 
Sort the result-set in descending order by date of release. Return movie title, release year, date of release, duration, and first and last name of the director.
Sample table: movie
Sample table: director
Sample table: movie_direction*/
SELECT movie.mov_title, mov_year, mov_dt_rel,
       mov_time,dir_fname, dir_lname 
FROM movie
JOIN  movie_direction 
   ON movie.mov_id = movie_direction.mov_id
JOIN director 
   ON movie_direction.dir_id=director.dir_id
WHERE mov_dt_rel <'1989/01/01'
ORDER BY mov_dt_rel desc;

/*10. From the following table, write a SQL query to calculate the average movie length and count the number of movies in each genre. 
Return genre title, average time and number of movies for each genre.
Sample table: movie
Sample table: genres
Sample table: movie_genres*/
SELECT gen_title, AVG(mov_time), COUNT(gen_title) 
FROM movie
NATURAL JOIN  movie_genres
NATURAL JOIN  genres
GROUP BY gen_title;

/*11. From the following table, write a SQL query to find movies with the shortest duration. 
Return movie title, movie year, director first name, last name, actor first name, last name and role.
Sample table: movie
Sample table: actor
Sample table: director
Sample table: movie_direction
Sample table : movie_cast*/
SELECT mov_title, mov_year, dir_fname, dir_lname, 
       act_fname, act_lname, role 
FROM  movie
NATURAL JOIN movie_direction
NATURAL JOIN movie_cast
NATURAL JOIN director
NATURAL JOIN actor
WHERE mov_time=(SELECT MIN(mov_time) FROM movie);

/*12. From the following table, write a SQL query to find the years in which a movie received a rating of 3 or 4. Sort the result in increasing order on movie year.
Sample table: movie
Sample table: rating*/
SELECT DISTINCT mov_year
FROM movie, rating
WHERE movie.mov_id = rating.mov_id 
AND rev_stars IN (3, 4)
ORDER BY mov_year;

/* OR */

SELECT DISTINCT mov_year
FROM movie
INNER JOIN rating 
ON movie.mov_id = rating.mov_id
WHERE rev_stars IN (3, 4)
ORDER BY mov_year;

/* OR */

SELECT DISTINCT mov_year
FROM movie
INNER JOIN rating USING(mov_id)
WHERE rev_stars IN (3,4)
ORDER BY mov_year;

/* OR */

SELECT DISTINCT mov_year
FROM movie NATURAL JOIN rating
WHERE rev_stars IN (3, 4)
ORDER BY mov_year;

/*13. From the following tables, write a SQL query to get the reviewer name, movie title, and stars in an order that reviewer name will come first, 
then by movie title, and lastly by number of stars.
Sample table : movie
Sample table: rating
Sample table: reviewer*/
SELECT rev_name, mov_title, rev_stars
FROM movie, rating, reviewer
WHERE movie.mov_id = rating.mov_id 
AND reviewer.rev_id = rating.rev_id AND rev_name IS NOT NULL
ORDER BY rev_name, mov_title, rev_stars;

/* OR */

SELECT rev_name, mov_title, rev_stars
FROM movie
INNER JOIN rating ON movie.mov_id = rating.mov_id
INNER JOIN reviewer ON reviewer.rev_id = rating.rev_id
WHERE rev_name IS NOT NULL
ORDER BY rev_name, mov_title, rev_stars;

/* OR */

SELECT rev_name, mov_title, rev_stars
FROM movie
INNER JOIN rating USING(mov_id)
INNER JOIN Reviewer USING(rev_id)
WHERE rev_name IS NOT NULL
ORDER BY rev_name, mov_title, rev_stars;

/* OR */

SELECT rev_name, mov_title, rev_stars
FROM movie 
NATURAL JOIN rating 
NATURAL JOIN reviewer
WHERE rev_name IS NOT NULL
ORDER BY rev_name, mov_title, rev_stars;

/* 14. From the following table, write a SQL query to find those movies that have at least one rating and received the most stars. 
Sort the result-set on movie title. Return movie title and maximum review stars.
Sample table: movie
Sample table: rating*/
SELECT mov_title, MAX(rev_stars)
FROM movie
INNER JOIN rating USING(mov_id)
GROUP BY mov_title 
HAVING MAX(rev_stars)>0
ORDER BY mov_title;

/*15. From the following table, write a SQL query to find out which movies have received ratings. 
Return movie title, director first name, director last name and review stars.
Sample table: movie
Sample table: rating
Sample table: movie_direction
Sample table: director*/
SELECT mov_title, dir_fname,dir_lname, rev_stars
FROM Movie
JOIN movie_direction USING(mov_id)
join director using (dir_id)
left join rating using(mov_id)
where rev_stars is not null;

/*16. From the following table, write a SQL query to find movies in which one or more actors have acted in more than one film. 
Return movie title, actor first and last name, and the role.
Sample table: movie
Sample table: movie_cast
Sample table: actor*/
SELECT mov_title, act_fname, act_lname, role
FROM movie 
JOIN movie_cast 
  ON movie_cast.mov_id=movie.mov_id 
JOIN actor 
  ON movie_cast.act_id=actor.act_id
WHERE actor.act_id IN (
SELECT act_id 
FROM movie_cast 
GROUP BY act_id HAVING COUNT(*)>=2);

/*17. From the following tables, write a SQL query to find the actor whose first name is 'Claire' and last name is 'Danes'. 
Return director first name, last name, movie title, actor first name and last name, role.
Sample table: movie
Sample table: movie_cast
Sample table: actor
Sample table: director
Sample table: movie_direction*/
SELECT dir_fname, dir_lname, mov_title, act_fname, act_lname, role
FROM actor
JOIN movie_cast 
  ON actor.act_id=movie_cast.act_id
JOIN movie_direction 
  ON movie_cast.mov_id=movie_direction.mov_id
JOIN director 
  ON movie_direction.dir_id=director.dir_id
JOIN movie 
  ON movie.mov_id=movie_direction.mov_id
WHERE act_fname='Claire' 
  AND act_lname='Danes';
  
/*18. From the following table, write a SQL query to find for actors whose films have been directed by them. Return actor first name, last name, movie title and role.
Sample table: movie
Sample table: movie_cast
Sample table: actor
Sample table: director
Sample table: movie_direction*/
SELECT act_fname, act_lname, mov_title, role
FROM actor
JOIN movie_cast 
  ON actor.act_id=movie_cast.act_id
JOIN movie_direction 
  ON movie_cast.mov_id=movie_direction.mov_id
JOIN director 
  ON movie_direction.dir_id=director.dir_id
JOIN movie 
  ON movie.mov_id=movie_direction.mov_id
WHERE act_fname=dir_fname 
  AND act_lname=dir_lname;
  
/*19. From the following tables, write a SQL query to find the cast list of the movie ‘Chinatown’. Return first name, last name.
Sample table: movie
Sample table: movie_cast
Sample table: actor*/
SELECT a.act_fname, a.act_lname
FROM
movie_cast c
JOIN actor a ON
c.act_id = a.act_id
Where mov_id = (
SELECT mov_id
FROM movie
Where mov_title = 'Chinatown');

/*20. From the following tables, write a SQL query to find those movies where actor’s first name is 'Harrison' and last name is 'Ford'. Return movie title.
Sample table: movie
Sample table: movie_cast
Sample table: actor*/
SELECT m.mov_title
FROM  movie m
JOIN movie_cast c 
ON  m.mov_id = c.mov_id
WHERE c.act_id IN ( 
Select act_id 
FROM actor 
WHERE act_fname='Harrison' 
AND act_lname='Ford');

/*21. From the following tables, write a SQL query to find the highest-rated movies. Return movie title, movie year, review stars and releasing country.
Sample table : movie
Sample table : rating*/
SELECT mov_title, mov_year, rev_stars, mov_rel_country
FROM movie 
NATURAL JOIN rating
WHERE rev_stars = (
SELECT MAX(rev_stars)
FROM rating
);

/*22. From the following tables, write a SQL query to find the highest-rated ‘Mystery Movies’. Return the title, year, and rating.
Sample table: movie
Sample table: genres
Sample table: movie_genres
Sample table: rating*/
SELECT mov_title, mov_year, rev_stars
FROM movie 
NATURAL JOIN movie_genres 
NATURAL JOIN genres 
NATURAL JOIN rating
WHERE gen_title = 'Mystery' AND rev_stars >= ALL (
SELECT rev_stars
FROM rating 
NATURAL JOIN movie_genres 
NATURAL JOIN genres
WHERE gen_title = 'Mystery');

/*23. From the following tables, write a SQL query to find the years when most of the ‘Mystery Movies’ produced. 
Count the number of generic title and compute their average rating. Group the result set on movie release year, generic title. 
Return movie year, generic title, number of generic title and average rating.
Sample table: movie
Sample table: genres
Sample table: movie_genres
Sample table: rating*/
SELECT mov_year,gen_title,count(gen_title), avg(rev_stars)
FROM movie 
NATURAL JOIN movie_genres 
NATURAL JOIN genres
NATURAL JOIN rating
WHERE gen_title='Mystery' 
GROUP BY mov_year,gen_title;

/*24. From the following tables, write a query in SQL to generate a report, which contain the fields movie title, name of the female actor, year of the movie, 
role, movie genres, the director, date of release, and rating of that movie.
Sample table: movie
Sample table: genres
Sample table: movie_genres
Sample table: rating
Sample table: actor
Sample table: director
Sample table: movie_direction
Sample table: movie_cast*/
SELECT mov_title, act_fname, act_lname, 
mov_year, role, gen_title, dir_fname, dir_lname, 
mov_dt_rel, rev_stars
FROM movie 
NATURAL JOIN movie_cast
NATURAL JOIN actor
NATURAL JOIN movie_genres
NATURAL JOIN genres
NATURAL JOIN movie_direction
NATURAL JOIN director
NATURAL JOIN rating
WHERE act_gender='F';







