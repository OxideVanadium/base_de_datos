/**
Crea una base de datos que tendrá por nombre Base_Indices.
En la BD crea una tabla de nombre MOVIMIENTO con la siguiente estructura:
Nombre del campo 	Tipo de dato 	Propiedades
Identificador 	int 	AUTO_INCREMENT, Clave primaria (PK_MOVIMIENTO)
Articulo 	varchar(50) 	Obligatorio
Fecha 	date 	Obligatorio
Cantidad 	int 	Obligatorio
Aplica la sentencia adecuada para visualizar los índices que hay en la tabla.
Nota: Muestra el resultado y razona la respueta.
**/
create database Base_Indices;
use Base_Indices;
create table MOVIMIENTO(
    Identificador int AUTO_INCREMENT primary key,
    Articulo varchar(50) not null,
    Fecha date not null,
    Cantidad int not null
);

/** Ejecuta la siguiente sentencia sql para generar datos de prueba:
**/
    CREATE TABLE NumerosUnicos (
    Numero INT AUTO_INCREMENT PRIMARY KEY
    );

    INSERT INTO NumerosUnicos (Numero)
    SELECT NULL FROM INFORMATION_SCHEMA.COLUMNS LIMIT 5000;

    INSERT INTO MOVIMIENTO (Identificador, Articulo, Fecha, Cantidad)
    SELECT 
        n.Numero,
        CONCAT('Producto', n.Numero),
        DATE_ADD('2012-01-01', INTERVAL FLOOR(RAND() * 120) DAY),
        FLOOR(RAND() * 1000000) + 1
    FROM 
        NumerosUnicos n;

        DROP TABLE NumerosUnicos;

/** Nota: Muestra el resultado y razona la respueta. Ejecuta un count sobre la tabla.**/

select count(*) from MOVIMIENTO; 
/**
+----------+
| count(*) |
+----------+
|     3740 |
+----------+

Crea con la sentencia CREATE TABLE…SELECT… un duplicado de la tabla MOVIMIENTO a la que llamaremos MOVIMIENTO_BIS.
**/
create table MOVIMIENTO_BIS select * from MOVIMIENTO;
/**
Query OK, 3740 rows affected (0,12 sec)
Records: 3740  Duplicates: 0  Warnings: 0

Nota: Muestra el resultado y razona la respueta.
Con la cláusula DESCRIBE observa cuál es la situación de la tabla clonada, ¿Qué le pasa al índice y a la propiedad AUTO_INCREMENT?
Nota: Compara el resultado con la tabla MOVIMIENTO.

--- La clave primaria se ha copiado como un campo sin indice y sin autoincremento

+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| Identificador | int         | NO   | PRI | NULL    | auto_increment |
| Articulo      | varchar(50) | NO   |     | NULL    |                |
| Fecha         | date        | NO   |     | NULL    |                |
| Cantidad      | int         | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+


+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Identificador | int         | NO   |     | 0       |       |
| Articulo      | varchar(50) | NO   |     | NULL    |       |
| Fecha         | date        | NO   |     | NULL    |       |
| Cantidad      | int         | NO   |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+

Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. 
Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto.
Supongamos que las consultas de rango que se van a hacer en nuestra tabla son frecuentes y además no por el identificador, sino por la fecha. 
Este es motivo suficiente para que sea la fecha un índice de tabla y así mejorar el tiempo de respuesta de nuestras consultas. 
En la tabla MOVIMIENTO_BIS creamos un índice para la fecha (IX_FECHA_BIS) y otro índice para el identificador (IX_IDENTIFICADOR).
Analiza el plan de ejecución de las siguientes consultas y observa la diferencia: 


Consulta1
**/
explain select * from MOVIMIENTO_BIS where identificador=3;
explain select * from MOVIMIENTO where identificador=3;
/**

+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3740 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)

+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
1 row in set, 1 warning (0,00 sec)


Consulta 2
**/
explain select identificador from MOVIMIENTO_BIS where identificador=3;
explain select identificador from MOVIMIENTO where identificador=3;
/**

+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3740 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)

+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra       |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | Using index |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)

Fíjata en que en la consulta 1 pedimos todos los campos. ¿A través de que indice se busca? ¿Por qué crees que lo hace así? En la consulta 2 solo pedimos el identificador. 
¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

--- En la tabla sin clave primaria, se recorren todas las filas. En cambio, en la tabla con clave primaria, se accede directamente a la fila con el identificador 
correspondiente al que indicamos en el filtro indepdientemente del numero de las columnas que hay que mostrar


Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:
Consulta 1:
**/
explain SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN '2012-01-01' and '2012-01-03';
explain SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '2012-01-01' and '2012-01-03';
/**
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3740 |    11.11 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)

+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3740 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+

Consulta 2 **/

explain SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN '2012-01-01' and '2012-01-03';
explain SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '2012-01-01' and '2012-01-03';

/**
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3740 |    11.11 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)

+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3740 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
1 row in set, 1 warning (0,00 sec)


Fijate que en la consulta 2 pedimos todos los campos. ¿A través de que índice busca? ¿Por qué crees que lo hace así? En la consulta 1 solo pedimos la fecha. 
¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

--- En ambas tablas se recorren todas las filas ya que falta el indice del campo 'fecha' sin dependencia del numero de las columnas que se soliciten

Vamos a crear un índice por fecha (IX_FECHA) en la tabla MOVIMIENTO, puesto que no lo tenía, en este caso la tabla ya tenía un indice, la clave primaria.
Visualiza los indices de las tablas MOVIMIENTO y MOVIMIENTO_BIS.
Analiza el plan de ejecución de las siguientes consultas y observa la diferencia: 

--- En la tabla con un indice en el campo 'fecha' se reccoren 100 filas en lugar de recorrer todas las filas como en la tabla sin indice, el numero de las columnas solicitadas
no affecta al numero de filas recorridas

Consulta 1: **/

create index IX_FECHA on MOVIMIENTO(fecha);
show index from MOVIMIENTO;
show index from MOVIMIENTO_BIS;

/**
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name | Seq_in_index | Column_name   | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| MOVIMIENTO |          0 | PRIMARY  |            1 | Identificador | A         |        3740 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| MOVIMIENTO |          1 | IX_FECHA |            1 | Fecha         | A         |         120 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+------------+------------+----------+--------------+---------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

mysql> show index from MOVIMIENTO_BIS;
Empty set (0,01 sec) **/

explain SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN '2012-01-01' and '2012-01-03';
explain SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '2012-01-01' and '2012-01-03';

/**
+----+-------------+------------+------------+-------+---------------+----------+---------+------+------+----------+--------------------------+
| id | select_type | table      | partitions | type  | possible_keys | key      | key_len | ref  | rows | filtered | Extra                    |
+----+-------------+------------+------------+-------+---------------+----------+---------+------+------+----------+--------------------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | range | IX_FECHA      | IX_FECHA | 3       | NULL |  100 |   100.00 | Using where; Using index |
+----+-------------+------------+------------+-------+---------------+----------+---------+------+------+----------+--------------------------+

+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3740 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+

Consulta 3: **/

explain SELECT fecha FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '2012-01-01' and '2012-01-03';
explain SELECT fecha FROM MOVIMIENTO WHERE fecha BETWEEN '2012-01-01' and '2012-01-03';

/** 
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3740 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+

+----+-------------+------------+------------+-------+---------------+----------+---------+------+------+----------+--------------------------+
| id | select_type | table      | partitions | type  | possible_keys | key      | key_len | ref  | rows | filtered | Extra                    |
+----+-------------+------------+------------+-------+---------------+----------+---------+------+------+----------+--------------------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | range | IX_FECHA      | IX_FECHA | 3       | NULL |  100 |   100.00 | Using where; Using index |
+----+-------------+------------+------------+-------+---------------+----------+---------+------+------+----------+--------------------------+

Consulta 4: **/

explain SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN '2012-01-01' and '2012-01-03';
explain SELECT * FROM MOVIMIENTO WHERE fecha BETWEEN '2012-01-01' and '2012-01-03';

/**
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3740 |    11.11 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+

+----+-------------+------------+------------+-------+---------------+----------+---------+------+------+----------+-----------------------+
| id | select_type | table      | partitions | type  | possible_keys | key      | key_len | ref  | rows | filtered | Extra                 |
+----+-------------+------------+------------+-------+---------------+----------+---------+------+------+----------+-----------------------+
|  1 | SIMPLE      | MOVIMIENTO | NULL       | range | IX_FECHA      | IX_FECHA | 3       | NULL |  100 |   100.00 | Using index condition |
+----+-------------+------------+------------+-------+---------------+----------+---------+------+------+----------+-----------------------+