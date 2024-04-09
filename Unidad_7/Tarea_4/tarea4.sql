/**
Realiza la carga de la BBDD de Sakila, tal y como se muestra en los enlaces proporcionados. **/
source sakila-data sql
source sakila-schema.sql
/**
Realiza cada una de las siguientes consultas:
Actores que tienen de primer nombre Scarlett. **/
select * from actor where first_name='Scarlett';
/**
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       81 | SCARLETT   | DAMON     | 2006-02-15 04:34:33 |
|      124 | SCARLETT   | BENING    | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+

Actores que tienen de apellido Johansson. **/
select * from actor where last_name='Johansson';
/**
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|        8 | MATTHEW    | JOHANSSON | 2006-02-15 04:34:33 |
|       64 | RAY        | JOHANSSON | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+

Actores que contengan una O en su nombre. **/
select * from actor where first_name regexp 'O' limit 10;
/**
+----------+------------+--------------+---------------------+
| actor_id | first_name | last_name    | last_update         |
+----------+------------+--------------+---------------------+
|        1 | PENELOPE   | GUINESS      | 2006-02-15 04:34:33 |
|        5 | JOHNNY     | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE        | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO       | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT      | 2006-02-15 04:34:33 |
|       24 | CAMERON    | STREEP       | 2006-02-15 04:34:33 |
|       28 | WOODY      | HOFFMAN      | 2006-02-15 04:34:33 |
|       38 | TOM        | MCKELLEN     | 2006-02-15 04:34:33 |
|       39 | GOLDIE     | BRODY        | 2006-02-15 04:34:33 |
|       40 | JOHNNY     | CAGE         | 2006-02-15 04:34:33 |
+----------+------------+--------------+---------------------+
Actores que contengan una O en su nombre y en una A en su apellido. **/
select * from actor where first_name regexp 'O' and last_name regexp 'A' limit 10;
/**
+----------+------------+--------------+---------------------+
| actor_id | first_name | last_name    | last_update         |
+----------+------------+--------------+---------------------+
|        5 | JOHNNY     | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
|        9 | JOE        | SWANK        | 2006-02-15 04:34:33 |
|       11 | ZERO       | CAGE         | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT      | 2006-02-15 04:34:33 |
|       28 | WOODY      | HOFFMAN      | 2006-02-15 04:34:33 |
|       40 | JOHNNY     | CAGE         | 2006-02-15 04:34:33 |
|       42 | TOM        | MIRANDA      | 2006-02-15 04:34:33 |
|       63 | CAMERON    | WRAY         | 2006-02-15 04:34:33 |
|       78 | GROUCHO    | SINATRA      | 2006-02-15 04:34:33 |
|      114 | MORGAN     | MCDORMAND    | 2006-02-15 04:34:33 |
+----------+------------+--------------+---------------------+
Actores que contengan dos O en su nombre y en una A en su apellido. **/

select * from actor
where first_name regexp 'O{2}' and last_name regexp 'A';
/**
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       28 | WOODY      | HOFFMAN   | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+

Actores donde su tercera letra sea B. **/
select * from actor where first_name regexp '..B';
/**
+----------+------------+-----------+---------------------+
| actor_id | first_name | last_name | last_update         |
+----------+------------+-----------+---------------------+
|       15 | CUBA       | OLIVIER   | 2006-02-15 04:34:33 |
|       19 | BOB        | FAWCETT   | 2006-02-15 04:34:33 |
|      118 | CUBA       | ALLEN     | 2006-02-15 04:34:33 |
|      125 | ALBERT     | NOLTE     | 2006-02-15 04:34:33 |
|      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
|      182 | DEBBIE     | AKROYD    | 2006-02-15 04:34:33 |
|      189 | CUBA       | BIRCH     | 2006-02-15 04:34:33 |
+----------+------------+-----------+---------------------+
7 rows in set (0,00 sec)

Ciudades que empiezan por a. **/
select * from city where city regexp '^A' limit 10;
/** 
+---------+------------------------+------------+---------------------+
| city_id | city                   | country_id | last_update         |
+---------+------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)   |         87 | 2006-02-15 04:45:25 |
|       2 | Abha                   |         82 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi              |        101 | 2006-02-15 04:45:25 |
|       4 | Acuña                  |         60 | 2006-02-15 04:45:25 |
|       5 | Adana                  |         97 | 2006-02-15 04:45:25 |
|       6 | Addis Abeba            |         31 | 2006-02-15 04:45:25 |
|       7 | Aden                   |        107 | 2006-02-15 04:45:25 |
|       8 | Adoni                  |         44 | 2006-02-15 04:45:25 |
|       9 | Ahmadnagar             |         44 | 2006-02-15 04:45:25 |
|      10 | Akishima               |         50 | 2006-02-15 04:45:25 |
+---------+------------------------+------------+---------------------+

Ciudades que acaban por s. **/
select * from city
where city regexp 's$'
limit 10;
/** 
+---------+----------------+------------+---------------------+
| city_id | city           | country_id | last_update         |
+---------+----------------+------------+---------------------+
|      25 | Angra dos Reis |         15 | 2006-02-15 04:45:25 |
|      26 | Anápolis       |         15 | 2006-02-15 04:45:25 |
|      79 | Bilbays        |         29 | 2006-02-15 04:45:25 |
|     102 | Caracas        |        104 | 2006-02-15 04:45:25 |
|     118 | Ciomas         |         45 | 2006-02-15 04:45:25 |
|     120 | Citrus Heights |        103 | 2006-02-15 04:45:25 |
|     125 | Coatzacoalcos  |         60 | 2006-02-15 04:45:25 |
|     135 | Dallas         |        103 | 2006-02-15 04:45:25 |
|     137 | Daugavpils     |         54 | 2006-02-15 04:45:25 |
|     147 | Dos Quebradas  |         24 | 2006-02-15 04:45:25 |
+---------+----------------+------------+---------------------+

Ciudades del country 61. **/
select * from city where country_id=61;
/**
+---------+----------+------------+---------------------+
| city_id | city     | country_id | last_update         |
+---------+----------+------------+---------------------+
|     115 | Chisinau |         61 | 2006-02-15 04:45:25 |
+---------+----------+------------+---------------------+

Ciudades del country Spain. **/
select c.* from city as c 
join country as co on c.country_id =co.country_id 
where co.country='Spain';
/**
+---------+-------------------------+------------+---------------------+
| city_id | city                    | country_id | last_update         |
+---------+-------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
|     146 | Donostia-San Sebastián  |         87 | 2006-02-15 04:45:25 |
|     181 | Gijón                   |         87 | 2006-02-15 04:45:25 |
|     388 | Ourense (Orense)        |         87 | 2006-02-15 04:45:25 |
|     459 | Santiago de Compostela  |         87 | 2006-02-15 04:45:25 |
+---------+-------------------------+------------+---------------------+

Ciudades con nombres compuestos. **/
select * from city 
where city regexp ' |-' limit 10;
/**
+---------+------------------------+------------+---------------------+
| city_id | city                   | country_id | last_update         |
+---------+------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)   |         87 | 2006-02-15 04:45:25 |
|       3 | Abu Dhabi              |        101 | 2006-02-15 04:45:25 |
|       6 | Addis Abeba            |         31 | 2006-02-15 04:45:25 |
|      12 | al-Ayn                 |        101 | 2006-02-15 04:45:25 |
|      13 | al-Hawiya              |         82 | 2006-02-15 04:45:25 |
|      14 | al-Manama              |         11 | 2006-02-15 04:45:25 |
|      15 | al-Qadarif             |         89 | 2006-02-15 04:45:25 |
|      16 | al-Qatif               |         82 | 2006-02-15 04:45:25 |
|      18 | Allappuzha (Alleppey)  |         44 | 2006-02-15 04:45:25 |
|      20 | Almirante Brown        |          6 | 2006-02-15 04:45:25 |
+---------+------------------------+------------+---------------------+
Películas con una duración entre 80 y 100. **/
select * from film 
where length between 80 and 100 limit 10;
/**
---------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
| film_id | title                | description                                                                                               | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                              | last_update         |
+---------+----------------------+-----------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
|       1 | ACADEMY DINOSAUR     | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies          |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes              | 2006-02-15 05:03:42 |
|      14 | ALICE FANTASIA       | A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia |         2006 |           1 |                 NULL |               6 |        0.99 |     94 |            23.99 | NC-17  | Trailers,Deleted Scenes,Behind the Scenes     | 2006-02-15 05:03:42 |
|      17 | ALONE TRIP           | A Fast-Paced Character Study of a Composer And a Dog who must Outgun a Boat in An Abandoned Fun House     |         2006 |           1 |                 NULL |               3 |        0.99 |     82 |            14.99 | R      | Trailers,Behind the Scenes                    | 2006-02-15 05:03:42 |
|      22 | AMISTAD MIDSUMMER    | A Emotional Character Study of a Dentist And a Crocodile who must Meet a Sumo Wrestler in California      |         2006 |           1 |                 NULL |               6 |        2.99 |     85 |            10.99 | G      | Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
|      23 | ANACONDA CONFESSIONS | A Lacklusture Display of a Dentist And a Dentist who must Fight a Girl in Australia                       |         2006 |           1 |                 NULL |               3 |        0.99 |     92 |             9.99 | R      | Trailers,Deleted Scenes                       | 2006-02-15 05:03:42 |
|      26 | ANNIE IDENTITY       | A Amazing Panorama of a Pastry Chef And a Boat who must Escape a Woman in An Abandoned Amusement Park     |         2006 |           1 |                 NULL |               3 |        0.99 |     86 |            15.99 | G      | Commentaries,Deleted Scenes                   | 2006-02-15 05:03:42 |
|      28 | ANTHEM LUKE          | A Touching Panorama of a Waitress And a Woman who must Outrace a Dog in An Abandoned Amusement Park       |         2006 |           1 |                 NULL |               5 |        4.99 |     91 |            16.99 | PG-13  | Deleted Scenes,Behind the Scenes              | 2006-02-15 05:03:42 |
|      30 | ANYTHING SAVANNAH    | A Epic Story of a Pastry Chef And a Woman who must Chase a Feminist in An Abandoned Fun House             |         2006 |           1 |                 NULL |               4 |        2.99 |     82 |            27.99 | R      | Trailers,Deleted Scenes,Behind the Scenes     | 2006-02-15 05:03:42 |
|      31 | APACHE DIVINE        | A Awe-Inspiring Reflection of a Pastry Chef And a Teacher who must Overcome a Sumo Wrestler in A U-Boat   |         2006 |           1 |                 NULL |               5 |        4.99 |     92 |            16.99 | NC-17  | Commentaries,Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
|      39 | ARMAGEDDON LOST      | A Fast-Paced Tale of a Boat And a Teacher who must Succumb a Composer in An Abandoned Mine Shaft          |         2006 |           1 |                 NULL |               5 |        0.99 |     99 |            10.99 | G      | Trailers                                      | 2006-02-15 05:03:42 |
+---------+----------------------+-----------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+

Peliculas con un rental_rate entre 1 y 3. **/
select * from film
where rental_rate between 1 and 3 limit 10;
/**
+---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------+---------------------+
| film_id | title             | description                                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                        | last_update         |
+---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------+---------------------+
|       3 | ADAPTATION HOLES  | A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory                      |         2006 |           1 |                 NULL |               7 |        2.99 |     50 |            18.99 | NC-17  | Trailers,Deleted Scenes                 | 2006-02-15 05:03:42 |
|       4 | AFFAIR PREJUDICE  | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          |         2006 |           1 |                 NULL |               5 |        2.99 |    117 |            26.99 | G      | Commentaries,Behind the Scenes          | 2006-02-15 05:03:42 |
|       5 | AFRICAN EGG       | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico |         2006 |           1 |                 NULL |               6 |        2.99 |    130 |            22.99 | G      | Deleted Scenes                          | 2006-02-15 05:03:42 |
|       6 | AGENT TRUMAN      | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                             |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                          | 2006-02-15 05:03:42 |
|       9 | ALABAMA DEVIL     | A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat   |         2006 |           1 |                 NULL |               3 |        2.99 |    114 |            21.99 | PG-13  | Trailers,Deleted Scenes                 | 2006-02-15 05:03:42 |
|      15 | ALIEN CENTER      | A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention                       |         2006 |           1 |                 NULL |               5 |        2.99 |     46 |            10.99 | NC-17  | Trailers,Commentaries,Behind the Scenes | 2006-02-15 05:03:42 |
|      16 | ALLEY EVOLUTION   | A Fast-Paced Drama of a Robot And a Composer who must Battle a Astronaut in New Orleans                               |         2006 |           1 |                 NULL |               6 |        2.99 |    180 |            23.99 | NC-17  | Trailers,Commentaries                   | 2006-02-15 05:03:42 |
|      22 | AMISTAD MIDSUMMER | A Emotional Character Study of a Dentist And a Crocodile who must Meet a Sumo Wrestler in California                  |         2006 |           1 |                 NULL |               6 |        2.99 |     85 |            10.99 | G      | Commentaries,Behind the Scenes          | 2006-02-15 05:03:42 |
|      24 | ANALYZE HOOSIERS  | A Thoughtful Display of a Explorer And a Pastry Chef who must Overcome a Feminist in The Sahara Desert                |         2006 |           1 |                 NULL |               6 |        2.99 |    181 |            19.99 | R      | Trailers,Behind the Scenes              | 2006-02-15 05:03:42 |
|      25 | ANGELS LIFE       | A Thoughtful Display of a Woman And a Astronaut who must Battle a Robot in Berlin                                     |         2006 |           1 |                 NULL |               3 |        2.99 |     74 |            15.99 | G      | Trailers                                | 2006-02-15 05:03:42 |
+---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------+---------------------+

Películas con un titulo de más de 12 letras. **/
select * from film 
where title regexp '.{12}' limit 10;
/**
+---------+------------------+---------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
| film_id | title            | description                                                                                                         | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                 | last_update         |
+---------+------------------+---------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
|       1 | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                    |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
|       2 | ACE GOLDFINGER   | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                |         2006 |           1 |                 NULL |               3 |        4.99 |     48 |            12.99 | G      | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|       3 | ADAPTATION HOLES | A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory                    |         2006 |           1 |                 NULL |               7 |        2.99 |     50 |            18.99 | NC-17  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|       4 | AFFAIR PREJUDICE | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                        |         2006 |           1 |                 NULL |               5 |        2.99 |    117 |            26.99 | G      | Commentaries,Behind the Scenes   | 2006-02-15 05:03:42 |
|       6 | AGENT TRUMAN     | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                           |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                   | 2006-02-15 05:03:42 |
|       7 | AIRPLANE SIERRA  | A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat                                   |         2006 |           1 |                 NULL |               6 |        4.99 |     62 |            28.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|       8 | AIRPORT POLLOCK  | A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India                                       |         2006 |           1 |                 NULL |               6 |        4.99 |     54 |            15.99 | R      | Trailers                         | 2006-02-15 05:03:42 |
|       9 | ALABAMA DEVIL    | A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat |         2006 |           1 |                 NULL |               3 |        2.99 |    114 |            21.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|      10 | ALADDIN CALENDAR | A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China                           |         2006 |           1 |                 NULL |               6 |        4.99 |     63 |            24.99 | NC-17  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|      11 | ALAMO VIDEOTAPE  | A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention                           |         2006 |           1 |                 NULL |               6 |        0.99 |    126 |            16.99 | G      | Commentaries,Behind the Scenes   | 2006-02-15 05:03:42 |
+---------+------------------+---------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+

Peliculas con un rating de PG o G. **/
select * from film
where rating regexp '[PGG]$' limit 10;
/**
+---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
| film_id | title             | description                                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                              | last_update         |
+---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
|       1 | ACADEMY DINOSAUR  | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                      |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes              | 2006-02-15 05:03:42 |
|       2 | ACE GOLDFINGER    | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                  |         2006 |           1 |                 NULL |               3 |        4.99 |     48 |            12.99 | G      | Trailers,Deleted Scenes                       | 2006-02-15 05:03:42 |
|       4 | AFFAIR PREJUDICE  | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          |         2006 |           1 |                 NULL |               5 |        2.99 |    117 |            26.99 | G      | Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
|       5 | AFRICAN EGG       | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico |         2006 |           1 |                 NULL |               6 |        2.99 |    130 |            22.99 | G      | Deleted Scenes                                | 2006-02-15 05:03:42 |
|       6 | AGENT TRUMAN      | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                             |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                                | 2006-02-15 05:03:42 |
|      11 | ALAMO VIDEOTAPE   | A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention                             |         2006 |           1 |                 NULL |               6 |        0.99 |    126 |            16.99 | G      | Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
|      12 | ALASKA PHANTOM    | A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia                                    |         2006 |           1 |                 NULL |               6 |        0.99 |    136 |            22.99 | PG     | Commentaries,Deleted Scenes                   | 2006-02-15 05:03:42 |
|      13 | ALI FOREVER       | A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies                 |         2006 |           1 |                 NULL |               4 |        4.99 |    150 |            21.99 | PG     | Deleted Scenes,Behind the Scenes              | 2006-02-15 05:03:42 |
|      19 | AMADEUS HOLY      | A Emotional Display of a Pioneer And a Technical Writer who must Battle a Man in A Baloon                             |         2006 |           1 |                 NULL |               6 |        0.99 |    113 |            20.99 | PG     | Commentaries,Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
|      22 | AMISTAD MIDSUMMER | A Emotional Character Study of a Dentist And a Crocodile who must Meet a Sumo Wrestler in California                  |         2006 |           1 |                 NULL |               6 |        2.99 |     85 |            10.99 | G      | Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
+---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+

Peliculas que no tengan un rating de NC-17. **/
select * from film 
where rating not regexp 'NC-17' limit 10;
/**
------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
| film_id | title            | description                                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                 | last_update         |
+---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
|       1 | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                      |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
|       2 | ACE GOLDFINGER   | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                  |         2006 |           1 |                 NULL |               3 |        4.99 |     48 |            12.99 | G      | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|       4 | AFFAIR PREJUDICE | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          |         2006 |           1 |                 NULL |               5 |        2.99 |    117 |            26.99 | G      | Commentaries,Behind the Scenes   | 2006-02-15 05:03:42 |
|       5 | AFRICAN EGG      | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico |         2006 |           1 |                 NULL |               6 |        2.99 |    130 |            22.99 | G      | Deleted Scenes                   | 2006-02-15 05:03:42 |
|       6 | AGENT TRUMAN     | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                             |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                   | 2006-02-15 05:03:42 |
|       7 | AIRPLANE SIERRA  | A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat                                     |         2006 |           1 |                 NULL |               6 |        4.99 |     62 |            28.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|       8 | AIRPORT POLLOCK  | A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India                                         |         2006 |           1 |                 NULL |               6 |        4.99 |     54 |            15.99 | R      | Trailers                         | 2006-02-15 05:03:42 |
|       9 | ALABAMA DEVIL    | A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat   |         2006 |           1 |                 NULL |               3 |        2.99 |    114 |            21.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
|      11 | ALAMO VIDEOTAPE  | A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention                             |         2006 |           1 |                 NULL |               6 |        0.99 |    126 |            16.99 | G      | Commentaries,Behind the Scenes   | 2006-02-15 05:03:42 |
|      12 | ALASKA PHANTOM   | A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia                                    |         2006 |           1 |                 NULL |               6 |        0.99 |    136 |            22.99 | PG     | Commentaries,Deleted Scenes      | 2006-02-15 05:03:42 |
+---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+

Peliculas con un rating PG y duracion de más de 120. **/
select * from film
where rating regexp '^PG$' and length>120 limit 10;
/**
-----------------+-----------------+-------------+--------+------------------+--------+-------------------------------------------+---------------------+
| film_id | title                | description                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                          | last_update         |
+---------+----------------------+-------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-------------------------------------------+---------------------+
|       6 | AGENT TRUMAN         | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China             |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                            | 2006-02-15 05:03:42 |
|      12 | ALASKA PHANTOM       | A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia                    |         2006 |           1 |                 NULL |               6 |        0.99 |    136 |            22.99 | PG     | Commentaries,Deleted Scenes               | 2006-02-15 05:03:42 |
|      13 | ALI FOREVER          | A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies |         2006 |           1 |                 NULL |               4 |        4.99 |    150 |            21.99 | PG     | Deleted Scenes,Behind the Scenes          | 2006-02-15 05:03:42 |
|      37 | ARIZONA BANG         | A Brilliant Panorama of a Mad Scientist And a Mad Cow who must Meet a Pioneer in A Monastery          |         2006 |           1 |                 NULL |               3 |        2.99 |    121 |            28.99 | PG     | Trailers,Deleted Scenes                   | 2006-02-15 05:03:42 |
|      41 | ARSENIC INDEPENDENCE | A Fanciful Documentary of a Mad Cow And a Womanizer who must Find a Dentist in Berlin                 |         2006 |           1 |                 NULL |               4 |        0.99 |    137 |            17.99 | PG     | Trailers,Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
|      74 | BIRCH ANTITRUST      | A Fanciful Panorama of a Husband And a Pioneer who must Outgun a Dog in A Baloon                      |         2006 |           1 |                 NULL |               4 |        4.99 |    162 |            18.99 | PG     | Trailers,Commentaries,Deleted Scenes      | 2006-02-15 05:03:42 |
|      88 | BORN SPINAL          | A Touching Epistle of a Frisbee And a Husband who must Pursue a Student in Nigeria                    |         2006 |           1 |                 NULL |               7 |        4.99 |    179 |            17.99 | PG     | Trailers,Commentaries,Deleted Scenes      | 2006-02-15 05:03:42 |
|      93 | BRANNIGAN SUNRISE    | A Amazing Epistle of a Moose And a Crocodile who must Outrace a Dog in Berlin                         |         2006 |           1 |                 NULL |               4 |        4.99 |    121 |            27.99 | PG     | Trailers                                  | 2006-02-15 05:03:42 |
|      99 | BRINGING HYSTERICAL  | A Fateful Saga of a A Shark And a Technical Writer who must Find a Woman in A Jet Boat                |         2006 |           1 |                 NULL |               7 |        2.99 |    136 |            14.99 | PG     | Trailers                                  | 2006-02-15 05:03:42 |
|     103 | BUCKET BROTHERHOOD   | A Amazing Display of a Girl And a Womanizer who must Succumb a Lumberjack in A Baloon Factory         |         2006 |           1 |                 NULL |               7 |        4.99 |    133 |            27.99 | PG     | Commentaries,Deleted Scenes               | 2006-02-15 05:03:42 |
+---------+----------------------+-------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-------------------------------------------+---------------------+

¿Cuantos actores hay? **/
select count(*) from actor;
/**
+----------+
| count(*) |
+----------+
|      200 |
+----------+
        
¿Cuántas ciudades tiene el country Spain? **/
select count(c.city_id) from city as c 
join country as co on c.country_id=co.country_id
where country='Spain';
/**
+------------------+
| count(c.city_id) |
+------------------+
|                5 |
+------------------+

¿Cuántos countries hay que empiezan por a? **/
select count(*) from country
where country regexp '^A';
/**
+----------+
| count(*) |
+----------+
|       10 |
+----------+

Media de duración de peliculas con PG. **/
select avg(length) from film
where rating regexp '^PG$'; 
/**
+-------------+
| avg(length) |
+-------------+
|    112.0052 |
+-------------+

Suma de rental_rate de todas las peliculas. **/
select sum(rental_rate) from film;
/**
+------------------+
| sum(rental_rate) |
+------------------+
|          2980.00 |
+------------------+

Pelicula con mayor duración. **/
select * from film
where length=(
  select max(length)
) limit 1;
/**
+---------+------------------+--------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
| film_id | title            | description                                                                                      | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                 | last_update         |
+---------+------------------+--------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
|       1 | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
+---------+------------------+--------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+

Película con menor duración. **/
select * from film
where length=(
  select min(length)
) limit 1;
/**
+---------+------------------+--------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
| film_id | title            | description                                                                                      | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                 | last_update         |
+---------+------------------+--------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
|       1 | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
+---------+------------------+--------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+

Mostrar las ciudades del country Spain (multitabla). **/
select c.* from city as c 
join country as co on c.country_id=co.country_id
where co.country='Spain';
/**
+---------+-------------------------+------------+---------------------+
| city_id | city                    | country_id | last_update         |
+---------+-------------------------+------------+---------------------+
|       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
|     146 | Donostia-San Sebastián  |         87 | 2006-02-15 04:45:25 |
|     181 | Gijón                   |         87 | 2006-02-15 04:45:25 |
|     388 | Ourense (Orense)        |         87 | 2006-02-15 04:45:25 |
|     459 | Santiago de Compostela  |         87 | 2006-02-15 04:45:25 |
+---------+-------------------------+------------+---------------------+

Mostrar el nombre de la película y el nombre de los actores. **/
select a.first_name, a.last_name, f.title from actor as a 
join film_actor as fa on fa.actor_id=a.actor_id
join film as f on f.film_id=fa.film_id
limit 10;

/**
+------------+-----------+-----------------------+
| first_name | last_name | title                 |
+------------+-----------+-----------------------+
| PENELOPE   | GUINESS   | ACADEMY DINOSAUR      |
| PENELOPE   | GUINESS   | ANACONDA CONFESSIONS  |
| PENELOPE   | GUINESS   | ANGELS LIFE           |
| PENELOPE   | GUINESS   | BULWORTH COMMANDMENTS |
| PENELOPE   | GUINESS   | CHEAPER CLYDE         |
| PENELOPE   | GUINESS   | COLOR PHILADELPHIA    |
| PENELOPE   | GUINESS   | ELEPHANT TROJAN       |
| PENELOPE   | GUINESS   | GLEAMING JAWBREAKER   |
| PENELOPE   | GUINESS   | HUMAN GRAFFITI        |
| PENELOPE   | GUINESS   | KING EVOLUTION        |
+------------+-----------+-----------------------+

Mostrar el nombre de la película y el de sus categorías. **/
select f.title, c.name from film as f 
join film_category as fc on fc.film_id=f.film_id
join category as c on c.category_id=fc.category_id 
limit 10;
/**
+---------------------+--------+
| title               | name   |
+---------------------+--------+
| AMADEUS HOLY        | Action |
| AMERICAN CIRCUS     | Action |
| ANTITRUST TOMATOES  | Action |
| ARK RIDGEMONT       | Action |
| BAREFOOT MANCHURIAN | Action |
| BERETS AGENT        | Action |
| BRIDE INTRIGUE      | Action |
| BULL SHAWSHANK      | Action |
| CADDYSHACK JEDI     | Action |
| CAMPUS REMEMBER     | Action |
+---------------------+--------+

Mostrar el country, la ciudad y dirección de cada miembro del staff. **/
select s.*, a.address, c.city, co.country from staff as s 
join address as a on a.address_id=s.address_id
join city as c on c.city_id=a.city_id
join country as co on co.country_id=c.country_id;

/**

Mostrar el country, la ciudad y dirección de cada customer. **/
select cus.*, c.city, co.country, a.address from customer as cus
join address as a on a.address_id=cus.address_id
join city as c on c.city_id=a.city_id
join country as co on co.country_id=c.country_id
limit 10;
/**
+-------------+----------+------------+-----------+-------------------------------------+------------+--------+---------------------+---------------------+-----------------+----------------+-------------------------------+
| customer_id | store_id | first_name | last_name | email                               | address_id | active | create_date         | last_update         | city            | country        | address                       |
+-------------+----------+------------+-----------+-------------------------------------+------------+--------+---------------------+---------------------+-----------------+----------------+-------------------------------+
|         218 |        1 | VERA       | MCCOY     | VERA.MCCOY@sakilacustomer.org       |        222 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 | Kabul           | Afghanistan    | 1168 Najafabad Parkway        |
|         441 |        1 | MARIO      | CHEATHAM  | MARIO.CHEATHAM@sakilacustomer.org   |        446 |      1 | 2006-02-14 22:04:37 | 2006-02-15 04:57:20 | Batna           | Algeria        | 1924 Shimonoseki Drive        |
|          69 |        2 | JUDY       | GRAY      | JUDY.GRAY@sakilacustomer.org        |         73 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 | Béchar          | Algeria        | 1031 Daugavpils Parkway       |
|         176 |        1 | JUNE       | CARROLL   | JUNE.CARROLL@sakilacustomer.org     |        180 |      1 | 2006-02-14 22:04:36 | 2006-02-15 04:57:20 | Skikda          | Algeria        | 757 Rustenburg Avenue         |
|         320 |        2 | ANTHONY    | SCHWAB    | ANTHONY.SCHWAB@sakilacustomer.org   |        325 |      1 | 2006-02-14 22:04:37 | 2006-02-15 04:57:20 | Tafuna          | American Samoa | 1892 Nabereznyje Tšelny Lane  |
|         528 |        1 | CLAUDE     | HERZOG    | CLAUDE.HERZOG@sakilacustomer.org    |        534 |      1 | 2006-02-14 22:04:37 | 2006-02-15 04:57:20 | Benguela        | Angola         | 486 Ondo Parkway              |
|         383 |        1 | MARTIN     | BALES     | MARTIN.BALES@sakilacustomer.org     |        388 |      1 | 2006-02-14 22:04:37 | 2006-02-15 04:57:20 | Namibe          | Angola         | 368 Huánuco Boulevard         |
|         381 |        2 | BOBBY      | BOUDREAU  | BOBBY.BOUDREAU@sakilacustomer.org   |        386 |      1 | 2006-02-14 22:04:37 | 2006-02-15 04:57:20 | South Hill      | Anguilla       | 1368 Maracaíbo Boulevard      |
|         359 |        2 | WILLIE     | MARKHAM   | WILLIE.MARKHAM@sakilacustomer.org   |        364 |      1 | 2006-02-14 22:04:37 | 2006-02-15 04:57:20 | Almirante Brown | Argentina      | 1623 Kingstown Drive          |
|         560 |        1 | JORDAN     | ARCHULETA | JORDAN.ARCHULETA@sakilacustomer.org |        566 |      1 | 2006-02-14 22:04:37 | 2006-02-15 04:57:20 | Avellaneda      | Argentina      | 1229 Varanasi (Benares) Manor |
+-------------+----------+------------+-----------+-------------------------------------+------------+--------+---------------------+---------------------+-----------------+----------------+-------------------------------+

Numero de películas de cada rating **/
select count(*), rating from film
group by rating;
/**
+----------+--------+
| count(*) | rating |
+----------+--------+
|      194 | PG     |
|      178 | G      |
|      210 | NC-17  |
|      223 | PG-13  |
|      195 | R      |
+----------+--------+

Cuantas películas ha realizado el actor ED CHASE. **/
select count(f.film_id) from actor as a 
join film_actor as fa on fa.actor_id=a.actor_id
join film as f on f.film_id=fa.film_id
where a.first_name='ED' and a.last_name='CHASE';
/**
+------------------+
| count(f.film_id) |
+------------------+
|               22 |
+------------------+

Media de duración de las películas cada categoría. **/
select avg(f.length), c.name from film as f 
join film_category as fc on fc.film_id=f.film_id
join category as c on c.category_id=fc.category_id
group by c.name;
/**
+---------------+-------------+
| avg(f.length) | name        |
+---------------+-------------+
|      111.6094 | Action      |
|      111.0152 | Animation   |
|      109.8000 | Children    |
|      111.6667 | Classics    |
|      115.8276 | Comedy      |
|      108.7500 | Documentary |
|      120.8387 | Drama       |
|      114.7826 | Family      |
|      121.6986 | Foreign     |
|      127.8361 | Games       |
|      112.4821 | Horror      |
|      113.6471 | Music       |
|      111.1270 | New         |
|      108.1967 | Sci-Fi      |
|      128.2027 | Sports      |
|      113.3158 | Travel      |
+---------------+-------------+
Nota: Se debe de mostrar la salida de cada una de las consultas.

A continuación se muestran algunas de las vistas que se han utilizado en la base de datos Sakila:

--
-- View structure for view `customer_list`
--

CREATE VIEW customer_list AS
SELECT 
  cu.customer_id AS ID, 
    CONCAT(cu.first_name, _utf8mb4' ', cu.last_name) AS name, 
    a.address AS address, 
    a.postal_code AS `zip code`,
  a.phone AS phone, 
    city.city AS city, 
    country.country AS country, 
    IF(cu.active, _utf8mb4'active',_utf8mb4'') AS notes, 
    cu.store_id AS SID
FROM 
  customer AS cu JOIN address AS a 
    ON cu.address_id = a.address_id 
    JOIN city 
    ON a.city_id = city.city_id
  JOIN country 
    ON city.country_id = country.country_id;
--
-- View structure for view `film_list`
--

CREATE VIEW film_list AS
SELECT 
  film.film_id AS FID, 
    film.title AS title, 
    film.description AS description, 
    category.name AS category, 
    film.rental_rate AS price,
  film.length AS length, 
    film.rating AS rating, 
    GROUP_CONCAT(CONCAT(actor.first_name, _utf8mb4' ', actor.last_name) SEPARATOR ', ') AS actors
FROM 
  category LEFT JOIN film_category 
    ON category.category_id = film_category.category_id 
    LEFT JOIN film 
    ON film_category.film_id = film.film_id
  JOIN film_actor 
    ON film.film_id = film_actor.film_id
  JOIN actor 
    ON film_actor.actor_id = actor.actor_id
GROUP BY film.film_id, category.name;

Conociendo es estos momentos ya la BBDD, se pide:

    Muestra el resultado de la consulta de las vistas que se proporcionan.

Mostrar el nombre de la película y el nombre de los actores. **/

select title, actors from film_list limit 10;
/**
+------------------+------------------------------------------------------------------------------------------------------------------------------------------------+
| title            | actors                                                                                                                                         |
+------------------+------------------------------------------------------------------------------------------------------------------------------------------------+
| ACADEMY DINOSAUR | CHRISTIAN GABLE, LUCILLE TRACY, SANDRA PECK, JOHNNY CAGE, MENA TEMPLE, WARREN NOLTE, OPRAH KILMER, ROCK DUKAKIS, MARY KEITEL, PENELOPE GUINESS |
| ACE GOLDFINGER   | CHRIS DEPP, SEAN GUINESS, MINNIE ZELLWEGER, BOB FAWCETT                                                                                        |
| ADAPTATION HOLES | NICK WAHLBERG, BOB FAWCETT, CAMERON STREEP, RAY JOHANSSON, JULIANNE DENCH                                                                      |
| AFFAIR PREJUDICE | JODIE DEGENERES, SCARLETT DAMON, KENNETH PESCI, FAY WINSLET, OPRAH KILMER                                                                      |
| AFRICAN EGG      | DUSTIN TAUTOU, THORA TEMPLE, MATTHEW CARREY, MATTHEW LEIGH, GARY PHOENIX                                                                       |
| AGENT TRUMAN     | KIRSTEN PALTROW, SANDRA KILMER, JAYNE NEESON, WARREN NOLTE, MORGAN WILLIAMS, KENNETH HOFFMAN, REESE WEST                                       |
| AIRPLANE SIERRA  | RICHARD PENN, MICHAEL BOLGER, MENA HOPPER, OPRAH KILMER, JIM MOSTEL                                                                            |
| AIRPORT POLLOCK  | FAY KILMER, GENE WILLIS, SUSAN DAVIS, LUCILLE DEE                                                                                              |
| ALABAMA DEVIL    | WARREN NOLTE, GRETA KEITEL, WILLIAM HACKMAN, MERYL ALLEN, CHRISTIAN GABLE, MENA TEMPLE, RIP WINSLET, ELVIS MARX, RIP CRAWFORD                  |
| ALADDIN CALENDAR | ALEC WAYNE, JUDY DEAN, VAL BOLGER, RAY JOHANSSON, RENEE TRACY, JADA RYDER, GRETA MALDEN, ROCK DUKAKIS                                          |
+------------------+------------------------------------------------------------------------------------------------------------------------------------------------+

Mostrar el nombre de la película y el de sus categorías. **/
select title, category from film_list limit 10;
/**
+------------------+-------------+
| title            | category    |
+------------------+-------------+
| ACADEMY DINOSAUR | Documentary |
| ACE GOLDFINGER   | Horror      |
| ADAPTATION HOLES | Documentary |
| AFFAIR PREJUDICE | Horror      |
| AFRICAN EGG      | Family      |
| AGENT TRUMAN     | Foreign     |
| AIRPLANE SIERRA  | Comedy      |
| AIRPORT POLLOCK  | Horror      |
| ALABAMA DEVIL    | Horror      |
| ALADDIN CALENDAR | Sports      |
+------------------+-------------+

Mostrar el country, la ciudad y dirección de cada customer. **/
select  name, address, city, country from customer_list limit 10;
/**
+------------------+-------------------------------+-----------------+----------------+
| name             | address                       | city            | country        |
+------------------+-------------------------------+-----------------+----------------+
| VERA MCCOY       | 1168 Najafabad Parkway        | Kabul           | Afghanistan    |
| MARIO CHEATHAM   | 1924 Shimonoseki Drive        | Batna           | Algeria        |
| JUDY GRAY        | 1031 Daugavpils Parkway       | Béchar          | Algeria        |
| JUNE CARROLL     | 757 Rustenburg Avenue         | Skikda          | Algeria        |
| ANTHONY SCHWAB   | 1892 Nabereznyje Tšelny Lane  | Tafuna          | American Samoa |
| CLAUDE HERZOG    | 486 Ondo Parkway              | Benguela        | Angola         |
| MARTIN BALES     | 368 Huánuco Boulevard         | Namibe          | Angola         |
| BOBBY BOUDREAU   | 1368 Maracaíbo Boulevard      | South Hill      | Anguilla       |
| WILLIE MARKHAM   | 1623 Kingstown Drive          | Almirante Brown | Argentina      |
| JORDAN ARCHULETA | 1229 Varanasi (Benares) Manor | Avellaneda      | Argentina      |
+------------------+-------------------------------+-----------------+----------------+

Cuantas películas ha realizado el actor ED CHASE. **/
select count(*) from film_list 
where actors regexp 'ED CHASE';
/**
+----------+
| count(*) |
+----------+
|       22 |
+----------+

Media de duración de las películas cada categoría. **/
select avg(length), category from film_list
group by category 
limit 10;
/**
+-------------+-------------+
| avg(length) | category    |
+-------------+-------------+
|    108.7500 | Documentary |
|    112.4821 | Horror      |
|    114.7826 | Family      |
|    121.6986 | Foreign     |
|    115.8276 | Comedy      |
|    128.2027 | Sports      |
|    113.6471 | Music       |
|    111.6667 | Classics    |
|    111.0152 | Animation   |
|    111.6094 | Action      |
+-------------+-------------+

    Crea 5 vistas sobre la BBDD, y realizar la consulta, para mostrar los resultados. Las vistas deben de tener 3 o más tablas de la BBDD.
**/
create view full_address_list as 
select a.*, c.city, co.country from address as a
join city as c on c.city_id=a.city_id
join country as co on c.country_id=co.country_id;

select * from full_address_list limit 5;
/**
+------------+-------------------------------+----------+----------+---------+-------------+--------------+------------------------------------------------------+---------------------+---------+----------------+
| address_id | address                       | address2 | district | city_id | postal_code | phone        | location                                             | last_update         | city    | country        |
+------------+-------------------------------+----------+----------+---------+-------------+--------------+------------------------------------------------------+---------------------+---------+----------------+
|        222 | 1168 Najafabad Parkway        |          | Kabol    |     251 | 40301       | 886649065861 | 0x0000000001010000009173AC9C074B51408EBDCDD199434140 | 2014-09-25 22:29:59 | Kabul   | Afghanistan    |
|        446 | 1924 Shimonoseki Drive        |          | Batna    |      59 | 52625       | 406784385440 | 0x000000000101000000347CB03154B21840DF814B112AC74140 | 2014-09-25 22:29:59 | Batna   | Algeria        |
|         73 | 1031 Daugavpils Parkway       |          | Béchar   |      63 | 59025       | 107137400143 | 0x00000000010100000000000000000000000000000000000000 | 2014-09-25 22:29:59 | Béchar  | Algeria        |
|        180 | 757 Rustenburg Avenue         |          | Skikda   |     483 | 89668       | 506134035434 | 0x000000000101000000BFD76BD509A31B4063867C8626704240 | 2014-09-25 22:30:01 | Skikda  | Algeria        |
|        325 | 1892 Nabereznyje Tšelny Lane  |          | Tutuila  |     516 | 28396       | 478229987054 | 0x00000000010100000000000000000000000000000000000000 | 2014-09-25 22:30:02 | Tafuna  | American Samoa |
+------------+-------------------------------+----------+----------+---------+-------------+--------------+------------------------------------------------------+---------------------+---------+----------------+
5 rows in set (0,00 sec)
**/

create view payment_address as 
select p.payment_id, p.amount, co.country, c.city, concat(a.address, a.address2) as full_address, 
a.postal_code from address as a 
join city as c on c.city_id=a.city_id
join country as co on co.country_id=c.country_id
join customer as cus on cus.address_id=a.address_id
join payment as p on p.customer_id=p.customer_id;

select * from payment_address limit 5;
/**
+------------+--------+-------------+----------+--------------------------+-------------+
| payment_id | amount | country     | city     | full_address             | postal_code |
+------------+--------+-------------+----------+--------------------------+-------------+
|          1 |   2.99 | China       | Tieli    | 1325 Fukuyama Street     | 27107       |
|          1 |   2.99 | Switzerland | Lausanne | 1331 Usak Boulevard      | 61960       |
|          1 |   2.99 | Peru        | Sullana  | 1103 Quilmes Boulevard   | 52137       |
|          1 |   2.99 | Greece      | Patras   | 1101 Bucuresti Boulevard | 97661       |
|          1 |   2.99 | China       | Jinzhou  | 844 Bucuresti Place      | 36603       |
+------------+--------+-------------+----------+--------------------------+-------------+
**/
create view rental_reminder as
select concat(cus.first_name, ' ', cus.last_name) as name, a.phone, r.return_date
from customer as cus 
join address as a on a.address_id=cus.address_id
join rental as r on cus.customer_id=r.customer_id;
/**
+------------+-------------+---------------------+
| name       | phone       | return_date         |
+------------+-------------+---------------------+
| MARY SMITH | 28303384290 | 2005-06-03 12:00:37 |
| MARY SMITH | 28303384290 | 2005-06-03 06:32:23 |
| MARY SMITH | 28303384290 | 2005-06-23 02:42:12 |
| MARY SMITH | 28303384290 | 2005-06-19 15:54:53 |
| MARY SMITH | 28303384290 | 2005-06-25 02:26:46 |
+------------+-------------+---------------------+
**/
create view store_sales as
select p.amount, s.store_id, concat(fal.address, ' ', fal.city, ' ', fal.country) as store_address
from payment as p 
join staff as sf on sf.staff_id=p.staff_id
join store as s on s.store_id=sf.store_id
join full_address_list as fal on s.address_id=fal.address_id limit 5;

select * from store_sales limit 5;
/**
+--------+----------+-------------------------------------+
| amount | store_id | store_address                       |
+--------+----------+-------------------------------------+
|   2.99 |        1 | 47 MySakila Drive Lethbridge Canada |
|   0.99 |        1 | 47 MySakila Drive Lethbridge Canada |
|   5.99 |        1 | 47 MySakila Drive Lethbridge Canada |
|   4.99 |        1 | 47 MySakila Drive Lethbridge Canada |
|   4.99 |        1 | 47 MySakila Drive Lethbridge Canada |
+--------+----------+-------------------------------------+
**/
create view film_inventory as
select f.title, i.inventory_id, s.store_id, sum(p.amount) as amount from film as f 
join inventory as i on i.film_id=f.film_id
join store as s on s.store_id=i.store_id
join rental as r on r.inventory_id=i.inventory_id
join payment as p on p.rental_id=r.rental_id
group by i.inventory_id;

select * from film_inventory limit 5;

/**+------------------+--------------+----------+--------+
| title            | inventory_id | store_id | amount |
+------------------+--------------+----------+--------+
| ACADEMY DINOSAUR |            1 |        1 |   8.97 |
| ACADEMY DINOSAUR |            2 |        1 |   7.95 |
| ACADEMY DINOSAUR |            3 |        1 |   1.98 |
| ACADEMY DINOSAUR |            4 |        1 |   1.98 |
| AFFAIR PREJUDICE |           16 |        1 |  12.97 |
+------------------+--------------+----------+--------+
**/