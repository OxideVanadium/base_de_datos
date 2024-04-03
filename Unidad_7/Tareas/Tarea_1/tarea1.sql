/** 
Un instituto de enseñanza guarda los siguientes datos de sus alumnos:
número de inscripción, comienza desde 1 cada año,
año de inscripción,
nombre del alumno,
documento del alumno,
domicilio,
ciudad,
provincia,
clave primaria: número de inscripto y año de inscripción.
Se pide:
Elimine la tabla "alumno" si existe.
Nota:Muestra el comando y la salida. **/

CREATE DATABASE IF NOT EXISTS instituto;
use instituto;

/** 
Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).
Nota:Muestra el comando y la salida. **/
drop table if exists alumno;
create table alumno (
    inscripcion int auto_increment,
    año_insrp int,
    primary key(inscripcion,año_insrp),
    nombre varchar(50),
    documento varchar(10),
    domicilio varchar(150),
    ciudad varchar(50),
    provincia varchar(50)
);
describe alumno;
/**
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| inscripcion | int          | NO   | PRI | NULL    | auto_increment |
| año_insrp   | int          | NO   | PRI | NULL    |                |
| nombre      | varchar(50)  | YES  |     | NULL    |                |
| documento   | varchar(10)  | YES  |     | NULL    |                |
| domicilio   | varchar(150) | YES  |     | NULL    |                |
| ciudad      | varchar(50)  | YES  |     | NULL    |                |
| provincia   | varchar(50)  | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+

Define los siguientes indices:
Un índice único por el campo "documento" y un índice común por ciudad y provincia.
Nota:Muestra el comando y la salida. Justifica el tipo de indice en un comentario. **/

create unique index i_documento on alumno(documento);
create unique index i_ciud_prov on alumno(ciudad, provincia);
/**
+-------------+--------------+------+-----+---------+----------------+
| Field       | Type         | Null | Key | Default | Extra          |
+-------------+--------------+------+-----+---------+----------------+
| inscripcion | int          | NO   | PRI | NULL    | auto_increment |
| año_insrp   | int          | NO   | PRI | NULL    |                |
| nombre      | varchar(50)  | YES  |     | NULL    |                |
| documento   | varchar(10)  | YES  | UNI | NULL    |                |
| domicilio   | varchar(150) | YES  |     | NULL    |                |
| ciudad      | varchar(50)  | YES  | MUL | NULL    |                |
| provincia   | varchar(50)  | YES  |     | NULL    |                |
+-------------+--------------+------+-----+---------+----------------+

Vea los índices de la tabla.
Nota:Muestra el comando y la salida "show index". **/

show index from alumno;

/** 
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY     |            1 | inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY     |            2 | año_insrp   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | i_documento |            1 | documento   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

Intente ingresar un alumno con clave primaria repetida.
Nota:Muestra el comando y la salida. **/
insert into alumno(inscripcion, año_insrp, nombre, documento, domicilio, ciudad, provincia)
values(1, 2024, 'LL', '7587587', 'domicilio', 'ciudad', 'provincia'),
(1, 2024, 'LL', '7587587', 'domicilio', 'ciudad', 'provincia');

/**
ERROR 1062 (23000): Duplicate entry '1-2024' for key 'alumno.PRIMARY'

Intente ingresar un alumno con documento repetido.
Nota:Muestra el comando y la salida. **/

insert into alumno(año_insrp, nombre, documento, domicilio, ciudad, provincia)
values(2024, 'LL', '7587587', 'domicilio', 'ciudad', 'provincia'),
(2024, 'LL', '7587587', 'domicilio', 'ciudad2', 'provincia2');

/** 
ERROR 1062 (23000): Duplicate entry '7587587' for key 'alumno.i_documento'


Ingrese varios alumnos de la misma ciudad y provincia.
Nota:Muestra el comando y la salida. **/
insert into alumno(año_insrp, nombre, documento, domicilio, ciudad, provincia)
values(2024, 'NN', '5457541', 'domicilio', 'ciudad', 'provincia'),
(2024, 'RR', '47587689', 'domicilio', 'ciudad', 'provincia');

/**
ERROR 1062 (23000): Duplicate entry 'ciudad-provincia' for key 'alumno.i_ciud_prov'


Elimina los indices creados, y muestra que ya no se encuentran.
Nota:Muestra el comando y la salida.
**/
drop index i_documento on alumno;
drop index i_ciud_prov on alumno;
/**
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY  |            1 | inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY  |            2 | año_insrp   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
