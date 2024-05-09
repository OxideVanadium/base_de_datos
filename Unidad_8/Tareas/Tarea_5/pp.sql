/**
La base de datos de "empleados" es un sistema diseñado para gestionar información relacionada con los empleados de una empresa. Esta base de datos está estructurada en torno a la entidad principal "empleados", que contiene información detallada sobre cada empleado. La estructura de la base de datos se compone de una única tabla principal llamada "empleados".

La tabla "empleados" está diseñada con las siguientes columnas:

    id: Esta columna sirve como identificador único para cada empleado. Es de tipo entero y se genera automáticamente utilizando la propiedad AUTO_INCREMENT.
    nombre: Almacena el nombre completo de cada empleado. Es de tipo cadena de caracteres (VARCHAR) con una longitud máxima de 100 caracteres. 
    salario: Esta columna registra el salario de cada empleado. Se define como un número decimal (DECIMAL) con una precisión de 10 dígitos en total y 2 dígitos después del punto decimal. **/

CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);

/** 
Veamos la tabla:

mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
|  3 | Pedro  | 3520.00 |
+----+--------+---------+


Realiza:

Escribe un procedimiento almacenado que copie los nombres de todos los empleados cuyo salario sea superior a 3000 en 
una nueva tabla llamada 'empleados_destino'. Es necesario crear la tabla empleados_destiono. **/
create table if not exists empleados_destino(
    n_name varchar(100)
);
delimiter $$

create procedure name_copy(in max_limit decimal(10,2))
begin 
declare sstop int default false;
declare s_name varchar(100);
declare curs cursor for select nombre from empleados where salario>max_limit;
declare continue handler for not found set sstop=true;

open curs;
read_loop: loop
    fetch curs into s_name;
    if sstop then
        leave read_loop;
    end if;
    insert into empleados_destino(n_name)
    values(s_name);
end loop;
close curs;
end $$

delimiter ;

call name_copy(3000);
/**
mysql> select * from empleados_destino;
Empty set (0,00 sec)


mysql> select * from empleados_destino;
+--------+
| n_name |
+--------+
| Juan   |
| María  |
+--------+
2 rows in set (0,00 sec)

Escribe un procedimiento almacenado que seleccione los empleados cuyos nombres contienen la letra 'a' y aumente sus salarios en un 10%.**/
delimiter $$

create procedure increase_for_no_reason(in letter varchar(1), in percent decimal(10, 2))
begin
declare c_salary decimal(10, 2);
declare c_id int;
declare sstop int default false;
declare curs cursor for select id, salario from empleados where nombre regexp letter;
declare continue handler for not found set sstop = true;

open curs;
read_loop: loop
    fetch curs into c_id, c_salary;
    if sstop then
        leave read_loop;
    end if;
    update empleados 
    set salario=c_salary*(1+percent)
    where id=c_id;
end loop;
close curs;
end $$

delimiter ;

call increase_for_no_reason('a', 0.1);
/** 
mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
3 rows in set (0,00 sec)

mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
3 rows in set (0,00 sec)


Escribe un procedimiento almacenado que seleccione empleados cuyos IDs estén en un rango específico, por ejemplo, entre 2 y 3. **/
delimiter $$

create procedure ok_select(in min_limit int, in max_limit int)
begin
declare sstop int default false;
declare c_id int;
declare c_name varchar(100);
declare c_salary decimal(10, 2);
declare curs cursor for select id, nombre, salario from empleados where id between min_limit and max_limit;
declare continue handler for not found set sstop=true;

open curs;
read_loop: loop
    fetch curs into c_id, c_name, c_salary;
    if sstop then
        leave read_loop;
    end if;
    select c_id, c_name, c_salary;
end loop;
close curs;
end $$

delimiter ;

call ok_select(2, 3);
/** 
mysql> call ok_select(2, 3);
+------+--------+----------+
| c_id | c_name | c_salary |
+------+--------+----------+
|    2 | María  |  3850.00 |
+------+--------+----------+
1 row in set (0,00 sec)

+------+--------+----------+
| c_id | c_name | c_salary |
+------+--------+----------+
|    3 | Pedro  |  3200.00 |
+------+--------+----------+
1 row in set (0,00 sec)

Escribe un procedimiento almacenado que elimine todos los empleados cuyo salario esté entre 2000 y 2500. **/
delimiter $$

create procedure kill_poors(in min_limit int, in max_limit int)
begin
declare sstop int default false;
declare s_id int;
declare curs cursor for select id from empleados where salario between min_limit and max_limit;
declare continue handler for not found set sstop=true;

open curs;
read_loop: loop 
    fetch curs into s_id;
    if sstop then
        leave read_loop;
    end if;
    delete from empleados where id=s_id;
end loop;
close curs;
end $$

delimiter ;

call kill_poors(3000, 3200);

/**
mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
3 rows in set (0,00 sec)

mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
+----+--------+---------+
2 rows in set (0,00 sec)

Escribe un procedimiento almacenado que aumente el salario de un empleado específico cuyo nombre se pasa como parámetro en un 20%.**/
delimiter $$ 

create procedure reward_your_hero(in hero_name varchar(100), in percent decimal(10,2))
begin 
declare sstop int default false;
declare s_id int;
declare curs cursor for select id from empleados where nombre=hero_name;
declare continue handler for not found set sstop=true;

open curs;
read_loop: loop
    fetch curs into s_id;
    if sstop then
        leave read_loop;
    end if;
    update empleados
    set salario=salario*(1+percent)
    where id=s_id;
end loop;
close curs;
end $$

delimiter ;

call reward_your_hero('María', 0.2);
/**
mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
+----+--------+---------+
2 rows in set (0,00 sec)

mysql> select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 4620.00 |
+----+--------+---------+
2 rows in set (0,00 sec)
