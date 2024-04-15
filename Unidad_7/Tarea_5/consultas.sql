/**
Se pide:
Carga de datos

Realiza la carga de la BBDD de Jardineria y describe los pasos que has realizado. **/
source jardineria.sql


/**
Índices

Consulte cuáles son los índices que hay en la tabla producto utilizando las instrucciones SQL que nos permiten obtener esta información de la tabla. **/
show index from producto;
/**
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name     | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| producto |          0 | PRIMARY  |            1 | codigo_producto | A         |         276 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| producto |          1 | gama     |            1 | gama            | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
Haga uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas y diga cuál de las dos consultas realizará menos comparaciones para encontrar el producto que estamos buscando. ¿Cuántas comparaciones se realizan en cada caso? ¿Por qué?. **/

explain SELECT *
FROM producto
WHERE codigo_producto = 'OR-114';

explain SELECT *
FROM producto
WHERE nombre = 'Evonimus Pulchellus';

/**
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table    | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | producto | NULL       | const | PRIMARY       | PRIMARY | 62      | const |    1 |   100.00 | NULL  |
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+

+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table    | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | producto | NULL       | ALL  | NULL          | NULL | NULL    | NULL |  276 |    10.00 | Using where |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+

--- La segunda consulta recorre todas las filas debido a que la búsqueda se realiza por texto, mientras que la primera accede directamente a través del índice, por lo que solo recorre una fila

Razona la respuesta, y analiza las diferencias.

Suponga que estamos trabajando con la base de datos jardineria y queremos saber optimizar las siguientes consultas. ¿Cuál de las dos sería más eficiente?. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas. **/

explain SELECT AVG(total)
FROM pago
WHERE YEAR(fecha_pago) = 2008;

explain SELECT AVG(total)
FROM pago
WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';

/**
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | pago  | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   26 |   100.00 | Using where |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+

+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | pago  | NULL       | ALL  | NULL          | NULL | NULL    | NULL |   26 |    11.11 | Using where |
+----+-------------+-------+------------+------+---------------+------+---------+------+------+----------+-------------+

--- En las ambas consultas se reccoren todas las filas que coinciden con el filtro, si añadimos el índice a columna 'fecha_pago' en la segunda consulta se recorren solo 5 filas, mientras que en la primera consulta se recorren todas las filas

Lectura recomendada sobre la función YEAR y el uso de índices

Optimiza la siguiente consulta creando índices cuando sea necesario. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas. **/

explain SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE 'A%';

CREATE INDEX id_nom_cli ON cliente (nombre_cliente);

/** 
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
| id | select_type | table   | partitions | type | possible_keys  | key            | key_len | ref                               | rows | filtered | Extra       |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+
|  1 | SIMPLE      | cliente | NULL       | ALL  | PRIMARY        | NULL           | NULL    | NULL                              |   36 |    11.11 | Using where |
|  1 | SIMPLE      | pedido  | NULL       | ref  | codigo_cliente | codigo_cliente | 4       | jardineria.cliente.codigo_cliente |    6 |   100.00 | NULL        |
+----+-------------+---------+------------+------+----------------+----------------+---------+-----------------------------------+------+----------+-------------+

+----+-------------+---------+------------+-------+--------------------+----------------+---------+-----------------------------------+------+----------+-----------------------+
| id | select_type | table   | partitions | type  | possible_keys      | key            | key_len | ref                               | rows | filtered | Extra                 |
+----+-------------+---------+------------+-------+--------------------+----------------+---------+-----------------------------------+------+----------+-----------------------+
|  1 | SIMPLE      | cliente | NULL       | range | PRIMARY,id_nom_cli | id_nom_cli     | 202     | NULL                              |    3 |   100.00 | Using index condition |
|  1 | SIMPLE      | pedido  | NULL       | ref   | codigo_cliente     | codigo_cliente | 4       | jardineria.cliente.codigo_cliente |    6 |   100.00 | NULL                  |
+----+-------------+---------+------------+-------+--------------------+----------------+---------+-----------------------------------+------+----------+-----------------------+

--- Al añadir índice a columna 'nombre_cliente' se reccoren solo 3 filas en lugar de reccorer todos los registros de ambas tablas

¿Por qué no es posible optimizar el tiempo de ejecución de las siguientes consultas, incluso haciendo uso de índices? **/


SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE '%A%';

SELECT *
FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE '%A';

/**

--- Debido al uso del operador LIKE con el comodín '%', de todas maneras se recorren todas las filas de la tabla, ya que esta función necesita examinar todas las filas para encontrar coincidencias que cumplan con el patrón especificado

Crea un índice de tipo FULLTEXT sobre las columnas nombre y descripcion de la tabla producto. **/

create fulltext index id_nom_desc on producto(nombre, descripcion);
show index from producto;

/**
+----------+------------+-------------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name    | Seq_in_index | Column_name     | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+-------------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| producto |          0 | PRIMARY     |            1 | codigo_producto | A         |         276 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| producto |          1 | gama        |            1 | gama            | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| producto |          1 | id_nom_desc |            1 | nombre          | NULL      |         276 |     NULL |   NULL |      | FULLTEXT   |         |               | YES     | NULL       |
| producto |          1 | id_nom_desc |            2 | descripcion     | NULL      |         276 |     NULL |   NULL | YES  | FULLTEXT   |         |               | YES     | NULL       |
+----------+------------+-------------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+

Una vez creado el índice del ejercicio anterior realiza las siguientes consultas haciendo uso de la función MATCH, para buscar todos los productos que:
Contienen la palabra planta en el nombre o en la descripción. - Realice una consulta para cada uno de los modos de búsqueda full-text que existen en MySQL (IN NATURAL LANGUAGE MODE, IN BOOLEAN MODE y WITH QUERY EXPANSION) y compare los resultados que ha obtenido en cada caso. **/
select * from producto 
where match(nombre, descripcion) against ('planta' IN NATURAL LANGUAGE MODE);

select * from producto 
where match(nombre, descripcion) against (+'planta' IN BOOLEAN MODE);

select * from producto 
where match(nombre, descripcion) against ('planta' WITH QUERY EXPANSION) limit 10;
/**

+-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| codigo_producto | nombre                            | gama        | dimensiones | proveedor             | descripcion


                                                                                                                                                                                                                    | cantidad_en_stock | precio_venta | precio_proveedor |
+-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| AR-004          | Melissa                           | Arom├бticas | 15-20       | Murcia Seasons        | Es una planta perenne (dura varios a├▒os) conocida por el agradable y caracter├нstico olor a lim├│n que desprenden en verano. Nunca debe faltar en la huerta o jard├нn por su agradable aroma y por los variados usos que tiene: planta olorosa, condimentaria y medicinal. Su cultivo es muy f├бcil. Le va bien un suelo ligero, con buen drenaje y riego sin exceso. A pleno sol o por lo menos 5 horas de sol por d├нa. Cada a├▒o, su abonado mineral correspondiente.En oto├▒o, la melisa pierde el agradable olor a lim├│n que desprende en verano sus flores azules y blancas. En este momento se debe cortar a unos 20 cm. del suelo. Brotar├б de forma densa en primavera.
                                                                                                                                                                                                                    |               140 |         1.00 |             0.00 |
| AR-001          | Ajedrea                           | Arom├бticas | 15-20       | Murcia Seasons        | Planta arom├бtica que fresca se utiliza para condimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes


                                                                                                                                                                                                                    |               140 |         1.00 |             0.00 |
| AR-008          | Thymus Citriodra (Tomillo lim├│n) | Arom├бticas | 15-20       | Murcia Seasons        | Nombre com├║n o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas).Origen: Regi├│n mediterr├бnea.Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy peque├▒as, de unos 6 mm de longitud; seg├║n la variedad pueden ser verdes, verdes gris├бceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la ├йpoca estival y se presentan en racimos terminales que habitualmente son de color violeta o p├║rpura aunque tambi├йn pueden ser blancas. Esta planta despide un intenso y t├нpico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando est├б en flor. El tomillo atrae a avispas y abejas. En jardiner├нa se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y a├▒ad├бlos a un popurri, introd├║zcalos en saquitos de hierbas o en la almohada.Tambi├йn puede usar las ramas secas con flores para a├▒adir aroma y textura a cestos abiertos. |               140 |         1.00 |             0.00 |
| AR-009          | Thymus Vulgaris                   | Arom├бticas | 15-20       | Murcia Seasons        | Nombre com├║n o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas). Origen: Regi├│n mediterr├бnea. Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy peque├▒as, de unos 6 mm de longitud; seg├║n la variedad pueden ser verdes, verdes gris├бceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la ├йpoca estival y se presentan en racimos terminales que habitualmente son de color violeta o p├║rpura aunque tambi├йn pueden ser blancas. Esta planta despide un intenso y t├нpico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando est├б en flor. El tomillo atrae a avispas y abejas.
 En jardiner├нa se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y a├▒ad├бlos a un popurri, introd├║zcalos en saquitos de hierbas o en la almohada. Tambi├йn puede usar las ramas secas con flores para a├▒adir aroma y textura a cestos abiertos. |               140 |         1.00 |             0.00 |
| FR-100          | Nectarina                         | Frutales    | 8/10        | Frutales Talavera S.A | Se trata de un ├бrbol derivado por mutaci├│n de los melocotoneros comunes, y los ├║nicos caracteres diferenciales son la ausencia de tomentosidad en la piel del fruto. La planta, si se deja crecer libremente, adopta un porte globoso con unas dimensiones medias de 4-6 metros

                                                                                                                                                                                                                    |                50 |        11.00 |             8.00 |
+-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+

+-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| codigo_producto | nombre                            | gama        | dimensiones | proveedor             | descripcion


                                                                                                                                                                                                                    | cantidad_en_stock | precio_venta | precio_proveedor |
+-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| AR-004          | Melissa                           | Arom├бticas | 15-20       | Murcia Seasons        | Es una planta perenne (dura varios a├▒os) conocida por el agradable y caracter├нstico olor a lim├│n que desprenden en verano. Nunca debe faltar en la huerta o jard├нn por su agradable aroma y por los variados usos que tiene: planta olorosa, condimentaria y medicinal. Su cultivo es muy f├бcil. Le va bien un suelo ligero, con buen drenaje y riego sin exceso. A pleno sol o por lo menos 5 horas de sol por d├нa. Cada a├▒o, su abonado mineral correspondiente.En oto├▒o, la melisa pierde el agradable olor a lim├│n que desprende en verano sus flores azules y blancas. En este momento se debe cortar a unos 20 cm. del suelo. Brotar├б de forma densa en primavera.
                                                                                                                                                                                                                    |               140 |         1.00 |             0.00 |
| AR-001          | Ajedrea                           | Arom├бticas | 15-20       | Murcia Seasons        | Planta arom├бtica que fresca se utiliza para condimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes


                                                                                                                                                                                                                    |               140 |         1.00 |             0.00 |
| AR-008          | Thymus Citriodra (Tomillo lim├│n) | Arom├бticas | 15-20       | Murcia Seasons        | Nombre com├║n o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas).Origen: Regi├│n mediterr├бnea.Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy peque├▒as, de unos 6 mm de longitud; seg├║n la variedad pueden ser verdes, verdes gris├бceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la ├йpoca estival y se presentan en racimos terminales que habitualmente son de color violeta o p├║rpura aunque tambi├йn pueden ser blancas. Esta planta despide un intenso y t├нpico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando est├б en flor. El tomillo atrae a avispas y abejas. En jardiner├нa se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y a├▒ad├бlos a un popurri, introd├║zcalos en saquitos de hierbas o en la almohada.Tambi├йn puede usar las ramas secas con flores para a├▒adir aroma y textura a cestos abiertos. |               140 |         1.00 |             0.00 |
| AR-009          | Thymus Vulgaris                   | Arom├бticas | 15-20       | Murcia Seasons        | Nombre com├║n o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas). Origen: Regi├│n mediterr├бnea. Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy peque├▒as, de unos 6 mm de longitud; seg├║n la variedad pueden ser verdes, verdes gris├бceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la ├йpoca estival y se presentan en racimos terminales que habitualmente son de color violeta o p├║rpura aunque tambi├йn pueden ser blancas. Esta planta despide un intenso y t├нpico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando est├б en flor. El tomillo atrae a avispas y abejas.
 En jardiner├нa se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y a├▒ad├бlos a un popurri, introd├║zcalos en saquitos de hierbas o en la almohada. Tambi├йn puede usar las ramas secas con flores para a├▒adir aroma y textura a cestos abiertos. |               140 |         1.00 |             0.00 |
| FR-100          | Nectarina                         | Frutales    | 8/10        | Frutales Talavera S.A | Se trata de un ├бrbol derivado por mutaci├│n de los melocotoneros comunes, y los ├║nicos caracteres diferenciales son la ausencia de tomentosidad en la piel del fruto. La planta, si se deja crecer libremente, adopta un porte globoso con unas dimensiones medias de 4-6 metros

                                                                                                                                                                                                                    |                50 |        11.00 |             8.00 |
+-----------------+-----------------------------------+-------------+-------------+-----------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+

+-----------------+-----------------------------------+--------------+-------------+-------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| codigo_producto | nombre                            | gama         | dimensiones | proveedor               | descripcion


                                                                                                                                                                                                                       | cantidad_en_stock | precio_venta | precio_proveedor |
+-----------------+-----------------------------------+--------------+-------------+-------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| AR-008          | Thymus Citriodra (Tomillo lim├│n) | Arom├бticas  | 15-20       | Murcia Seasons          | Nombre com├║n o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas).Origen: Regi├│n mediterr├бnea.Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy peque├▒as, de unos 6 mm de longitud; seg├║n la variedad pueden ser verdes, verdes gris├бceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la ├йpoca estival y se presentan en racimos terminales que habitualmente son de color violeta o p├║rpura aunque tambi├йn pueden ser blancas. Esta planta despide un intenso y t├нpico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando est├б en flor. El tomillo atrae a avispas y abejas. En jardiner├нa se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y a├▒ad├бlos a un popurri, introd├║zcalos en saquitos de hierbas o en la almohada.Tambi├йn puede usar las ramas secas con flores para a├▒adir aroma y textura a cestos abiertos. |               140 |         1.00 |             0.00 |
| AR-009          | Thymus Vulgaris                   | Arom├бticas  | 15-20       | Murcia Seasons          | Nombre com├║n o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas). Origen: Regi├│n mediterr├бnea. Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy peque├▒as, de unos 6 mm de longitud; seg├║n la variedad pueden ser verdes, verdes gris├бceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la ├йpoca estival y se presentan en racimos terminales que habitualmente son de color violeta o p├║rpura aunque tambi├йn pueden ser blancas. Esta planta despide un intenso y t├нpico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando est├б en flor. El tomillo atrae a avispas y abejas.
 En jardiner├нa se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y a├▒ad├бlos a un popurri, introd├║zcalos en saquitos de hierbas o en la almohada. Tambi├йn puede usar las ramas secas con flores para a├▒adir aroma y textura a cestos abiertos. |               140 |         1.00 |             0.00 |
| AR-004          | Melissa                           | Arom├бticas  | 15-20       | Murcia Seasons          | Es una planta perenne (dura varios a├▒os) conocida por el agradable y caracter├нstico olor a lim├│n que desprenden en verano. Nunca debe faltar en la huerta o jard├нn por su agradable aroma y por 
los variados usos que tiene: planta olorosa, condimentaria y medicinal. Su cultivo es muy f├бcil. Le va bien un suelo ligero, con buen drenaje y riego sin exceso. A pleno sol o por lo menos 5 horas de sol por d├нa. Cada a├▒o, su abonado mineral correspondiente.En oto├▒o, la melisa pierde el agradable olor 
a lim├│n que desprende en verano sus flores azules y blancas. En este momento se debe cortar a unos 20 cm. del suelo. Brotar├б de forma densa en primavera.
                                                                                                                                                                                                                       |               140 |         1.00 |             0.00 |
| FR-100          | Nectarina                         | Frutales     | 8/10        | Frutales Talavera S.A   | Se trata de un ├бrbol derivado por mutaci├│n de los melocotoneros comunes, y los ├║nicos caracteres diferenciales son la ausencia de tomentosidad en la piel del fruto. La planta, si se deja crecer libremente, adopta un porte globoso con unas dimensiones medias de 4-6 metros

                                                                                                                                                                                                                       |                50 |        11.00 |             8.00 |
| AR-001          | Ajedrea                           | Arom├бticas  | 15-20       | Murcia Seasons          | Planta arom├бtica que fresca se utiliza para condimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes


                                                                                                                                                                                                                       |               140 |         1.00 |             0.00 |
| AR-005          | Mentha Sativa                     | Arom├бticas  | 15-20       | Murcia Seasons          | ┬┐Qui├йn no conoce la Hierbabuena? Se trata de una plantita muy arom├бtica, agradable y cultivada extensamente por toda Espa├▒a. Es hierba perenne (por tanto vive varios a├▒os, no es anual). Puedes cultivarla en maceta o plantarla en la tierra del jard├нn o en un rinc├│n del huerto. Lo m├бs importante es que cuente con bastante agua. En primavera debes aportar fertilizantes minerales. Vive mejor en semisombra que a pleno sol.Si ves orugas o los agujeros en hojas consecuencia de su ataque, ret├нralas una a una a mano; no uses insecticidas qu├нmicos.
                                                                                                                                                                                                                       |               140 |         1.00 |             0.00 |
| FR-13           | Kunquat  EXTRA con FRUTA          | Frutales     | 150-170     | NaranjasValencianas.com | su nombre cient├нfico se origina en honor a un hoticultor escoc├йs que recolect├│ espec├нmenes en China, ("Fortunella"), Robert Fortune (1812-1880), y "margarita", del lat├нn margaritus-a-um = perla, en alusi├│n a sus peque├▒os y brillantes frutos. Se trata de un arbusto o ├бrbol peque├▒o de 2-3 m de altura, inerme o con escasas espinas.Hojas lanceoladas de 4-8 (-15) cm de longitud, con el ├бpice redondeado y la base cuneada.Tienen el margen crenulado en su mitad superior, el haz verde brillante y 
el env├йs m├бs p├бlido.Pec├нolo ligeramente marginado.Flores perfumadas solitarias o agrupadas en inflorescencias axilares, blancas.El fruto es lo m├бs caracter├нstico, es el m├бs peque├▒o de todos los c├нtricos y el ├║nico cuya c├бscara se puede comer.Frutos peque├▒os, con semillas, de corteza fina, dulce, arom├бtica y comestible, y de pulpa naranja amarillenta y ligeramente ├бcida.Sus frutos son muy peque├▒os y tienen un car├бcter principalmente ornamental.                                                           |                15 |        57.00 |            45.00 |
| FR-12           | Kunquat                           | Frutales     |             | NaranjasValencianas.com | su nombre cient├нfico se origina en honor a un hoticultor escoc├йs que recolect├│ espec├нmenes en China, ("Fortunella"), Robert Fortune (1812-1880), y "margarita", del lat├нn margaritus-a-um = perla, en alusi├│n a sus peque├▒os y brillantes frutos. Se trata de un arbusto o ├бrbol peque├▒o de 2-3 m de altura, inerme o con escasas espinas.Hojas lanceoladas de 4-8 (-15) cm de longitud, con el ├бpice redondeado y la base cuneada.Tienen el margen crenulado en su mitad superior, el haz verde brillante y 
el env├йs m├бs p├бlido.Pec├нolo ligeramente marginado.Flores perfumadas solitarias o agrupadas en inflorescencias axilares, blancas.El fruto es lo m├бs caracter├нstico, es el m├бs peque├▒o de todos los c├нtricos y el ├║nico cuya c├бscara se puede comer.Frutos peque├▒os, con semillas, de corteza fina, dulce, arom├бtica y comestible, y de pulpa naranja amarillenta y ligeramente ├бcida.Sus frutos son muy peque├▒os y tienen un car├бcter principalmente ornamental.                                                           |                15 |        21.00 |            16.00 |
| AR-002          | Lav├бndula Dentata                | Arom├бticas  | 15-20       | Murcia Seasons          | Espliego de jard├нn, Alhucema rizada, Alhucema dentada, Cantueso rizado. Familia: Lamiaceae.Origen: Espa├▒a y Portugal. Mata de unos 60 cm de alto. Las hojas son arom├бticas, dentadas y de color verde gris├бceas.  Produce compactas espigas de flores peque├▒as, ligeramente arom├бticas, tubulares,de color azulado y con br├бcteas p├║rpuras.  Frutos: nuececillas alargadas encerradas en el tubo del c├бliz.  Se utiliza en jardineria y no en perfumeria como otros cantuesos, espliegos y lavandas.  Tiene propiedades aromatizantes y calmantes. Adecuadas para la formaci├│n de setos bajos. Se dice que su aroma ahuyenta pulgones y otros insectos perjudiciales para las plantas vecinas.
                                                                                                                                                                                                                       |               140 |         1.00 |             0.00 |
| 11679           | Sierra de Poda 400MM              | Herramientas | 0,258       | HiperGarden Tools       | Gracias a la poda se consigue manipular un poco la naturaleza, d├бndole la forma que m├бs nos guste. Este trabajo b├бsico de jardiner├нa tambi├йn facilita que las plantas crezcan de un modo m├бs equilibrado, y que las flores y los frutos vuelvan cada a├▒o con regularidad. Lo mejor es dar forma cuando los ejemplares son j├│venes, de modo que exijan pocos cuidados cuando sean adultos. Adem├бs de saber cu├бndo y c├│mo hay que podar, tener unas herramientas adecuadas para esta labor es tambi├йn de vital importancia.
                                                                                                                                                                                                                       |                15 |        14.00 |            11.00 |
+-----------------+-----------------------------------+--------------+-------------+-------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
 
--- 

Contienen la palabra planta seguida de cualquier carácter o conjunto de caracteres, en el nombre o en la descripción. **/
select * from producto
where match(nombre, descripcion) against('planta');
/**
Empiezan con la palabra planta en el nombre o en la descripción. **/

/**
Contienen la palabra tronco o la palabra árbol en el nombre o en la descripción. **/
select * from producto 
where match(nombre, descripcion) against('arbol tronco') limit 5;
/**

+-----------------+----------------------------------+--------------+-------------+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| codigo_producto | nombre                           | gama         | dimensiones | proveedor        | descripcion

                                                                                                                                                                                                                    | cantidad_en_stock | precio_venta | precio_proveedor |
+-----------------+----------------------------------+--------------+-------------+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| OR-100          | Mimosa Injerto CLASICA Dealbata  | Ornamentales | 100-110     | Viveros EL OASIS | Acacia dealbata. Nombre com├║n o vulgar: Mimosa fina, Mimosa, Mimosa com├║n, Mimosa plateada, Aromo franc├йs. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje 
persistente muy usado en parques por su atractiva floraci├│n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r├бpido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre├▒idos entre las semillas, que se disponen en el fruto longitudinalmente... |               100 |        12.00 |             9.00 |
| OR-101          | Expositor Mimosa Semilla Mix     | Ornamentales | 170-200     | Viveros EL OASIS | Acacia dealbata. Nombre com├║n o vulgar: Mimosa fina, Mimosa, Mimosa com├║n, Mimosa plateada, Aromo franc├йs. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje 
persistente muy usado en parques por su atractiva floraci├│n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r├бpido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre├▒idos entre las semillas, que se disponen en el fruto longitudinalmente... |               100 |         6.00 |             4.00 |
| OR-102          | Mimosa Semilla Bayleyana         | Ornamentales | 170-200     | Viveros EL OASIS | Acacia dealbata. Nombre com├║n o vulgar: Mimosa fina, Mimosa, Mimosa com├║n, Mimosa plateada, Aromo franc├йs. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje 
persistente muy usado en parques por su atractiva floraci├│n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r├бpido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre├▒idos entre las semillas, que se disponen en el fruto longitudinalmente... |               100 |         6.00 |             4.00 |
| OR-103          | Mimosa Semilla Bayleyana         | Ornamentales | 200-225     | Viveros EL OASIS | Acacia dealbata. Nombre com├║n o vulgar: Mimosa fina, Mimosa, Mimosa com├║n, Mimosa plateada, Aromo franc├йs. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje 
persistente muy usado en parques por su atractiva floraci├│n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r├бpido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grandes. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre├▒idos entre las semillas, que se disponen en el fruto longitudinalmente... |               100 |        10.00 |             8.00 |
| OR-104          | Mimosa Semilla Cyanophylla       | Ornamentales | 200-225     | Viveros EL OASIS | Acacia dealbata. Nombre com├║n o vulgar: Mimosa fina, Mimosa, Mimosa com├║n, Mimosa plateada, Aromo franc├йs. Familia: Mimosaceae. Origen: Australia, Sureste, (N. G. del Sur y Victoria). Arbol de follaje 
persistente muy usado en parques por su atractiva floraci├│n amarilla hacia fines del invierno. Altura: de 3 a 10 metros generalmente. Crecimiento r├бpido. Follaje perenne de tonos plateados, muy ornamental. Sus hojas son de textura fina, de color verde y sus flores amarillas que aparecen en racimos grane 
s. Florece de Enero a Marzo (Hemisferio Norte). Legumbre de 5-9 cm de longitud, recta o ligeramente curvada, con los bordes algo constre├▒idos entre las semillas, que se disponen en el fruto longitudinalmente... |               100 |        10.00 |             8.00 |
+-----------------+----------------------------------+--------------+-------------+------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+

Contienen la palabra tronco y la palabra árbol en el nombre o en la descripción. **/
select * from producto 
where match(nombre, descripcion) against('+arbol + tronco' in boolean mode);
/**
Empty set (0.00 sec)

Contienen la palabra tronco pero no contienen la palabra árbol en el nombre o en la descripción. **/
select * from producto 
where match(nombre, descripcion) against('-arbol +tronco' in boolean mode) limit 5;
/**
Contiene la frase proviene de las costas en el nombre o en la descripción. **/
select * from producto 
where match(nombre, descripcion) against("+proviene de las costas" in boolean mode);
/**
+-----------------+-----------------+----------+-------------+-----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| codigo_producto | nombre          | gama     | dimensiones | proveedor             | descripcion

                                                                                                                   | cantidad_en_stock | precio_venta | precio_proveedor |
+-----------------+-----------------+----------+-------------+-----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| FR-102          | Olea-Olivos     | Frutales | 8/10        | Frutales Talavera S.A | Existen dos hip├│tesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, L├нbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y m├бs tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterr├бneas espa├▒olas coinciden con el dominio romano, aunque fueron posteriormente los ├бrabes los que impulsaron su cultivo en Andaluc├нa, convirtiendo a Espa├▒a en el primer pa├нs productor de aceite de oliva a nivel mundial. |                50 |        18.00 |            14.00 |
| FR-103          | Olea-Olivos     | Frutales | 10/12       | Frutales Talavera S.A | Existen dos hip├│tesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, L├нbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y m├бs tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterr├бneas espa├▒olas coinciden con el dominio romano, aunque fueron posteriormente los ├бrabes los que impulsaron su cultivo en Andaluc├нa, convirtiendo a Espa├▒a en el primer pa├нs productor de aceite de oliva a nivel mundial. |                50 |        25.00 |            20.00 |
| FR-104          | Olea-Olivos     | Frutales | 12/4        | Frutales Talavera S.A | Existen dos hip├│tesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, L├нbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y m├бs tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterr├бneas espa├▒olas coinciden con el dominio romano, aunque fueron posteriormente los ├бrabes los que impulsaron su cultivo en Andaluc├нa, convirtiendo a Espa├▒a en el primer pa├нs productor de aceite de oliva a nivel mundial. |                50 |        49.00 |            39.00 |
| FR-105          | Olea-Olivos     | Frutales | 14/16       | Frutales Talavera S.A | Existen dos hip├│tesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, L├нbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y m├бs tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterr├бneas espa├▒olas coinciden con el dominio romano, aunque fueron posteriormente los ├бrabes los que impulsaron su cultivo en Andaluc├нa, convirtiendo a Espa├▒a en el primer pa├нs productor de aceite de oliva a nivel mundial. |                50 |        70.00 |            56.00 |
| FR-55           | Olivo Cipresino | Frutales |             | Frutales Talavera S.A | Existen dos hip├│tesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, L├нbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y m├бs tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterr├бneas espa├▒olas coinciden con el dominio romano, aunque fueron posteriormente los ├бrabes los que impulsaron su cultivo en Andaluc├нa, convirtiendo a Espa├▒a en el primer pa├нs productor de aceite de oliva a nivel mundial. |               400 |         8.00 |             6.00 |
+-----------------+-----------------+----------+-------------+-----------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+

Crea un índice de tipo INDEX compuesto por las columnas apellido_contacto y nombre_contacto de la tabla cliente. **/
create fulltext index id_nom_ap on cliente(apellido_contacto, nombre_contacto);
/**
Una vez creado el índice del ejercicio anterior realice las siguientes consultas haciendo uso de EXPLAIN: 
Busca el cliente Javier Villar. ¿Cuántas filas se han examinado hasta encontrar el resultado? **/
explain select * from cliente
where match(apellido_contacto, nombre_contacto) against("+Javier Villar" in boolean mode);
/**

+----+-------------+---------+------------+----------+---------------+-----------+---------+-------+------+----------+-----------------------------------+
| id | select_type | table   | partitions | type     | possible_keys | key       | key_len | ref   | rows | filtered | Extra                             |
+----+-------------+---------+------------+----------+---------------+-----------+---------+-------+------+----------+-----------------------------------+
|  1 | SIMPLE      | cliente | NULL       | fulltext | id_nom_ap     | id_nom_ap | 0       | const |    1 |   100.00 | Using where; Ft_hints: no_ranking |
+----+-------------+---------+------------+----------+---------------+-----------+---------+-------+------+----------+-----------------------------------+

--- Se ha examinado solo una fila 

Busca el cliente anterior utilizando solamente el apellido Villar. **/
explain select * from cliente
where match(apellido_contacto, nombre_contacto) against("+Villar" in boolean mode);
/**
+----+-------------+---------+------------+----------+---------------+-----------+---------+-------+------+----------+-----------------------------------+
| id | select_type | table   | partitions | type     | possible_keys | key       | key_len | ref   | rows | filtered | Extra                             |
+----+-------------+---------+------------+----------+---------------+-----------+---------+-------+------+----------+-----------------------------------+
|  1 | SIMPLE      | cliente | NULL       | fulltext | id_nom_ap     | id_nom_ap | 0       | const |    1 |   100.00 | Using where; Ft_hints: no_ranking |
+----+-------------+---------+------------+----------+---------------+-----------+---------+-------+------+----------+-----------------------------------+

¿Cuántas filas se han examinado hasta encontrar el resultado? 
--- Se ha examinado una sola fila

Busca el cliente anterior utilizando solamente el nombre Javier. ¿Cuántas filas se han examinado hasta encontrar el resultado? ¿Qué ha ocurrido en este caso? **/
explain select * from cliente
where match(apellido_contacto, nombre_contacto) against("+Javier" in boolean mode);
/**
+----+-------------+---------+------------+----------+---------------+-----------+---------+-------+------+----------+-----------------------------------+
| id | select_type | table   | partitions | type     | possible_keys | key       | key_len | ref   | rows | filtered | Extra                             |
+----+-------------+---------+------------+----------+---------------+-----------+---------+-------+------+----------+-----------------------------------+
|  1 | SIMPLE      | cliente | NULL       | fulltext | id_nom_ap     | id_nom_ap | 0       | const |    1 |   100.00 | Using where; Ft_hints: no_ranking |
+----+-------------+---------+------------+----------+---------------+-----------+---------+-------+------+----------+-----------------------------------+

Calcula cuál podría ser un buen valor para crear un índice sobre un prefijo de la columna nombre_cliente de la tabla cliente. 
Tenga en cuenta que un buen valor será aquel que nos permita utilizar el menor número de caracteres para diferenciar todos los valores que existen en la columna sobre la que estamos creando el índice. 
En primer lugar calculamos cuántos valores distintos existen en la columna nombre_cliente. Necesitarás utilizar la función COUNT y DISTINCT.**/
select count(distinct(nombre_cliente)) from cliente;
/**
+---------------------------------+
| count(distinct(nombre_cliente)) |
+---------------------------------+
|                              35 |
+---------------------------------+

Haciendo uso de la función LEFT ve calculando el número de caracteres que necesitas utilizar como prefijo para diferenciar todos los valores de la columna. Necesitarás la función COUNT, DISTINCT y LEFT. **/
select count(distinct left(nombre_cliente, 9)) from cliente;

/**
Una vez que hayas encontrado el valor adecuado para el prefijo, crea el índice sobre la columna nombre_cliente de la tabla cliente.
Ejecuta algunas consultas de prueba sobre el índice que acabas de crear. **/


/**
Vistas
Escriba una vista que se llame listado_pagos_clientes que muestre un listado donde aparezcan todos los clientes y los pagos que ha realizado cada uno de ellos. 
La vista deberá tener las siguientes columnas: nombre y apellidos del cliente concatenados, teléfono, ciudad, pais, fecha_pago, total del pago, id de la transacción **/
create view listado_pagos_clientes as
select concat(c.nombre_contacto, ' ', c.apellido_contacto) as nom_ap, c.telefono, c.ciudad, c.pais, p.fecha_pago, p.total, p.id_transaccion 
from cliente as c
join pago as p on c.codigo_cliente=p.codigo_cliente;
/**
Escriba una vista que se llame listado_pedidos_clientes que muestre un listado donde aparezcan todos los clientes y los pedidos que ha realizado cada uno de ellos. 
La vista deberá tener las siguientes columnas: código del cliente, nombre y apellidos del cliente concatendados, 
teléfono, ciudad, pais, código del pedido, fecha del pedido, fecha esperada, fecha de entrega y la cantidad total del pedido, que será la suma del producto 
de todas las cantidades por el precio de cada unidad, que aparecen en cada línea de pedido. **/
create view listado_pedidos_clientes as
select c.codigo_cliente, concat(c.nombre_contacto, ' ', c.apellido_contacto) as nom_ap, c.telefono, c.ciudad, c.pais, 
p.codigo_pedido, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega, 
sum(dp.cantidad*precio_unidad) as total 
from cliente as c 
join pedido as p on p.codigo_cliente=c.codigo_cliente
join detalle_pedido as dp on p.codigo_pedido=dp.codigo_pedido
group by p.codigo_cliente, p.codigo_pedido;
/**
Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes de la ciudad de Madrid que han realizado pagos. **/
select nom_ap, telefono, ciudad, pais from listado_pagos_clientes 
where ciudad='Madrid';
/**
+---------------------+-------------+--------+-------+
| nom_ap              | telefono    | ciudad | pais  |
+---------------------+-------------+--------+-------+
| Jose Bermejo        | 654987321   | Madrid | Spain |
| Guillermo Rengifo   | 689234750   | Madrid | Spain |
| Juan Rodriguez      | 34912453217 | Madrid | Spain |
| Javier Villar       | 654865643   | Madrid | Spain |
| Javier Villar       | 654865643   | Madrid | Spain |
| Eva Mar├нa S├бnchez | 916877445   | Madrid | Spain |
| Mat├нas San Mart├нn | 916544147   | Madrid | Spain |
+---------------------+-------------+--------+-------+

Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes que todavía no han recibido su pedido. **/
select distinct nom_ap, telefono, ciudad, pais from listado_pedidos_clientes
where fecha_entrega is null;
/**
+---------------------+-------------+--------------------------+-----------+
| nom_ap              | telefono    | ciudad                   | pais      |
+---------------------+-------------+--------------------------+-----------+
| Akane Tendo         | 55591233210 | Miami                    | USA       |
| Anne Wright         | 5557410345  | Miami                    | USA       |
| Daniel G GoldFish   | 5556901745  | San Francisco            | USA       |
| Jose Bermejo        | 654987321   | Madrid                   | Spain     |
| Guillermo Rengifo   | 689234750   | Madrid                   | Spain     |
| Link Flaute         | 5552323129  | New York                 | USA       |
| Eva Mar├нa S├бnchez | 916877445   | Madrid                   | Spain     |
| Juan Rodriguez      | 34912453217 | Madrid                   | Spain     |
| Pedro Camunas       | 34914873241 | San Lorenzo del Escorial | Spain     |
| Javier Villar       | 654865643   | Madrid                   | Spain     |
| Benito Lopez        | 675432926   | Getafe                   | Spain     |
| Mat├нas San Mart├нn | 916544147   | Madrid                   | Spain     |
| Jacob Jones         | 2 9261-2433 | Sydney                   | Australia |
| Maria Rodriguez     | 666555444   | Fuenlabrada              | Spain     |
| Sara Marquez        | 675124537   | Fuenlabrada              | Spain     |
| Justin Smith        | 2 8005-7161 | Sydney                   | Australia |
+---------------------+-------------+--------------------------+-----------+

Utilice las vistas que ha creado en los pasos anteriores para calcular el número de pedidos que se ha realizado cada uno de los clientes. **/
select nom_ap, count(codigo_pedido) from listado_pedidos_clientes
group by nom_ap;
/**
+---------------------+----------------------+
| nom_ap              | count(codigo_pedido) |
+---------------------+----------------------+
| Akane Tendo         |                    5 |
| Daniel G GoldFish   |                   11 |
| Anne Wright         |                    9 |
| Jose Bermejo        |                    5 |
| Guillermo Rengifo   |                    5 |
| Juan Rodriguez      |                    5 |
| Pedro Camunas       |                    5 |
| Link Flaute         |                    5 |
| Luis Martinez       |                    5 |
| Maria Santillana    |                    5 |
| Eva Mar├нa S├бnchez |                    5 |
| Javier Villar       |                    5 |
| Benito Lopez        |                    5 |
| Jacob Jones         |                    5 |
| Mat├нas San Mart├нn |                    5 |
| Maria Rodriguez     |                   10 |
| Sara Marquez        |                   10 |
| Justin Smith        |                    5 |
| Antonio Romero      |                    5 |
+---------------------+----------------------+

Utilice las vistas que ha creado en los pasos anteriores para calcular el valor del pedido máximo y mínimo que ha realizado cada cliente. **/
select nom_ap, min(total), max(total) from listado_pedidos_clientes
group by nom_ap;
/**
+---------------------+------------+------------+
| nom_ap              | min(total) | max(total) |
+---------------------+------------+------------+
| Akane Tendo         |    1567.00 |   10850.00 |
| Daniel G GoldFish   |     290.00 |    2535.00 |
| Anne Wright         |     504.00 |    4775.00 |
| Jose Bermejo        |     214.00 |     829.00 |
| Guillermo Rengifo   |       6.00 |     333.00 |
| Juan Rodriguez      |     287.00 |    1569.00 |
| Pedro Camunas       |     141.00 |     773.00 |
| Link Flaute         |    1532.00 |   73226.00 |
| Luis Martinez       |       4.00 |     108.00 |
| Maria Santillana    |       5.00 |     164.00 |
| Eva Mar├нa S├бnchez |     625.00 |    7750.00 |
| Javier Villar       |     588.00 |    4660.00 |
| Benito Lopez        |     120.00 |    5773.00 |
| Jacob Jones         |     322.00 |    1024.00 |
| Mat├нas San Mart├нn |      41.00 |    5759.00 |
| Maria Rodriguez     |     209.00 |    2070.00 |
| Sara Marquez        |     304.00 |    3216.00 |
| Justin Smith        |      51.00 |     553.00 |
| Antonio Romero      |     700.00 |     700.00 |
+---------------------+------------+------------+

Modifique el nombre de las vista listado_pagos_clientes y asígnele el nombre listado_de_pagos. 
Una vez que haya modificado el nombre de la vista ejecute una consulta utilizando el nuevo nombre de la vista para comprobar que sigue funcionando correctamente. **/
rename table listado_pagos_clientes to listado_de_pagos;
select * from listado_de_pagos limit 5;
/**
+-------------------+------------+---------------+------+------------+---------+----------------+
| nom_ap            | telefono   | ciudad        | pais | fecha_pago | total   | id_transaccion |
+-------------------+------------+---------------+------+------------+---------+----------------+
| Daniel G GoldFish | 5556901745 | San Francisco | USA  | 2008-11-10 | 2000.00 | ak-std-000001  |
| Daniel G GoldFish | 5556901745 | San Francisco | USA  | 2008-12-10 | 2000.00 | ak-std-000002  |
| Anne Wright       | 5557410345 | Miami         | USA  | 2009-01-16 | 5000.00 | ak-std-000003  |
| Anne Wright       | 5557410345 | Miami         | USA  | 2009-02-16 | 5000.00 | ak-std-000004  |
| Anne Wright       | 5557410345 | Miami         | USA  | 2009-02-19 |  926.00 | ak-std-000005  |
+-------------------+------------+---------------+------+------------+---------+----------------+

Elimine las vistas que ha creado en los pasos anteriores.
Nota: Realiza cada una de las acciones e indica la salida de estas. **/
drop view listado_de_pagos;
drop view listado_pedidos_clientes;
/**
mysql> drop view listado_de_pagos;
Query OK, 0 rows affected (0.01 sec)

mysql> drop view listado_pedidos_clientes;
Query OK, 0 rows affected (0.00 sec)
