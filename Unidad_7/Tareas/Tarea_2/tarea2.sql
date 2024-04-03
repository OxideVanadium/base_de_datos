/**
Una empresa guarda los siguientes datos de sus clientes, con los siguientes campos:
documento char (8) not null,
nombre varchar(30) not null,
domicilio varchar(30),
ciudad varchar(20),
provincia varchar (20),
telefono varchar(11)
Se pide: 
Elimine la tabla "cliente" si existe.
Nota:Muestra el comando y la salida.
**/

create database if not exists cliente;
use cliente;
drop table if exists cliente;
/**
Query OK, 0 rows affected, 1 warning (0,01 sec)


Cree la tabla si clave primaria y incluye a posteriori esta.
Nota:Muestra el comando y la salida. **/

create table cliente(
    documento char(8) not null,
    nombre varchar(30) not null,
    domicilio varchar(30),
    ciudad varchar(20),
    provincia varchar(20),
    telefono varchar(11)
);

alter table cliente add primary key(documento, nombre);

/**
Query OK, 0 rows affected (0,06 sec)
Records: 0  Duplicates: 0  Warnings: 0

Define los siguientes indices:
Un índice único por el campo "documento" y un índice común por ciudad y provincia.
Nota:Muestra el comando y la salida. Justifica el tipo de indice en un comentario. **/

create unique index i_doc on cliente(documento);
create index i_ciud_prov on cliente(ciudad, provincia);
describe cliente;

/**
Query OK, 0 rows affected (0,03 sec)
Records: 0  Duplicates: 0  Warnings: 0

+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| documento | char(8)     | NO   | PRI | NULL    |       |
| nombre    | varchar(30) | NO   | PRI | NULL    |       |
| domicilio | varchar(30) | YES  |     | NULL    |       |
| ciudad    | varchar(20) | YES  | MUL | NULL    |       |
| provincia | varchar(20) | YES  |     | NULL    |       |
| telefono  | varchar(11) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

Vea los índices de la tabla.
Nota:Muestra el comando y la salida "show index". **/

show index from cliente;

/**
+---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name    | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY     |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          0 | PRIMARY     |            2 | nombre      | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          0 | i_doc       |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | i_ciud_prov |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | i_ciud_prov |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+-------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

Agregue un índice único por el campo "telefono".
Nota:Muestra el comando y la salida. **/

create unique index i_tel on cliente(telefono);

/**
Query OK, 0 rows affected (0,02 sec)
Records: 0  Duplicates: 0  Warnings: 0


Elimina los índices.
Nota:Muestra el comando y la salida. **/

drop index i_doc on cliente;
drop index i_tel on cliente;
drop index i_ciud_prov on cliente;

/**
Query OK, 0 rows affected (0,02 sec)
Records: 0  Duplicates: 0  Warnings: 0
Query OK, 0 rows affected (0,02 sec)
Records: 0  Duplicates: 0  Warnings: 0
Query OK, 0 rows affected (0,02 sec)
Records: 0  Duplicates: 0  Warnings: 0

