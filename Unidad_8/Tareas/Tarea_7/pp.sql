/**
Una de las preguntas más comunes que se hacen las personas cuando empiezan su vida laboral, suele ser qué es el salario base. 
Y es que es normal que la gente ande un poco confundida ya que, si no tienes conocimientos en este campo, es fácil hacerse un lío con términos como:

Salario base.
Base reguladora.
Salario bruto.
Salario neto.
Etc.

Teniendo en cuenta esta información se pide:

Crea una base datos llamada salario.
Crear BBDD en MySql.

Crea una tabla llamada persona con los siguientes campos:
Identificador. (Texto)(PK).
Nombre (Texto).
Salario_base. (Escoge el tipo de dato).
Subsidio(Escoge el tipo de dato).
Salud(Escoge el tipo de dato).
Pensión(Escoge el tipo de dato).
Bono(Escoge el tipo de dato).
Integral(Escoge el tipo de dato). **/
create database salario;
use salario;

create table persona(
    id varchar(20) not null primary key,
    nombre varchar(100),
    salario_base decimal(10, 2),
    subsidiio decimal(5, 2),
    salud decimal(5, 2),
    pension decimal(5, 2),
    bono decimal(5, 2),
    integral decimal(10, 2)
);

/**

Creación de un procedimiento de forma aleatoria con las siguientes características:
Parámetro de entrada el número de registros (Mínimo 10, y realiza la prueba varias veces). **/
delimiter $$

create procedure test_data(in iterations int, in r_name varchar(100), in salario_base decimal(10, 2), in factor decimal(2,2))
begin
declare n_iter int default 0; 
declare n_id varchar(20);

while n_iter < iterations do
    set n_iter = n_iter + 1;
    set n_id = SUBSTRING_INDEX(UUID(), '-', 1);
    insert into persona(id, nombre, salario_base)
    values(n_id, concat(r_name, SUBSTRING(UUID(), floor((rand() * 32)) )), salario_base * (factor + rand() * (1 - factor)));
    call update_person(n_id);
end while;
end $$

delimiter ;

/**

Cree una función para cada punto teniendo en cuenta que:
Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico. Actualiza el valor en la tabla. **/
delimiter $$

create function subsidio_transporte(salario_base decimal(10, 2)) returns decimal(5, 2) DETERMINISTIC
begin
declare subsidio decimal(10, 2);
set subsidio = round(salario_base * 0.07, 2);
return subsidio;
end $$

delimiter ;

-- 1670.09914 round(1670.09914 * 0.07, 2);
/**
Función salud: La salud que corresponde al 4% al salario básico. Actualiza el valor en la tabla. **/
delimiter $$

create function salud(salario_base decimal(10, 2)) returns decimal(5, 2) DETERMINISTIC
begin
declare result decimal(5, 2);
set result = round(salario_base * 0.04, 2);
return result;
end $$

delimiter ;

/**
Función pension: La pensión que corresponde al 4% al salario básico. Actualiza el valor en la tabla. **/
delimiter $$

create function pension(salario_base decimal(10, 2)) returns decimal(5, 2) DETERMINISTIC
begin
declare result decimal(5, 2);
set result = round(salario_base * 0.04, 2);
return result;
end $$

delimiter ;

/**
Función bono: Un bono que corresponde al 8% al salario básico. Actualiza el valor en la tabla. **/
delimiter $$

create function bono(salario_base decimal(10, 2)) returns decimal(5, 2) DETERMINISTIC
begin
declare result decimal(5, 2);
set result = round(salario_base * 0.08, 2);
return result;
end $$

delimiter ;

/**
Función integral: El salario integral es la suma del salario básico - salud - pension + bono + sub de transporte. Actualiza el valor en la tabla. **/
delimiter $$

create function integral(salario_base decimal(10, 2), subsidio decimal(5, 2), salud decimal(5, 2), pension decimal(5,2), bono decimal(5, 2)) returns decimal(10, 2) DETERMINISTIC
begin
declare result decimal(10, 2);
set result = round(salario_base - salud - pension + bono + subsidio, 2);
return result;
end $$

delimiter ;

/**
Crea cada uno de las funciones anteriores para una persona en específico.
El parámetro de entrada debe de ser un identificar de la persona.
**/
delimiter $$

create procedure update_person(in c_id varchar(15))
begin
update persona 
set subsidiio=subsidio_transporte(salario_base),
salud=salud(salario_base),
pension=pension(salario_base),
bono=bono(salario_base),
integral=integral(salario_base, subsidiio, salud, pension, bono)
where id=c_id;
end $$

delimiter ;


call test_data(10, 'persona', 2000, 0.7); 

/**
+----------+--------------------------------------------+--------------+-----------+-------+---------+--------+----------+
| id       | nombre                                     | salario_base | subsidiio | salud | pension | bono   | integral |
+----------+--------------------------------------------+--------------+-----------+-------+---------+--------+----------+
| 282ba6bf | personab-1500-11ef-a518-04d9f5096915       |      1861.27 |    130.29 | 74.45 |   74.45 | 148.90 |  1991.56 |
| 282c9c4e | persona                                    |      1900.57 |    133.04 | 76.02 |   76.02 | 152.05 |  2033.62 |
| 282dba0a | persona82dba9d-1500-11ef-a518-04d9f5096915 |      1959.51 |    137.17 | 78.38 |   78.38 | 156.76 |  2096.68 |
| 282e6b97 | persona00-11ef-a518-04d9f5096915           |      1525.45 |    106.78 | 61.02 |   61.02 | 122.04 |  1632.23 |
| 282f0540 | persona4d9f5096915                         |      1748.06 |    122.36 | 69.92 |   69.92 | 139.84 |  1870.42 |
| 282f9a3d | persona00-11ef-a518-04d9f5096915           |      1484.14 |    103.89 | 59.37 |   59.37 | 118.73 |  1588.02 |
| 28302fa1 | personaf-a518-04d9f5096915                 |      1666.16 |    116.63 | 66.65 |   66.65 | 133.29 |  1782.78 |
| 2830d23a | persona11ef-a518-04d9f5096915              |      1499.79 |    104.99 | 59.99 |   59.99 | 119.98 |  1604.78 |
| 28315e50 | persona1500-11ef-a518-04d9f5096915         |      1500.58 |    105.04 | 60.02 |   60.02 | 120.05 |  1605.63 |
| 2831f522 | persona4d9f5096915                         |      1812.96 |    126.91 | 72.52 |   72.52 | 145.04 |  1939.87 |
+----------+--------------------------------------------+--------------+-----------+-------+---------+--------+----------+ **/

call test_data(7, 'bebebe', 3000, 0.7); 

/**
+----------+--------------------------------------------+--------------+-----------+--------+---------+--------+----------+
| id       | nombre                                     | salario_base | subsidiio | salud  | pension | bono   | integral |
+----------+--------------------------------------------+--------------+-----------+--------+---------+--------+----------+
| 282ba6bf | personab-1500-11ef-a518-04d9f5096915       |      1861.27 |    130.29 |  74.45 |   74.45 | 148.90 |  1991.56 |
| 282c9c4e | persona                                    |      1900.57 |    133.04 |  76.02 |   76.02 | 152.05 |  2033.62 |
| 282dba0a | persona82dba9d-1500-11ef-a518-04d9f5096915 |      1959.51 |    137.17 |  78.38 |   78.38 | 156.76 |  2096.68 |
| 282e6b97 | persona00-11ef-a518-04d9f5096915           |      1525.45 |    106.78 |  61.02 |   61.02 | 122.04 |  1632.23 |
| 282f0540 | persona4d9f5096915                         |      1748.06 |    122.36 |  69.92 |   69.92 | 139.84 |  1870.42 |
| 282f9a3d | persona00-11ef-a518-04d9f5096915           |      1484.14 |    103.89 |  59.37 |   59.37 | 118.73 |  1588.02 |
| 28302fa1 | personaf-a518-04d9f5096915                 |      1666.16 |    116.63 |  66.65 |   66.65 | 133.29 |  1782.78 |
| 2830d23a | persona11ef-a518-04d9f5096915              |      1499.79 |    104.99 |  59.99 |   59.99 | 119.98 |  1604.78 |
| 28315e50 | persona1500-11ef-a518-04d9f5096915         |      1500.58 |    105.04 |  60.02 |   60.02 | 120.05 |  1605.63 |
| 2831f522 | persona4d9f5096915                         |      1812.96 |    126.91 |  72.52 |   72.52 | 145.04 |  1939.87 |
| 4ac18e61 | bebebef5096915                             |      2611.35 |    182.79 | 104.45 |  104.45 | 208.91 |  2794.15 |
| 4ac2627f | bebebe4ac26311-1500-11ef-a518-04d9f5096915 |      2640.67 |    184.85 | 105.63 |  105.63 | 211.25 |  2825.51 |
| 4ac2f5a3 | bebebe4d9f5096915                          |      2370.65 |    165.95 |  94.83 |   94.83 | 189.65 |  2536.59 |
| 4ac3e064 | bebebe4ac3e0f4-1500-11ef-a518-04d9f5096915 |      2376.29 |    166.34 |  95.05 |   95.05 | 190.10 |  2542.63 |
| 4ac4794c | bebebe0-11ef-a518-04d9f5096915             |      2213.75 |    154.96 |  88.55 |   88.55 | 177.10 |  2368.71 |
| 4ac51985 | bebebe00-11ef-a518-04d9f5096915            |      2674.51 |    187.22 | 106.98 |  106.98 | 213.96 |  2861.73 |
| 4ac5cc62 | bebebe096915                               |      2991.97 |    209.44 | 119.68 |  119.68 | 239.36 |  3201.41 |
+----------+--------------------------------------------+--------------+-----------+--------+---------+--------+----------+ **/

call test_data(5, 'mememe', 3000, 0.3); 

/**
+----------+--------------------------------------------+--------------+-----------+--------+---------+--------+----------+
| id       | nombre                                     | salario_base | subsidiio | salud  | pension | bono   | integral |
+----------+--------------------------------------------+--------------+-----------+--------+---------+--------+----------+
| 282ba6bf | personab-1500-11ef-a518-04d9f5096915       |      1861.27 |    130.29 |  74.45 |   74.45 | 148.90 |  1991.56 |
| 282c9c4e | persona                                    |      1900.57 |    133.04 |  76.02 |   76.02 | 152.05 |  2033.62 |
| 282dba0a | persona82dba9d-1500-11ef-a518-04d9f5096915 |      1959.51 |    137.17 |  78.38 |   78.38 | 156.76 |  2096.68 |
| 282e6b97 | persona00-11ef-a518-04d9f5096915           |      1525.45 |    106.78 |  61.02 |   61.02 | 122.04 |  1632.23 |
| 282f0540 | persona4d9f5096915                         |      1748.06 |    122.36 |  69.92 |   69.92 | 139.84 |  1870.42 |
| 282f9a3d | persona00-11ef-a518-04d9f5096915           |      1484.14 |    103.89 |  59.37 |   59.37 | 118.73 |  1588.02 |
| 28302fa1 | personaf-a518-04d9f5096915                 |      1666.16 |    116.63 |  66.65 |   66.65 | 133.29 |  1782.78 |
| 2830d23a | persona11ef-a518-04d9f5096915              |      1499.79 |    104.99 |  59.99 |   59.99 | 119.98 |  1604.78 |
| 28315e50 | persona1500-11ef-a518-04d9f5096915         |      1500.58 |    105.04 |  60.02 |   60.02 | 120.05 |  1605.63 |
| 2831f522 | persona4d9f5096915                         |      1812.96 |    126.91 |  72.52 |   72.52 | 145.04 |  1939.87 |
| 4ac18e61 | bebebef5096915                             |      2611.35 |    182.79 | 104.45 |  104.45 | 208.91 |  2794.15 |
| 4ac2627f | bebebe4ac26311-1500-11ef-a518-04d9f5096915 |      2640.67 |    184.85 | 105.63 |  105.63 | 211.25 |  2825.51 |
| 4ac2f5a3 | bebebe4d9f5096915                          |      2370.65 |    165.95 |  94.83 |   94.83 | 189.65 |  2536.59 |
| 4ac3e064 | bebebe4ac3e0f4-1500-11ef-a518-04d9f5096915 |      2376.29 |    166.34 |  95.05 |   95.05 | 190.10 |  2542.63 |
| 4ac4794c | bebebe0-11ef-a518-04d9f5096915             |      2213.75 |    154.96 |  88.55 |   88.55 | 177.10 |  2368.71 |
| 4ac51985 | bebebe00-11ef-a518-04d9f5096915            |      2674.51 |    187.22 | 106.98 |  106.98 | 213.96 |  2861.73 |
| 4ac5cc62 | bebebe096915                               |      2991.97 |    209.44 | 119.68 |  119.68 | 239.36 |  3201.41 |
| 695c0f2d | mememe                                     |      1079.21 |     75.54 |  43.17 |   43.17 |  86.34 |  1154.75 |
| 695cb444 | mememe00-11ef-a518-04d9f5096915            |      2373.60 |    166.15 |  94.94 |   94.94 | 189.89 |  2539.76 |
| 695d4ad9 | mememe1500-11ef-a518-04d9f5096915          |      2085.61 |    145.99 |  83.42 |   83.42 | 166.85 |  2231.61 |
| 695de071 | mememe4d9f5096915                          |      1764.24 |    123.50 |  70.57 |   70.57 | 141.14 |  1887.74 |
| 695e9dbc | mememe-a518-04d9f5096915                   |      2450.04 |    171.50 |  98.00 |   98.00 | 196.00 |  2621.54 |
+----------+--------------------------------------------+--------------+-----------+--------+---------+--------+----------+
**/