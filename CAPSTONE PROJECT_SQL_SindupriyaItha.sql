use sakila;
-- Task 1
Select * from actor;
select concat(first_name,' ',last_name) AS ' ACTORS FULL NAME' from actor;
-- Task 2.1
select first_name, count(first_name) as 'count_first_name' from actor group by first_name;
-- Task2.2
select first_name, count(first_name) as 'count_unique name' from actor group by first_name having count(first_name)=1;
-- Task 3.1
select last_name, count(last_name) as 'count_last_name' from actor group by last_name;
-- Task 3.2
select last_name, count(last_name) as 'count_Last_name' from actor group by last_name having count(last_name) = 1;
-- Task 4.1
select * from film where rating = "R";
-- Task 4.2
select * from film where rating != "R";
-- Task 4.3
select * from film where rating='PG' OR rating='PG-13';
-- Task 5.1
select * from film  where replacement_cost<=11;
-- Task 5.2
select * from film  where replacement_cost between 11 and 20;
-- Task 5.3
select * from film order by replacement_cost desc;
-- Task 6
select title, count(*) as Actor_count from film
join film_actor on film.film_id = film_actor.film_id group by title order by Actor_count desc limit 3;
-- Task 7
select title from film where title like 'K%' or title like 'Q%';
-- Task 8
select concat(first_name, ' ',last_name) as 'Actor Full name' from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film_actor.film_id = film.film_id
where film.title ='Agent Truman';
-- Task 9
select title from film where rating='G';
-- Task 10
select rating, MIN(rental_rate) AS min_rental_rate, MAX(rental_rate) AS max_rental_rate, avg(rental_rate) AS avg_rental_rate from film
group by rating order by avg_rental_rate desc;
-- Task 10.2
select film.title, count(rental.rental_id) as rental_frequency from film
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
group by film.title order by  rental_frequency desc;
-- Task 11
select category.name, avg(replacement_cost) as 'Avg Replacement_cost', Avg(rental_rate) as 'Avg Rental_rate', 
(avg(replacement_cost)-avg(rental_rate)) as " Difference"
from film inner join film_actor on film_actor.film_id = film.film_id
inner join category on film_actor.actor_id = category.category_id 
group by name having (AVG(replacement_cost)-AVG(rental_rate)) >15; 
-- Task 12
select category.name, count(film.film_id) as movie_count from category
join film_category on category.category_id = film_category.category_id
join film on film_category.film_id = film.film_id
group by category.name
having count(film.film_id)>70;