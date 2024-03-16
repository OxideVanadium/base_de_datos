-- Completa aquello que falte
create database if not exists ordenes;
use ordenes;

CREATE TABLE if not exists clientes (
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    ciudad_cliente VARCHAR(100)
);

CREATE TABLE if not exists ordenes (
    id_orden INT PRIMARY KEY,
    id_cliente INT,
    fecha_orden DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE if not exists productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio_producto DECIMAL(10, 2)
);

CREATE TABLE if not exists detalles_ordenes (
    id_detalle INT PRIMARY KEY,
    id_orden INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO clientes (id_cliente, nombre_cliente, ciudad_cliente) VALUES
(1, 'Juan', 'Ciudad A'),
(2, 'María', 'Ciudad B'),
(3, 'Pedro', 'Ciudad C');

INSERT INTO ordenes (id_orden, id_cliente, fecha_orden) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-02'),
(3, 3, '2024-03-03');

INSERT INTO productos (id_producto, nombre_producto, precio_producto) VALUES
(1, 'Producto A', 50.00),
(2, 'Producto B', 75.00),
(3, 'Producto C', 100.00);

INSERT INTO detalles_ordenes (id_detalle, id_orden, id_producto, cantidad) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3);

/**
Realiza las siguientes consultas:

Mostrar todos los clientes. **/
select * from clientes;
/**
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
Mostrar todas las órdenes. **/
select * from ordenes;
/**
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
|        2 |          2 | 2024-03-02  |
|        3 |          3 | 2024-03-03  |
+----------+------------+-------------+
Mostrar todos los productos. **/
select * from productos;
/**
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           1 | Producto A      |           50.00 |
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+
Mostrar todos los detalles de las órdenes. **/
select * from detalles_ordenes;
/**
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          1 |        1 |           1 |        2 |
|          2 |        2 |           2 |        1 |
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+
Mostrar los primeros 5 clientes ordenados por nombre. **/
select * from clientes
order by nombre_cliente 
limit 5;
/**
+------------+----------------+----------------+
| id_cliente | nombre_cliente | ciudad_cliente |
+------------+----------------+----------------+
|          1 | Juan           | Ciudad A       |
|          2 | María          | Ciudad B       |
|          3 | Pedro          | Ciudad C       |
+------------+----------------+----------------+
Mostrar los productos con un precio mayor a 50. **/
select * from productos 
where precio_producto > 50;
/**
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           2 | Producto B      |           75.00 |
|           3 | Producto C      |          100.00 |
+-------------+-----------------+-----------------+
Mostrar todas las órdenes realizadas por el cliente con ID 1. **/
select * from ordenes 
where id_cliente=1;
/**
+----------+------------+-------------+
| id_orden | id_cliente | fecha_orden |
+----------+------------+-------------+
|        1 |          1 | 2024-03-01  |
+----------+------------+-------------+
Mostrar los clientes cuyos nombres comienzan con la letra "A". **/
select * from clientes
where nombre_cliente regexp '^A';
/**
Mostrar las órdenes que contienen más de 2 productos. **/
select * from detalles_ordenes 
where cantidad>2;
/**
+------------+----------+-------------+----------+
| id_detalle | id_orden | id_producto | cantidad |
+------------+----------+-------------+----------+
|          3 |        3 |           3 |        3 |
+------------+----------+-------------+----------+
Mostrar los productos ordenados por precio de forma descendente. **/
select * from productos 
order by precio_producto desc;
/**
+-------------+-----------------+-----------------+
| id_producto | nombre_producto | precio_producto |
+-------------+-----------------+-----------------+
|           3 | Producto C      |          100.00 |
|           2 | Producto B      |           75.00 |
|           1 | Producto A      |           50.00 |
+-------------+-----------------+-----------------+
Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes. **/
select c.*, o.* from clientes as c 
left join ordenes as o on c.id_cliente=o.id_cliente;
/**
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
Seleccionar todas las órdenes junto con los productos correspondientes. **/
select o.*, p.* from detalles_ordenes as o 
join productos as p on p.id_producto=o.id_producto;
/**
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | id_producto | nombre_producto | precio_producto |
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
|          1 |        1 |           1 |        2 |           1 | Producto A      |           50.00 |
|          2 |        2 |           2 |        1 |           2 | Producto B      |           75.00 |
|          3 |        3 |           3 |        3 |           3 | Producto C      |          100.00 |
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50. **/
select c.nombre_cliente from clientes as c 
join ordenes as o on o.id_cliente=c.id_cliente 
join detalles_ordenes as do on do.id_orden=o.id_orden 
join productos as p on p.id_producto=do.id_producto
where p.precio_producto>50;
/**
+----------------+
| nombre_cliente |
+----------------+
| María          |
| Pedro          |
+----------------+
Obtener el nombre de los productos que no se han ordenado aún. **/
select p.nombre_producto from productos as p 
left join detalles_ordenes as do on do.id_producto=p.id_producto 
where do.id_orden is null;
/**
Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes. **/
select c.nombre_cliente, p.*, do.cantidad from clientes as c 
join ordenes as o on o.id_cliente=c.id_cliente
join detalles_ordenes as do on do.id_orden=o.id_orden 
join productos as p on p.id_producto=do.id_producto;
/**
+----------------+-------------+-----------------+-----------------+----------+
| nombre_cliente | id_producto | nombre_producto | precio_producto | cantidad |
+----------------+-------------+-----------------+-----------------+----------+
| Juan           |           1 | Producto A      |           50.00 |        2 |
| María          |           2 | Producto B      |           75.00 |        1 |
| Pedro          |           3 | Producto C      |          100.00 |        3 |
| Juan           |           1 | Producto A      |           50.00 |        2 |
+----------------+-------------+-----------------+-----------------+----------+
Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos. **/
select p.nombre_producto, c.nombre_cliente from productos as p 
join detalles_ordenes as do on do.id_producto=p.id_producto
join ordenes as o on o.id_orden=do.id_orden
join clientes as c on c.id_cliente=o.id_cliente;
/**
+-----------------+----------------+
| nombre_producto | nombre_cliente |
+-----------------+----------------+
| Producto A      | Juan           |
| Producto B      | María          |
| Producto C      | Pedro          |
+-----------------+----------------+
Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes. **/
select c.*, o.*, p.* from clientes as c 
left join ordenes as o on o.id_cliente=c.id_cliente
join detalles_ordenes as do on do.id_orden=o.id_orden
join productos as p on p.id_producto=do.id_producto;
/**
+------------+----------------+----------------+----------+------------+-------------+-------------+-----------------+-----------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden | id_producto | nombre_producto | precio_producto |
+------------+----------------+----------------+----------+------------+-------------+-------------+-----------------+-----------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |           1 | Producto A      |           50.00 |
|          2 | Mar├нa         | Ciudad B       |        2 |          2 | 2024-03-02  |           2 | Producto B      |           75.00 |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |           3 | Producto C      |          100.00 |
+------------+----------------+----------------+----------+------------+-------------+-------------+-----------------+-----------------+
Obtener el nombre de los clientes junto con el número total de órdenes que han realizado. **/
select c.nombre_cliente, count(o.id_orden) as num from clientes as c 
left join ordenes as o on o.id_cliente=c.id_cliente
group by c.id_cliente;
/**
+----------------+-----+
| nombre_cliente | num |
+----------------+-----+
| Juan           |   1 |
| María          |   1 |
| Pedro          |   1 |
+----------------+-----+
Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto. **/
select o.*, c.nombre_cliente, p.nombre_producto from ordenes as o 
join clientes as c on c.id_cliente=o.id_cliente
join detalles_ordenes as do on do.id_orden=o.id_orden 
join productos as p on do.id_producto=p.id_producto;
/**
+----------+------------+-------------+----------------+-----------------+
| id_orden | id_cliente | fecha_orden | nombre_cliente | nombre_producto |
+----------+------------+-------------+----------------+-----------------+
|        1 |          1 | 2024-03-01  | Juan           | Producto A      |
|        2 |          2 | 2024-03-02  | María          | Producto B      |
|        3 |          3 | 2024-03-03  | Pedro          | Producto C      |
+----------+------------+-------------+----------------+-----------------+
Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente. **/
select o.*, p.*, c.* from ordenes as o 
left join clientes as c on c.id_cliente=o.id_cliente
join detalles_ordenes as do on do.id_orden=o.id_orden
join productos as p on p.id_producto=do.id_producto;
/**
+----------+------------+-------------+----------------+-----------------+
| id_orden | id_cliente | fecha_orden | nombre_cliente | nombre_producto |
+----------+------------+-------------+----------------+-----------------+
|        1 |          1 | 2024-03-01  | Juan           | Producto A      |
|        2 |          2 | 2024-03-02  | María          | Producto B      |
|        3 |          3 | 2024-03-03  | Pedro          | Producto C      |
+----------+------------+-------------+----------------+-----------------+
Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados. **/
select o.*, c.nombre_cliente, p.nombre_producto from ordenes as o 
join clientes as c on c.id_cliente=o.id_cliente
join detalles_ordenes as do on do.id_orden=o.id_orden 
right join productos as p on do.id_producto=p.id_producto;
/**
+----------+------------+-------------+----------------+-----------------+
| id_orden | id_cliente | fecha_orden | nombre_cliente | nombre_producto |
+----------+------------+-------------+----------------+-----------------+
|        1 |          1 | 2024-03-01  | Juan           | Producto A      |
|        2 |          2 | 2024-03-02  | María          | Producto B      |
|        3 |          3 | 2024-03-03  | Pedro          | Producto C      |
+----------+------------+-------------+----------------+-----------------+
Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos. **/
select o.*, c.nombre_cliente, p.nombre_producto from ordenes as o 
join clientes as c on c.id_cliente=o.id_cliente
join detalles_ordenes as do on do.id_orden=o.id_orden 
left join productos as p on do.id_producto=p.id_producto;
/**
+----------+------------+-------------+----------------+-----------------+
| id_orden | id_cliente | fecha_orden | nombre_cliente | nombre_producto |
+----------+------------+-------------+----------------+-----------------+
|        1 |          1 | 2024-03-01  | Juan           | Producto A      |
|        2 |          2 | 2024-03-02  | María          | Producto B      |
|        3 |          3 | 2024-03-03  | Pedro          | Producto C      |
+----------+------------+-------------+----------------+-----------------+
Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes. **/
select c.nombre_cliente, count(o.id_orden) as num from clientes as c 
left join ordenes as o on c.id_cliente=o.id_cliente 
group by c.id_cliente;
/**
+----------------+-----+
| nombre_cliente | num |
+----------------+-----+
| Juan           |   1 |
| María          |   1 |
| Pedro          |   1 |
+----------------+-----+
Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información. **/
select o.*, c.*, p.* from clientes as c 
right join ordenes as o on o.id_cliente=c.id_cliente
join detalles_ordenes as do on do.id_orden=o.id_orden
right join productos as p on p.id_producto=do.id_producto;
/**
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+
| id_orden | id_cliente | fecha_orden | id_cliente | nombre_cliente | ciudad_cliente | id_producto | nombre_producto | precio_producto |
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+
|        1 |          1 | 2024-03-01  |          1 | Juan           | Ciudad A       |           1 | Producto A      |           50.00 |
|        2 |          2 | 2024-03-02  |          2 | Mar├нa         | Ciudad B       |           2 | Producto B      |           75.00 |
|        3 |          3 | 2024-03-03  |          3 | Pedro          | Ciudad C       |           3 | Producto C      |          100.00 |
+----------+------------+-------------+------------+----------------+----------------+-------------+-----------------+-----------------+

Realizar un inner join entre clientes y órdenes. **/
select c.*, o.* from clientes as c 
join ordenes as o on o.id_cliente=c.id_cliente;
/**
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
Realizar un left join entre órdenes y detalles de órdenes. **/
select o.*, do.* from ordenes as o 
left join detalles_ordenes as do on o.id_orden=do.id_orden;
/**
+----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+
Realizar un right join entre productos y detalles de órdenes. **/
select p.*, do.* from productos as p 
right join detalles_ordenes as do on do.id_producto=p.id_producto;
/**
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
| id_producto | nombre_producto | precio_producto | id_detalle | id_orden | id_producto | cantidad |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
|           1 | Producto A      |           50.00 |          1 |        1 |           1 |        2 |
|           2 | Producto B      |           75.00 |          2 |        2 |           2 |        1 |
|           3 | Producto C      |          100.00 |          3 |        3 |           3 |        3 |
+-------------+-----------------+-----------------+------------+----------+-------------+----------+
Realizar un full join entre clientes y órdenes. **/
select c.*, o.* from clientes as c 
left join ordenes as o on o.id_cliente=c.id_cliente 
union distinct 
select c.*, o.* from clientes as c 
right join ordenes as o on o.id_cliente=c.id_cliente;
/**
+------------+----------------+----------------+----------+------------+-------------+
| id_cliente | nombre_cliente | ciudad_cliente | id_orden | id_cliente | fecha_orden |
+------------+----------------+----------------+----------+------------+-------------+
|          1 | Juan           | Ciudad A       |        1 |          1 | 2024-03-01  |
|          2 | María          | Ciudad B       |        2 |          2 | 2024-03-02  |
|          3 | Pedro          | Ciudad C       |        3 |          3 | 2024-03-03  |
+------------+----------------+----------------+----------+------------+-------------+
Realizar un full join entre órdenes y detalles de órdenes. **/
select o.*, do.* from ordenes as o 
left join detalles_ordenes as do on o.id_orden=do.id_orden
union distinct 
select o.*, do.* from ordenes as o 
right join detalles_ordenes as do on o.id_orden=do.id_orden;
/**
+----------+------------+-------------+------------+----------+-------------+----------+
| id_orden | id_cliente | fecha_orden | id_detalle | id_orden | id_producto | cantidad |
+----------+------------+-------------+------------+----------+-------------+----------+
|        1 |          1 | 2024-03-01  |          1 |        1 |           1 |        2 |
|        2 |          2 | 2024-03-02  |          2 |        2 |           2 |        1 |
|        3 |          3 | 2024-03-03  |          3 |        3 |           3 |        3 |
+----------+------------+-------------+------------+----------+-------------+----------+
Realizar un full join entre productos y detalles de órdenes. **/
select do.*, p.* from detalles_ordenes as do 
left join productos as p on do.id_producto=p.id_producto
union distinct
select do.*, p.* from detalles_ordenes as do 
right join productos as p on do.id_producto=p.id_producto;
/**
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
| id_detalle | id_orden | id_producto | cantidad | id_producto | nombre_producto | precio_producto |
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
|          1 |        1 |           1 |        2 |           1 | Producto A      |           50.00 |
|          2 |        2 |           2 |        1 |           2 | Producto B      |           75.00 |
|          3 |        3 |           3 |        3 |           3 | Producto C      |          100.00 |
+------------+----------+-------------+----------+-------------+-----------------+-----------------+
