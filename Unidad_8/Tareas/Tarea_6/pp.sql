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
Dado el procedimiento base:

DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop(5);

Y las funciones descritas en aleatoriedad, realiza los siguientes procedimientos, que realicen las siguietes operaciones:

Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND(). **/

DELIMITER //

CREATE PROCEDURE my_loop_1(IN iterations INT, in name_variant varchar(100), in factor decimal(2, 2), in base decimal(10, 5))
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        insert into empleados(nombre, salario)
        values(concat(name_variant, rand()), base * (factor + rand()*(1-factor)));
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop_1(5, 'pp', 0.5, 2000);

/**
mysql> select * from empleados;
+----+-----------------------+---------+
| id | nombre                | salario |
+----+-----------------------+---------+
|  1 | Juan                  | 3000.00 |
|  2 | María                 | 3500.00 |
|  3 | Pedro                 | 3200.00 |
|  4 | pp0.5147575796719246  | 1738.33 |
|  5 | pp0.14736481583431812 | 1521.84 |
|  6 | pp0.16711356040752826 | 1270.04 |
|  7 | pp0.8488745818369785  | 1434.24 |
|  8 | pp0.6245952878376425  | 1820.25 |
+----+-----------------------+---------+


Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función UUID(). **/

DELIMITER //

CREATE PROCEDURE my_loop_2(IN iterations INT, in name_var VARCHAR(100), in salary_base decimal(10,5), in factor decimal(2, 2))
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        insert into empleados(nombre, salario)
        values(concat(name_var, SUBSTRING_INDEX(UUID(), '-', -1)), salary_base * (factor + rand() * (1-factor)));
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

call my_loop_2(3, 'user', 1500, 0.7);
/**



Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND(). **/

DELIMITER //

CREATE PROCEDURE my_loop_3(IN iterations INT, in salary_base decimal(10,5), in factor decimal(2, 2))
BEGIN
    DECLARE counter INT DEFAULT 0;
    declare r_name varchar(100);
    declare nums int;

    WHILE counter < iterations DO
        set r_name=(select nombre from empleados order by rand() limit 1);
        insert into empleados(nombre, salario)
        values(r_name, salary_base * (factor + rand() * (1-factor)));
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

call my_loop_3(2, 2000, 0.5);

/**


Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1). **/
DELIMITER //

CREATE PROCEDURE my_loop_4(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

/**


Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.


Crea cada uno de los procedimientos, maximixando el número de parámetros de entrada necesarios, por ejemplo: _nombre, salario, e id.

Crea el procedimiento, la invocación, y el estado de la tabla después de la invocación de este.
