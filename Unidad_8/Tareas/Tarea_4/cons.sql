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

Escribe un procedimiento almacenado que aumente los salarios de todos los empleados en un 5%, pero excluya a aquellos cuyo salario sea superior a 3200. **/
delimiter $$

create procedure increase_salary(in percent DECIMAL(10, 2), in s_max int)
begin
declare stoppp int default false;
declare is_id int;
declare is_salario DECIMAL(10, 2);
declare cur cursor for select id, salario from empleados;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

open cur;
read loop: loop
    fetch cur into is_id, is_salario;
    if stoppp then 
    leave read_loop;
    end if;
    update empleados set salario=salario*(1+percent/100)
    where id=is_id
    and salario=s_max;
end loop;
close cur;
end $$

delimiter ;


/**
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
|  4 | Juan   | 3000.00 |
|  5 | María  | 3500.00 |
|  6 | Pedro  | 3200.00 |
|  7 | Juan   | 3000.00 |
|  8 | María  | 3500.00 |
|  9 | Pedro  | 3200.00 |
+----+--------+---------+

El procedimiento debe tener parámetros de entrada.
Escribe un procedimiento almacenado que calcule el salario anual de cada empleado (asumiendo que trabajan todo el año) y lo imprima.
Escribe un procedimiento almacenado que cuente y muestre el número de empleados en cada rango de salario (por ejemplo, menos de 3000, entre 3000 y 5000, más de 5000). 
El procedimiento debe tener parámetros de entrada.

**/