/**
En este ejercicio, vamos a trabajar en la creación de una base de datos simple utilizando MySQL. 
Esta base de datos estará diseñada para administrar información de usuarios y productos. 
Una vez que hayamos creado la base de datos y las tablas necesarias, vamos a implementar procedimientos 
almacenados y funciones para realizar operaciones comunes sobre estos datos.

Pasos:
Crea la bbdd. _ Utilizaremos comandos SQL para crear una base de datos llamada "SimpleDB" que contendrá dos tablas: 
"Users" para almacenar información de usuarios y "Products" para almacenar información de productos._ **/


    CREATE DATABASE IF NOT EXISTS SimpleDB;

    USE SimpleDB;

    CREATE TABLE IF NOT EXISTS Users (
        UserID INT AUTO_INCREMENT PRIMARY KEY,
        UserName VARCHAR(50) NOT NULL,
        Email VARCHAR(100) NOT NULL
    );

    CREATE TABLE IF NOT EXISTS Products (
        ProductID INT AUTO_INCREMENT PRIMARY KEY,
        ProductName VARCHAR(100) NOT NULL,
        Price DECIMAL(10, 2) NOT NULL
    );

/** Realiza la inserción de algunos datos de prueba. **/

INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');

INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);

/** Nota:Realizar la inserción de al menos 3 elementos más en cada tabla.

Crea procedimientos almacenados para realizar operaciones como insertar un nuevo usuario, actualizar el nombre de un usuario, etc. 
Procedimiento para insertar un nuevo usuario. **/

delimiter $$
create procedure c_insert_user(in username VARCHAR(50), in email VARCHAR(100))
begin
insert into Users(UserName, Email)
values(username, email);
end 
$$
delimiter ;
call c_insert_user('ll', 'll@ll.ll');

/**
mysql> select * from Users;
+--------+----------+-------------------+
| UserID | UserName | Email             |
+--------+----------+-------------------+
|      1 | Juan     | juan@example.com  |
|      2 | María    | maria@example.com |
|      3 | Pedro    | pedro@example.com |
|      4 | ll       | ll@ll.ll          |
+--------+----------+-------------------+

Procedimiento para actualizar el nombre de un usuario.
Nota: Realiza la invocación y la verificación de que ha funcionado correctamente. **/

delimiter $$
create procedure c_set(in o_username VARCHAR(50),in n_username VARCHAR(50))
begin
update Users
set UserName=n_username
where UserName=o_username;
end $$
delimiter ;

call c_set('ll', 'nn');
/**
mysql> select * from Users;
+--------+----------+-------------------+
| UserID | UserName | Email             |
+--------+----------+-------------------+
|      1 | Juan     | juan@example.com  |
|      2 | María    | maria@example.com |
|      3 | Pedro    | pedro@example.com |
|      4 | nn       | ll@ll.ll          |
+--------+----------+-------------------+

Implementa funciones para realizar cálculos o consultas: 
Función para calcular el precio total de un conjunto de productos.**/

delimiter $$
create function total() returns decimal(10, 2) determenistic
begin
declare suma decimal(10, 2);
select sum(Price) into suma from Products;
return suma;
end $$
delimiter ;


/**
Función para contar el número de usuarios.
Nota: Realiza la invocación y la verificación de que ha funcionado correctamente.**/
