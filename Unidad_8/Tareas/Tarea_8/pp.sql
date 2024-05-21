/**Trabajo con la BBDD Alumnos

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

Tabla alumnos:
id (entero sin signo)
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
nota (número real)
**/
create database alumnos_n;
use alumnos_n;

create table alumno(
    id int auto_increment primary key, 
    nombre varchar(100),
    apellido1 varchar(100),
    apellido2 varchar(100),
    nota decimal
);

/**
Crea los siguientes triggers:

Trigger1:trigger_check_nota_before_insert.
Se ejecuta sobre la tabla alumnos.
Se ejecuta antes de una operación de inserción.
Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10. **/
delimiter $$
create trigger trigger_check_nota_before_insert
before insert on alumno
for each row
begin
if new.nota < 0 then
    set new.nota = 0;
elseif new.nota > 10 then
    set new.nota = 10;
end if;
end; $$

delimiter ;

insert into alumno(nombre, apellido1, apellido2, nota)
values('jjj', 'ppp', 'nnn', -5.0); /**
mysql> select * from alumno;
+----+--------+-----------+-----------+------+
| id | nombre | apellido1 | apellido2 | nota |
+----+--------+-----------+-----------+------+
|  1 | jjj    | ppp       | nnn       |    0 |
+----+--------+-----------+-----------+------+
1 row in set (0,00 sec)
**/

insert into alumno(nombre, apellido1, apellido2, nota)
values('jjj', 'ppp', 'nnn', 15.0); /**
mysql> select * from alumno;
+----+--------+-----------+-----------+------+
| id | nombre | apellido1 | apellido2 | nota |
+----+--------+-----------+-----------+------+
|  1 | jjj    | ppp       | nnn       |    0 |
|  2 | jjj    | ppp       | nnn       |   10 |
+----+--------+-----------+-----------+------+
2 rows in set (0,00 sec)

Trigger2 : trigger_check_nota_before_update.
Se ejecuta sobre la tabla alumnos.
Se ejecuta antes de una operación de actualización.
Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.
Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10. **/ 

delimiter $$
create trigger trigger_check_nota_before_update
before update on alumno
for each row
begin
if new.nota < 0 then
    set new.nota = 0;
elseif new.nota > 10 then
    set new.nota = 10;
end if;
end; $$

delimiter ;

update alumno
set nota=150
where id=1; /**
mysql> select * from alumno;
+----+--------+-----------+-----------+------+
| id | nombre | apellido1 | apellido2 | nota |
+----+--------+-----------+-----------+------+
|  1 | jjj    | ppp       | nnn       |   10 |
|  2 | jjj    | ppp       | nnn       |   10 |
+----+--------+-----------+-----------+------+
2 rows in set (0,00 sec) **/

update alumno
set nota=-20
where id=2; 
/**
mysql> select * from alumno;
+----+--------+-----------+-----------+------+
| id | nombre | apellido1 | apellido2 | nota |
+----+--------+-----------+-----------+------+
|  1 | jjj    | ppp       | nnn       |   10 |
|  2 | jjj    | ppp       | nnn       |    0 |
+----+--------+-----------+-----------+------+
2 rows in set (0,01 sec)

Una vez creados los triggers escriba varias sentencias de inserción y actualización sobre la tabla alumnos y verifica que los triggers se están ejecutando correctamente.

Crea el siguiente procedimiento:

Procedimiento1:
Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre 3, y 10.
Crea un procedimiento que permita realizar la inserción de un número de alumnos, con una nota mímina y máxima. Estos valores pueden oscilar entre -10, y 12.

Realiza los procedimientos y verifica el comportamiento llamando a este con los parámetros adecuados. **/

delimiter $$

create procedure insert_student(in iter int, in f_case int, in n_name varchar(10), in n_surname_1 varchar(10), in n_surname_2 varchar(10))
begin
declare min_nota decimal;
declare max_nota decimal;
declare n_iter int default 0;

if f_case = 1 then
    set min_nota=3;
    set max_nota=10;
elseif f_case = 0 then
    set min_nota=-10;
    set max_nota=12;
end if;

while n_iter < iter do
    set n_iter = n_iter + 1;
    insert into alumno(nombre, apellido1, apellido2, nota)
    values(CONCAT(n_name, SUBSTRING(UUID(), floor((rand() * 32)))), CONCAT(n_surname_1, SUBSTRING(UUID(), floor((rand() * 32)))), CONCAT(n_surname_2, SUBSTRING(UUID(), floor((rand() * 32)))), round((rand() + (max_nota - min_nota + 1)) + min_nota, 2));
end while;
end $$

delimiter ;

call insert_student(10, 1, 'k', 'p', 'h');
call insert_student(10, 0, 'k', 'p', 'h');
/**
+----+---------------------------------------+-------------------------------------+------------------------------------+------+
| id | nombre                                | apellido1                           | apellido2                          | nota |
+----+---------------------------------------+-------------------------------------+------------------------------------+------+
|  1 | jjj                                   | ppp                                 | nnn                                |   10 |
|  2 | jjj                                   | ppp                                 | nnn                                |    0 |
|  3 | k                                     | p784-11ef-ad1b-080027d9a3b3         | hb-080027d9a3b3                    |   10 |
|  4 | k11ef-ad1b-080027d9a3b3               | p027d9a3b3                          | hd9a3b3                            |   10 |
|  5 | k0c1275a5-1784-11ef-ad1b-080027d9a3b3 | p1b-080027d9a3b3                    | h-1784-11ef-ad1b-080027d9a3b3      |   10 |
|  6 | k130748-1784-11ef-ad1b-080027d9a3b3   | p-1784-11ef-ad1b-080027d9a3b3       | h3078b-1784-11ef-ad1b-080027d9a3b3 |   10 |
|  7 | k13ba50-1784-11ef-ad1b-080027d9a3b3   | p-080027d9a3b3                      | hf-ad1b-080027d9a3b3               |   10 |
|  8 | k80027d9a3b3                          | pad1b-080027d9a3b3                  | h1b-080027d9a3b3                   |   10 |
|  9 | kc14dc09-1784-11ef-ad1b-080027d9a3b3  | p4-11ef-ad1b-080027d9a3b3           | h7d9a3b3                           |   10 |
| 10 | k-ad1b-080027d9a3b3                   | pef-ad1b-080027d9a3b3               | h27d9a3b3                          |   10 |
| 11 | k80027d9a3b3                          | p784-11ef-ad1b-080027d9a3b3         | h84-11ef-ad1b-080027d9a3b3         |   10 |
| 12 | k27d9a3b3                             | p1700cc-1784-11ef-ad1b-080027d9a3b3 | h80027d9a3b3                       |   10 |
+----+---------------------------------------+-------------------------------------+------------------------------------+------+

+----+---------------------------------------+-------------------------------------+------------------------------------+------+
| id | nombre                                | apellido1                           | apellido2                          | nota |
+----+---------------------------------------+-------------------------------------+------------------------------------+------+
|  1 | jjj                                   | ppp                                 | nnn                                |   10 |
|  2 | jjj                                   | ppp                                 | nnn                                |    0 |
|  3 | k                                     | p784-11ef-ad1b-080027d9a3b3         | hb-080027d9a3b3                    |   10 |
|  4 | k11ef-ad1b-080027d9a3b3               | p027d9a3b3                          | hd9a3b3                            |   10 |
|  5 | k0c1275a5-1784-11ef-ad1b-080027d9a3b3 | p1b-080027d9a3b3                    | h-1784-11ef-ad1b-080027d9a3b3      |   10 |
|  6 | k130748-1784-11ef-ad1b-080027d9a3b3   | p-1784-11ef-ad1b-080027d9a3b3       | h3078b-1784-11ef-ad1b-080027d9a3b3 |   10 |
|  7 | k13ba50-1784-11ef-ad1b-080027d9a3b3   | p-080027d9a3b3                      | hf-ad1b-080027d9a3b3               |   10 |
|  8 | k80027d9a3b3                          | pad1b-080027d9a3b3                  | h1b-080027d9a3b3                   |   10 |
|  9 | kc14dc09-1784-11ef-ad1b-080027d9a3b3  | p4-11ef-ad1b-080027d9a3b3           | h7d9a3b3                           |   10 |
| 10 | k-ad1b-080027d9a3b3                   | pef-ad1b-080027d9a3b3               | h27d9a3b3                          |   10 |
| 11 | k80027d9a3b3                          | p784-11ef-ad1b-080027d9a3b3         | h84-11ef-ad1b-080027d9a3b3         |   10 |
| 12 | k27d9a3b3                             | p1700cc-1784-11ef-ad1b-080027d9a3b3 | h80027d9a3b3                       |   10 |
| 13 | k4-11ef-ad1b-080027d9a3b3             | pb-080027d9a3b3                     | h84-11ef-ad1b-080027d9a3b3         |   10 |
| 14 | k80027d9a3b3                          | pd1b-080027d9a3b3                   | h027d9a3b3                         |   10 |
| 15 | kef-ad1b-080027d9a3b3                 | p11ef-ad1b-080027d9a3b3             | h1b-080027d9a3b3                   |   10 |
| 16 | k272d3fba-1784-11ef-ad1b-080027d9a3b3 | p3fe5-1784-11ef-ad1b-080027d9a3b3   | hb-080027d9a3b3                    |   10 |
| 17 | k1ef-ad1b-080027d9a3b3                | p5a5-1784-11ef-ad1b-080027d9a3b3    | h-11ef-ad1b-080027d9a3b3           |   10 |
| 18 | k0027d9a3b3                           | p-1784-11ef-ad1b-080027d9a3b3       | h7d9a3b3                           |   10 |
| 19 | kd1b-080027d9a3b3                     | p1b-080027d9a3b3                    | h84-11ef-ad1b-080027d9a3b3         |   10 |
| 20 | k84-11ef-ad1b-080027d9a3b3            | pfc9a5-1784-11ef-ad1b-080027d9a3b3  | hf-ad1b-080027d9a3b3               |   10 |
| 21 | k784-11ef-ad1b-080027d9a3b3           | pef-ad1b-080027d9a3b3               | had1b-080027d9a3b3                 |   10 |
| 22 | k027d9a3b3                            | p80027d9a3b3                        | h784-11ef-ad1b-080027d9a3b3        |   10 |
+----+---------------------------------------+-------------------------------------+------------------------------------+------+
