-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Crear la tabla empleados
CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

-- Insertar algunos datos de ejemplo
INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);

/**
Teniendo este ejemplo como referencia, realiza:

Escribe un procedimiento almacenado que aumente los salarios de todos los empleados en un 5%, pero excluya a aquellos cuyo salario sea superior a 3200. 
El procedimiento debe tener parámetros de entrada. **/
delimiter $$

create procedure increase_salary(in percent DECIMAL(10, 2), in s_max int)
begin
declare stoppp int default false;
declare is_id int;
declare is_salario DECIMAL(10, 2);
declare curs cursor for select id, salario from empleados;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET stoppp = TRUE;

open curs;
read_loop: loop
    fetch curs into is_id, is_salario;
    if stoppp then 
    leave read_loop;
    end if;
    update empleados set salario=salario*(1+percent/100)
    where id=is_id
    and salario>s_max;
end loop;
close curs;
end $$

delimiter ;

call increase_salary(5, 3200);

/**
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+

+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | Mar?a  | 3675.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+

Escribe un procedimiento almacenado que calcule el salario anual de cada empleado (asumiendo que trabajan todo el año) y lo imprima. **/
delimiter $$

create procedure anual_salary()
begin 
declare stoppp int default false;
declare s_id int;
declare s_salary DECIMAL(10, 2);
declare s_name VARCHAR(100);
declare curs cursor for select id, s_name, salario from empleados;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET stoppp = TRUE;

open curs;
read_loop: loop
    fetch curs into s_id, s_name, s_salary;
    if stoppp then
        leave read_loop;
    end if;
    select *, (salario * 12) as anual from empleados;
end loop;
close curs;
end $$

delimiter ;
CALL anual_salary();


/**
+----+--------+---------+----------+
| id | nombre | salario | anual    |
+----+--------+---------+----------+
|  1 | Juan   | 3000.00 | 36000.00 |
|  2 | Mar?a  | 3675.00 | 44100.00 |
|  3 | Pedro  | 3200.00 | 38400.00 |
+----+--------+---------+----------+

Escribe un procedimiento almacenado que cuente y muestre el número de empleados en cada rango de salario (por ejemplo, menos de 3000, entre 3000 y 5000, más de 5000). 
El procedimiento debe tener parámetros de entrada. **/
delimiter $$

create procedure range_salary(in less_than decimal(10, 5), in more_than decimal(10, 5))
begin
declare r_salary int;
declare stoppp int default false;
declare menos_de int default 0;
declare entre int default 0;
declare mas_de int default 0;
declare curs cursor for select salario from empleados;
declare continue handler for not found set stoppp = true;

open curs;
read_loop: loop
    fetch curs into r_salary;
    if stoppp then
        leave read_loop;
    end if;
    if r_salary < less_than then
        set menos_de = menos_de + 1;
    elseif r_salary between less_than and more_than then
        set entre = entre + 1;
    else
        set mas_de = mas_de + 1;   
    end if; 
end loop;
close curs;
select menos_de, entre, mas_de;
end $$

delimiter ;

/**
mysql> call range_salary(3200, 3500); 
+----------+-------+--------+
| menos_de | entre | mas_de |
+----------+-------+--------+
|        1 |     1 |      1 |
+----------+-------+--------+
1 row in set (0.00 sec)

**/