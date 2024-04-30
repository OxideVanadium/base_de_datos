CREATE DATABASE IF NOT EXISTS ejercicios_db;
USE ejercicios_db;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    email VARCHAR(50)
);

INSERT INTO usuarios (nombre, edad, email) VALUES
('Juan', 25, 'juan@example.com'),
('María', 30, 'maria@example.com'),
('Pedro', 35, 'pedro@example.com'),
('Ana', 28, 'ana@example.com'),
('Luis', 40, 'luis@example.com'),
('Laura', 22, 'laura@example.com'),
('Carlos', 33, 'carlos@example.com'),
('Sofía', 27, 'sofia@example.com'),
('Diego', 29, 'diego@example.com'),
('Elena', 31, 'elena@example.com');

/** Se pide realizar los procedimientos y funciones:

Crea un procedimiento almacenado que muestre todos los usuarios de la tabla. **/
delimiter $$
create procedure users()
begin
select * from usuarios;
end$$

delimiter ;

call users();
/**
+----+--------+------+--------------------+
| id | nombre | edad | email              |
+----+--------+------+--------------------+
|  1 | Juan   |   25 | juan@example.com   |
|  2 | María  |   30 | maria@example.com  |
|  3 | Pedro  |   35 | pedro@example.com  |
|  4 | Ana    |   28 | ana@example.com    |
|  5 | Luis   |   40 | luis@example.com   |
|  6 | Laura  |   22 | laura@example.com  |
|  7 | Carlos |   33 | carlos@example.com |
|  8 | Sofía  |   27 | sofia@example.com  |
|  9 | Diego  |   29 | diego@example.com  |
| 10 | Elena  |   31 | elena@example.com  |
+----+--------+------+--------------------+

Crea una función que devuelva el promedio de edad de todos los usuarios. **/
delimiter $$

create function m_age() returns float DETERMINISTIC
begin
declare age float;
select avg(edad) from usuarios into age;
return age;
end$$

delimiter ;

select m_age();
/**
+---------+
| m_age() |
+---------+
|      30 |
+---------+

Crea un procedimiento almacenado que inserte un nuevo usuario en la tabla. **/
delimiter $$

create procedure new(in n_nombre VARCHAR(50), in n_edad int, in n_email VARCHAR(50)) 
begin
insert into usuarios(nombre, edad, email)
values(n_nombre, n_edad, n_email);
end$$

delimiter ;

/**
mysql> call new('a', 1, 'a');
Query OK, 1 row affected (0,00 sec)

mysql> select * from usuarios;
+----+--------+------+--------------------+
| id | nombre | edad | email              |
+----+--------+------+--------------------+
|  1 | Juan   |   25 | juan@example.com   |
|  2 | María  |   30 | maria@example.com  |
|  3 | Pedro  |   35 | pedro@example.com  |
|  4 | Ana    |   28 | ana@example.com    |
|  5 | Luis   |   40 | luis@example.com   |
|  6 | Laura  |   22 | laura@example.com  |
|  7 | Carlos |   33 | carlos@example.com |
|  8 | Sofía  |   27 | sofia@example.com  |
|  9 | Diego  |   29 | diego@example.com  |
| 10 | Elena  |   31 | elena@example.com  |
| 11 | a      |    1 | a                  |


Crea una función que devuelva el nombre del usuario más joven. **/
delimiter $$

create function young() returns int DETERMINISTIC
begin
declare yongest int;
select nombre from usuarios 
where edad=(
    select min(edad) from usuarios
)
limit 1;
return yongest 
into yongest;
end$$

delimiter ;

delimiter $$ 

create function calcular_suma_pagos_cliente(cod_cli int) returns float DETERMINISTIC
begin
declare suma_cliente float;
select sum(total) from pago
where codigo_cliente=cod_cli
into suma_cliente;
return suma_cliente;
end$$

delimiter ;

/**
Crea un procedimiento almacenado que actualice la edad de un usuario dado su nombre. **/
delimiter $$

create procedure n_age(in n_nombre VARCHAR(50), in n_edad int)
begin 
update usuarios
set edad=n_edad
where nombre=n_nombre;
end$$

delimiter ;

/**
call n_age('a', 15);

mysql> select * from usuarios;
+----+--------+------+--------------------+
| id | nombre | edad | email              |
+----+--------+------+--------------------+
|  1 | Juan   |   25 | juan@example.com   |
|  2 | María  |   30 | maria@example.com  |
|  3 | Pedro  |   35 | pedro@example.com  |
|  4 | Ana    |   28 | ana@example.com    |
|  5 | Luis   |   40 | luis@example.com   |
|  6 | Laura  |   22 | laura@example.com  |
|  7 | Carlos |   33 | carlos@example.com |
|  8 | Sofía  |   27 | sofia@example.com  |
|  9 | Diego  |   29 | diego@example.com  |
| 10 | Elena  |   31 | elena@example.com  |
| 11 | a      |   15 | a                  |
+----+--------+------+--------------------+
11 rows in set (0,00 sec)

Crea una función que devuelva el número total de usuarios en la tabla. **/
delimiter $$

create function us_t() returns int DETERMINISTIC
begin
declare n_us int;
select count(*) from usuarios into n_us;
return n_us;
end$$

delimiter ;

/**
mysql> select us_t();
+--------+
| us_t() |
+--------+
|     11 |
+--------+
1 row in set (0,01 sec)

Crea un procedimiento almacenado que elimine un usuario dado su email. **/
delimiter $$

create procedure d_us(in em VARCHAR())
begin
delete from usuarios where email=em;
end$$

delimiter ;


/**
Crea una función que devuelva el nombre del usuario más viejo. **/
delimiter $$

create function old() returns DETERMINISTIC int
begin
declare oldest VARCHAR();
select nombre from usuario 
where edad=(
    select max(edad) from usuarios
) 
into oldest limit ;
end$$

delimiter ;

/**
Crea un procedimiento almacenado que ordene los usuarios por edad de forma ascendente y muestre el resultado. **/
delimiter $$

create procedure order()
begin
select * from usuarios
order by edad asc;
end$$

delimiter ;

/**
Crea una función que devuelva el email del usuario con la edad más alta. **/
delimiter $$

create function ema() return VARCHAR(50) DETERMINISTIC
begin
declare n_mail VARCHAR(50);
select email from usuarios
where edad=(
    select max(edad) from usuarios
)
limit 1 into n_mail;
end $$

delimiter ;

/**

**/