-- traer el actor_id, first_name, last_name de la tabla actor 
USE sakila;
SELECT actor_id, first_name, last_name
FROM actor;

-- traer los distintos store_id de las tiendas
##===========##
##   DISTINC  ##
##===========##
##SE USA PARA DEVOLVER VALORES DISTINTOS

-- traer los distintos store_id de las tiendas

SELECT distinct store_id FROM sakila.customer;

-- traer los distintos first_name de las tiendas

SELECT DISTINCT first_name FROM sakila.customer;

##===========##
##  ORDER BY  ##
##===========##
## los ordena de mayor a menor o viceversa
SELECT * FROM sakila.country;

-- ORDENAR DE MANERA ASCENDENTE 

-- ORDENAR DE MANERA DESCENDENTE 

# 1 Consulta store_id, first_name y last_name de la tabla customer de la base de datos sakila.

SELECT store_id, first_name, last_name
FROM customer
order by first_name desc;

SELECT store_id, first_name, last_name
FROM customer
order by first_name;

# 2 Cambia el nombre de las columnas store_id, first_name y last_name a Tienda, Nombre y Apellido respectivamente.

SELECT store_id AS TIENDA, first_name AS NOMBRE, last_name AS APELLIDO
FROM customer;

# 3 Ordena de manera descendente la columna Apellido en la consulta 2

SELECT store_id AS TIENDA, first_name AS NOMBRE, last_name AS APELLIDO
FROM customer
ORDER BY APELLIDO DESC;

#Consulta la tabla payment de la base de datos sakila.

SELECT *FROM payment;

SELECT * FROM sakila.payment;

# 4 ¿Cuál es la cantidad mas baja y mas alta de la columna amount?

SELECT MIN(amount) AS CANTIDAD_MINIMA,
MAX(amount) AS CANTIDAD_MAXIMA
FROM payment;

# 5 traer los distintos precios y ordenarlo de manera Ascendente
SELECT DISTINCT amount 
FROM payment
ORDER BY amount ASC;

##===========##
##   WHERE  ##
##===========##

-- Traer todos los registros en la tabla actor donde el nombre es igual a ED

SELECT *FROM actor
WHERE first_name = "ED";

-- Traer todos los registros  en la tabla city donde la city es igual a london
SELECT *FROM city
WHERE city = "london";

-- Traer todos los registros  en la tabla city donde country_id = 102
SELECT *FROM city
WHERE country_id = 102;

-- Traer todos los registros  en la tabla inventory donde film_id sea mayor o igual a 50
SELECT *FROM inventory
WHERE film_id >= 50;

# 6 traer solo los precios distintos de la tabla payment donde el amount sea menor a 3 y ordernarlos de manera descendente

SELECT DISTINCT amount  
FROM payment
WHERE amount < 3
ORDER BY amount DESC;

# 7  traer todos los datos del staff donde el staff_id sea distinto de 2

SELECT *FROM staff
WHERE staff_id <> 2;

# 8 traer todos los idiomas que sean distintos de German

SELECT *FROM language
WHERE name <> "german";

SELECT * FROM sakila.language;

# 9  Consulta description, release_year de la tabla film de la base de datos sakila.
#Filtra la información donde title sea IMPACT ALADDIN*/

SELECT description, release_year FROM film
WHERE title = "IMPACT ALADDIN";

SELECT * FROM sakila.film;

/*#10

Consulta la tabla payment de la base de datos sakila.
Filtra la información donde amount sea mayor a 0.99 y ordenarlo de manera desc*/

SELECT *FROM payment
WHERE amount > 0.99
ORDER BY amount DESC;

SELECT amount FROM payment;

##===========##
## AND OR NOT ##
##===========##

# AND = CUANDO 2 CONDICIONES SEAN VERDADERAS.
# 11 - Traer todos los registros en la tabla country donde el country sea igual a Algeria y ademas el country_id = 2

SELECT *FROM country 
WHERE country = 'Alegria'
AND country_id = 2;

# OR = cuando se cumple una de las condiciones solicitadas 

# 12 - Traer todos los registros en la tabla country donde el country sea igual a Algeria o el country_id = 12

SELECT *FROM country 
WHERE country = 'Alegria'
OR country_id = 2;

# 13 - Traer todos los registro en la tabla language  donde el language_id sea igual a 1 o el name = german

SELECT *FROM language
WHERE language_id = 1
OR name = 'german';

# NOT

##  14 traer todos los registros en la tabla category donde no se encuentren el name Action

SELECT * FROM category
WHERE NOT name = 'Action';

# 15 traer todos los registros en la tabla film donde el rating no sea PG 

SELECT * FROM film
WHERE NOT rating = 'PG';

# 16 traer todos los distintos tipos de rating y que no este contemplado el 'PG'

SELECT DISTINCT rating 
FROM film
WHERE NOT rating = 'PG';

/* 17 
Filtra la información en la tabla payment  donde customer_id sea igual a 36, amount sea mayor a 0.99 y staff_id sea igual a 1
ordenarlos de manera ascendente por amount.
 */

SELECT *FROM payment 
WHERE customer_id = 36
AND amount > 0.99
AND staff_id = 1
ORDER BY amount ASC;

SELECT * FROM sakila.payment;

##===========##
##     IN    ##
##===========##

# IN = trabaja en la clasusa where , y  es una abreviatura de multiples condiciones de OR 

SELECT * FROM sakila.customer;

## 18 traer todos los nombres donde sean Mary y Patricia de la tabla customer

SELECT * FROM customer
WHERE first_name IN ('Mary', 'Patricia');

#OR

#IN

/* 19 
traer todos los registros de la tabla film donde las caracteristicas especiales sea Trailer y Trailer,Deleted Scenes,
ademas el rating tiene que ser G y R y el tiempo de duracion tiene que ser mayor a 50.
Ordenarlos de manera ascendete por tiempo*/

SELECT * FROM film
WHERE special_features IN ('Trailer', 'Trailer, Deleted Scenes')
AND rating IN ('G', 'R' )
AND length > 50
ORDER BY length ASC;

SELECT * FROM film;

/* IN conbinado con NOT*/

SELECT * FROM sakila.category;

# 20 Traer todos los registros menos Action , Children , Animation de la tabla category

SELECT *FROM category
WHERE NOT name IN ('Action', 'Children', 'Animation');

/* 21 Consulta la tabla film_text de la base de datos sakila.

Filtra la información donde title  sea ZORRO ARK, VIRGIN DAISY, UNITED PILOT*/

SELECT * FROM film_text
WHERE title IN ('ZORRO ARK', 'VIRGIN DAISY', 'UNITED PILOT');

/* 22 Consulta la tabla city de la base de datos sakila.

Filtra la información donde city sea Chiayi, Dongying, Fukuyama y Kilis.*/

SELECT * FROM city
WHERE city IN ('Chiayi', 'Dongying', 'Fukuyama', 'Kilis');

##===========##
##  BETWEEN  ##
##===========##

# BETWEEN : lo utilizamos para seleccionar valores dentro de un determinado rango

SELECT * FROM sakila.rental;
# 23 TRAER TODOS LAS RENTAS DONDE el customer_id SEAN DEL 300 AL 500, Y ADEMAS SEAN DEL STAFF_ID = 1. Ordenarlo de manera ASC por customer_id

SELECT *FROM rental
WHERE customer_id BETWEEN 300 AND 500
AND staff_id = 1
ORDER BY customer_id ASC;

SELECT * FROM sakila.payment;

## 24 traer todos los registros de la tabla payment donde el monto sea entre 3 y 5 ordenar por amount de manera DESC

SELECT *FROM payment 
WHERE amount BETWEEN 3 AND 5
ORDER BY amount DESC;

## 25 traer todos los registros de la tabla payment donde el monto no sea entre 3 y 5 ordenar por amount de manera DESC

SELECT *FROM payment
WHERE NOT amount 
BETWEEN 3 AND 5
ORDER BY amount DESC;

/* 26 Consulta la tabla payment de la base de datos sakila.
Filtra la información donde amount esté entre 2.99 y 4.99,
  staff_id sea igual a 2 y customer_id sea 1 y 2.*/
  SELECT * FROM sakila.payment;

SELECT * FROM payment
WHERE amount
BETWEEN 2.99 AND 4.99
AND staff_id = 2
AND customer_id IN (1 , 2);

/* 27 Consulta la tabla address de la base de datos sakila.
Filtra la información donde city_id esté entre 300 y 350,  */

SELECT * FROM sakila.address;

SELECT *FROM address
WHERE city_id 
BETWEEN 300 AND 350;

/* 28  Consulta la tabla film de la base de datos sakila.

Filtra la información donde rental_rate esté entre 0.99 y 2.99, 
length sea menor igual de 50  y replacement_cost sea menor de 20.*/

SELECT *FROM film
WHERE rental_rate
BETWEEN 0.99 AND 2.99
AND length <= 50
AND replacement_cost < 20;

##===========##
##   LIKE    ##
##===========##

# LIKE : SE UTILIZA EN CLAUSULA WHERE PARA BUSCAR UN PATRON ESPECIFICO EN LA CONSULTA

SELECT * FROM sakila.actor;

# 29 TRAER TODOS LOS REGISTROS  EN LA TABLA ACTOR, LOS NOMBRES QUE EMPIENCEN CON LA LETRA "A" Y EL APELLIDO EMPIECE CON LA LETRA "B"

SELECT *FROM actor
WHERE first_name LIKE 'a%'
AND last_name LIKE 'b%';

# 30 TRAER TODOS LOS REGISTROS DONDE LOS NOMBRES TERMINEN CON LA LETRA "A" Y ADEMAS LOS APELLIDOS TERNMINEN CON LA LETRA 'N'

SELECT *FROM actor
WHERE first_name LIKE '%a'
AND last_name LIKE '%n';

## 31 TRAER TODOS LOS REGISTROS DONDE EL NOMBRE CONTIENE LA PALABRA "NE" EN CUALQUIERA DE SUS POSICIONES Y ADEMAS
## QUE TENGA EL APELLIDO LA PALABRA "RO".

SELECT *FROM actor
WHERE first_name LIKE '%ne%'
AND last_name LIKE '%ro%';

# 32 TRAER TODOS LOS REGISTROS DONDE TODOS LOS NOMBRES EMPIECEN CON "A" Y TERMINEN CON "E"

SELECT *FROM actor
WHERE first_name LIKE 'a%'
AND last_name LIKE '%e';

# 33 TRAER TODOS LOS REGISTROS DONDE LOS NOMBRES ENPIECEN CON LA LETRA "C" Y TERMINEN CON "N" Y ADEMAS
# QUE EL APELIIDO EMPIECE CON LA LETRA "g"
SELECT *FROM actor 
WHERE first_name LIKE 'c%n'
AND last_name LIKE 'g%';

/* 34 Consulta la tabla film de la base de datos sakila.

Filtra la información donde release_year sea igual a 2006  y title empiece con ALI.
*/
SELECT * FROM film
WHERE release_year = 2006
AND title LIKE 'ALI%';