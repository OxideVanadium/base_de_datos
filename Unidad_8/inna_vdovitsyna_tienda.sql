CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

-- Tabla de Productos
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    stock INT
);

-- Tabla de Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

-- Tabla de Ventas
CREATE TABLE IF NOT EXISTS ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Datos de ejemplo
INSERT INTO productos (nombre, precio, stock) VALUES
('Camiseta', 19.99, 50),
('Pantalón', 29.99, 30),
('Zapatos', 49.99, 20);

INSERT INTO clientes (nombre, email) VALUES
('Juan Pérez', 'juan@example.com'),
('María Gómez', 'maria@example.com'),
('Carlos López', 'carlos@example.com');

INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha) VALUES
(1, 1, 2, '2024-05-01'),
(2, 2, 1, '2024-05-02'),
(3, 3, 1, '2024-05-03');


-- Crea un procedimiento que permita añadir datos aleatorios, en la tabla productos o clientes.
delimiter $$

create procedure client_insert(in iter int, in r_name varchar(100), in domen varchar(30))
begin 
declare n_iter int default 0;
declare s_name varchar(100);

while n_iter < iter do
    set s_name = concat(r_name, substring_index(UUID(), '-', 1));
    insert into clientes(nombre, email)
    values(s_name, concat(s_name, '@', domen));
    set n_iter = n_iter + 1;
end while; 
end $$

delimiter ;

call client_insert(10, 'nnnaaaaameeee', 'sjkha.org'); /**
+----+-----------------------+---------------------------------+
| id | nombre                | email                           |
+----+-----------------------+---------------------------------+
|  1 | Juan Pérez            | juan@example.com                |
|  2 | María Gómez           | maria@example.com               |
|  3 | Carlos López          | carlos@example.com              |
|  4 | Juan Pérez            | juan@example.com                |
|  5 | María Gómez           | maria@example.com               |
|  6 | Carlos López          | carlos@example.com              |
|  7 | nnnaaaaameeee23fbaddf | nnnaaaaameeee23fbaddf@sjkha.org |
|  8 | nnnaaaaameeee23fdd56e | nnnaaaaameeee23fdd56e@sjkha.org |
|  9 | nnnaaaaameeee23fefe6e | nnnaaaaameeee23fefe6e@sjkha.org |
| 10 | nnnaaaaameeee23ffc6a7 | nnnaaaaameeee23ffc6a7@sjkha.org |
| 11 | nnnaaaaameeee240055ec | nnnaaaaameeee240055ec@sjkha.org |
| 12 | nnnaaaaameeee2400d5ae | nnnaaaaameeee2400d5ae@sjkha.org |
| 13 | nnnaaaaameeee24016251 | nnnaaaaameeee24016251@sjkha.org |
| 14 | nnnaaaaameeee2401e7b0 | nnnaaaaameeee2401e7b0@sjkha.org |
| 15 | nnnaaaaameeee240282cc | nnnaaaaameeee240282cc@sjkha.org |
| 16 | nnnaaaaameeee240306ec | nnnaaaaameeee240306ec@sjkha.org |
+----+-----------------------+---------------------------------+

-- Crea un procedimiento que permita actualizar el número de elementos  de un producto, teniendo como parámetros de entrada el id del producto,  y la cantidad de elementos a restar del producto.
**/
delimiter $$

create procedure act_product(in p_id int, in p_num int)
begin
    update productos
    set stock = stock - p_num
    where id = p_id;
end $$

delimiter ;
/**
+----+-----------+--------+-------+
| id | nombre    | precio | stock |
+----+-----------+--------+-------+
|  1 | Camiseta  |  19.99 |    50 |
+----+-----------+--------+-------+

call act_product(1, 5);

+----+----------+--------+-------+
| id | nombre   | precio | stock |
+----+----------+--------+-------+
|  1 | Camiseta |  19.99 |    45 |
+----+----------+--------+-------+

-- Crea un trigger que actualice la tabla de productos cuando se realice una venta, restando de un producto (id_producto) el número de elementos que se debe de restar (cantidad). **/
delimiter $$

create trigger actu_product
after insert on ventas
for each row
begin
    update productos 
    set stock = stock - new.cantidad
    where id = new.producto_id;
end; $$

delimiter $$
/**
select * from productos where id=1;

+----+----------+--------+-------+
| id | nombre   | precio | stock |
+----+----------+--------+-------+
|  1 | Camiseta |  19.99 |    45 |
+----+----------+--------+-------+

insert into ventas(cliente_id, producto_id, cantidad, fecha) VALUES
(1, 1, 5, '2024-05-01');

select * from productos where id=1;

+----+----------+--------+-------+
| id | nombre   | precio | stock |
+----+----------+--------+-------+
|  1 | Camiseta |  19.99 |    40 |
+----+----------+--------+-------+

-- Crea una función que calcule el total de las ventas de un cliente. **/
delimiter $$

create function client_total(c_id int) returns decimal(10, 2) deterministic
begin
declare sstop int default 0;
declare p_id int;
declare cant int;
declare total decimal(10, 2) default 0;
declare price decimal(10, 2);
declare curs cursor for select producto_id, cantidad from ventas where cliente_id=c_id;
declare continue handler for not found set sstop=1;

open curs;
nnn: loop
fetch curs into p_id, cant;
    if sstop then
        leave nnn;
    end if;

    select precio from productos where id=p_id into price;
    set total = total + price*cant;
end loop;
close curs;
return total; 
end $$

delimiter ;

select client_total(1);

/**
+-----------------+
| client_total(1) |
+-----------------+
|          179.91 |
+-----------------+

-- Crea una función que calcule la cantidad de productos en stock de un producto (producto_id). **/
delimiter $$

create function tot_prod(p_id int) returns int deterministic
begin

declare tot DECIMAL(10, 2);
select round(stock * precio, 2) from productos
where id=p_id
into tot;
return tot;

end $$

delimiter ;

select tot_prod(1); /**

+-------------+
| tot_prod(1) |
+-------------+
|         800 |
+-------------+