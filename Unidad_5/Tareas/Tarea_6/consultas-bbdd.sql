-- Obtener todos los clientes.
select * from Clientes;
/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 20 │ Antonio Jiménez │ antonio@example.com       │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos
select sum(cantidad) as cantidad_total from Pedidos;
/**
┌────────────────┐
│ cantidad_total │
├────────────────┤
│ 54             │
└────────────────┘
**/

-- Obtener el precio promedio de los productos:
select avg(precio) as promedio from Productos;
/**
┌──────────────────┐
│     promedio     │
├──────────────────┤
│ 188.294285714286 │
└──────────────────┘
**/

-- Obtener los clientes que tienen un email válido (contiene '@'):
select * from Clientes where email regexp '@';
/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 20 │ Antonio Jiménez │ antonio@example.com       │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener el producto más caro.
select max(precio) as mas_caro from Productos;
/**
┌──────────┐
│ mas_caro │
├──────────┤
│ 1200.0   │
└──────────┘
**/

-- Obtener los pedidos realizados en febrero de 2024.
select * from Pedidos where fecha_pedido regexp '^2024-02';
/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 1         │ 1          │ 1           │ 2        │ 2024-02-01   │
│ 2         │ 2          │ 2           │ 1        │ 2024-02-02   │
│ 3         │ 3          │ 3           │ 3        │ 2024-02-03   │
│ 4         │ 4          │ 4           │ 1        │ 2024-02-04   │
│ 5         │ 5          │ 5           │ 2        │ 2024-02-05   │
│ 6         │ 6          │ 6           │ 1        │ 2024-02-06   │
│ 7         │ 7          │ 7           │ 3        │ 2024-02-07   │
│ 8         │ 8          │ 8           │ 2        │ 2024-02-08   │
│ 9         │ 9          │ 9           │ 1        │ 2024-02-09   │
│ 10        │ 10         │ 10          │ 2        │ 2024-02-10   │
│ 11        │ 11         │ 11          │ 1        │ 2024-02-11   │
│ 12        │ 12         │ 12          │ 3        │ 2024-02-12   │
│ 13        │ 13         │ 13          │ 1        │ 2024-02-13   │
│ 14        │ 14         │ 14          │ 2        │ 2024-02-14   │
│ 15        │ 15         │ 15          │ 1        │ 2024-02-15   │
│ 16        │ 16         │ 16          │ 3        │ 2024-02-16   │
│ 17        │ 17         │ 17          │ 2        │ 2024-02-17   │
│ 18        │ 18         │ 18          │ 1        │ 2024-02-18   │
│ 19        │ 19         │ 19          │ 2        │ 2024-02-19   │
│ 20        │ 20         │ 20          │ 1        │ 2024-02-20   │
│ 21        │ 21         │ 21          │ 3        │ 2024-02-21   │
│ 22        │ 22         │ 22          │ 1        │ 2024-02-22   │
│ 23        │ 23         │ 23          │ 2        │ 2024-02-23   │
│ 24        │ 24         │ 24          │ 1        │ 2024-02-24   │
│ 25        │ 25         │ 25          │ 3        │ 2024-02-25   │
│ 26        │ 26         │ 26          │ 2        │ 2024-02-26   │
│ 27        │ 27         │ 27          │ 1        │ 2024-02-27   │
│ 28        │ 28         │ 28          │ 2        │ 2024-02-28   │
│ 29        │ 29         │ 29          │ 1        │ 2024-02-29   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/
-- Obtener la cantidad total de productos en todos los pedidos por producto.
select pr.*, sum(pe.cantidad) as cantidad_total from Pedidos as pe, Productos as pr
where pr.id=pe.id_producto
group by pe.id_producto;
/**
┌────┬───────────────────────────────────┬────────┬────────────────┐
│ id │              nombre               │ precio │ cantidad_total │
├────┼───────────────────────────────────┼────────┼────────────────┤
│ 1  │ Laptop                            │ 1200.0 │ 2              │
│ 2  │ Smartphone                        │ 699.99 │ 1              │
│ 3  │ TV LED                            │ 799.5  │ 3              │
│ 4  │ Tablet                            │ 299.99 │ 1              │
│ 5  │ Auriculares Bluetooth             │ 79.99  │ 2              │
│ 6  │ Impresora                         │ 199.99 │ 1              │
│ 7  │ Cámara Digital                    │ 499.99 │ 3              │
│ 8  │ Reproductor de Audio              │ 149.99 │ 2              │
│ 9  │ Altavoces Inalámbricos            │ 129.99 │ 1              │
│ 10 │ Reloj Inteligente                 │ 249.99 │ 2              │
│ 11 │ Teclado Inalámbrico               │ 59.99  │ 1              │
│ 12 │ Ratón Óptico                      │ 29.99  │ 3              │
│ 13 │ Monitor LED                       │ 349.99 │ 1              │
│ 14 │ Mochila para Portátil             │ 49.99  │ 2              │
│ 15 │ Disco Duro Externo                │ 89.99  │ 1              │
│ 16 │ Router Wi-Fi                      │ 69.99  │ 3              │
│ 17 │ Lámpara LED                       │ 39.99  │ 2              │
│ 18 │ Batería Externa                   │ 19.99  │ 1              │
│ 19 │ Estuche para Auriculares          │ 14.99  │ 2              │
│ 20 │ Tarjeta de Memoria                │ 24.99  │ 1              │
│ 21 │ Cargador Inalámbrico              │ 34.99  │ 3              │
│ 22 │ Kit de Limpieza para Computadoras │ 9.99   │ 1              │
│ 23 │ Funda para Tablet                 │ 19.99  │ 2              │
│ 24 │ Soporte para Teléfono             │ 14.99  │ 1              │
│ 25 │ Hub USB                           │ 29.99  │ 3              │
│ 26 │ Webcam HD                         │ 59.99  │ 2              │
│ 27 │ Funda para Laptop                 │ 29.99  │ 1              │
│ 28 │ Adaptador HDMI                    │ 12.99  │ 2              │
└────┴───────────────────────────────────┴────────┴────────────────┘
**/

-- Obtener los clientes que han realizado más de un pedido.

-- Obtener los productos que tienen un precio registrado.
select * from Productos where precio is not null;
/**
┌────┬───────────────────────────────────┬────────┐
│ id │              nombre               │ precio │
├────┼───────────────────────────────────┼────────┤
│ 1  │ Laptop                            │ 1200.0 │
│ 2  │ Smartphone                        │ 699.99 │
│ 3  │ TV LED                            │ 799.5  │
│ 4  │ Tablet                            │ 299.99 │
│ 5  │ Auriculares Bluetooth             │ 79.99  │
│ 6  │ Impresora                         │ 199.99 │
│ 7  │ Cámara Digital                    │ 499.99 │
│ 8  │ Reproductor de Audio              │ 149.99 │
│ 9  │ Altavoces Inalámbricos            │ 129.99 │
│ 10 │ Reloj Inteligente                 │ 249.99 │
│ 11 │ Teclado Inalámbrico               │ 59.99  │
│ 12 │ Ratón Óptico                      │ 29.99  │
│ 13 │ Monitor LED                       │ 349.99 │
│ 14 │ Mochila para Portátil             │ 49.99  │
│ 15 │ Disco Duro Externo                │ 89.99  │
│ 16 │ Router Wi-Fi                      │ 69.99  │
│ 17 │ Lámpara LED                       │ 39.99  │
│ 18 │ Batería Externa                   │ 19.99  │
│ 19 │ Estuche para Auriculares          │ 14.99  │
│ 20 │ Tarjeta de Memoria                │ 24.99  │
│ 21 │ Cargador Inalámbrico              │ 34.99  │
│ 22 │ Kit de Limpieza para Computadoras │ 9.99   │
│ 23 │ Funda para Tablet                 │ 19.99  │
│ 24 │ Soporte para Teléfono             │ 14.99  │
│ 25 │ Hub USB                           │ 29.99  │
│ 26 │ Webcam HD                         │ 59.99  │
│ 27 │ Funda para Laptop                 │ 29.99  │
│ 28 │ Adaptador HDMI                    │ 12.99  │
└────┴───────────────────────────────────┴────────┘
**/
-- Obtener la fecha del primer pedido realizado:
select * from pedidos
order by fecha_pedido asc limit 1;
/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 1         │ 1          │ 1           │ 2        │ 2024-02-01   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/
-- Obtener los productos cuyos nombres comienzan con 'A' o 'B':
select * from Productos where nombre regexp '^[A|B]';
/**
┌────┬────────────────────────┬────────┐
│ id │         nombre         │ precio │
├────┼────────────────────────┼────────┤
│ 5  │ Auriculares Bluetooth  │ 79.99  │
│ 9  │ Altavoces Inalámbricos │ 129.99 │
│ 18 │ Batería Externa        │ 19.99  │
│ 28 │ Adaptador HDMI         │ 12.99  │
└────┴────────────────────────┴────────┘
**/
-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.


-- Obtener los clientes que han realizado más de un pedido en febrero de 2024.

-- Obtener los productos con precio entre 100 y 500.
select * from Productos where precio between 100 and 500;
/**
┌────┬────────────────────────┬────────┐
│ id │         nombre         │ precio │
├────┼────────────────────────┼────────┤
│ 4  │ Tablet                 │ 299.99 │
│ 6  │ Impresora              │ 199.99 │
│ 7  │ Cámara Digital         │ 499.99 │
│ 8  │ Reproductor de Audio   │ 149.99 │
│ 9  │ Altavoces Inalámbricos │ 129.99 │
│ 10 │ Reloj Inteligente      │ 249.99 │
│ 13 │ Monitor LED            │ 349.99 │
└────┴────────────────────────┴────────┘
**/

-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.

-- Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.
select * from Clientes where nombre regexp 'a';
/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 11 │ Sofía Ruiz      │ sofia@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/
-- Obtener el precio máximo de los productos.
select max(precio) as maximo from Productos;
/**
┌────────┐
│ maximo │
├────────┤
│ 1200.0 │
└────────┘
**/
-- Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.
select * from pedidos 
where id_cliente=1 and fecha_pedido='2024-02-01';
/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 1         │ 1          │ 1           │ 2        │ 2024-02-01   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/
-- Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.

-- Obtener los productos que no tienen un precio registrado.
select * from Productos where precio is null;
/**
sqlite> select * from Productos where precio is null;
sqlite> 
**/
-- Obtener la fecha del último pedido realizado.
select * from Pedidos
order by fecha_pedido desc limit 1;
/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 30        │ 30         │ 30          │ 3        │ 2024-03-01   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/
-- Obtener los clientes cuyo nombre tiene al menos 5 caracteres.
select * from Clientes where nombre regexp '\w{5,}';
/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 3  │ Carlos López    │ carlos@example.com        │
│ 5  │ Luisa Martínez  │ luisa@example.com         │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 8  │ Miguel Martín   │ miguel@example.com        │
│ 9  │ Elena González  │ elena@example.com         │
│ 10 │ David Torres    │ david@example.com         │
│ 12 │ Javier López    │ javier@example.com        │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 14 │ Daniel Muñoz    │ daniel@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 18 │ Francisco Mora  │ francisco@example.com     │
│ 19 │ Marina Díaz     │ marina@example.com        │
│ 20 │ Antonio Jiménez │ antonio@example.com       │
│ 21 │ Beatriz Romero  │ beatriz@example.com       │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 26 │ Mario Serrano   │ mario@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
│ 28 │ Roberto Ruiz    │ roberto@example.com       │
│ 29 │ Celia García    │ celia@example.com         │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.
select * from Productos where nombre regexp 'o';
/**
┌────┬───────────────────────────────────┬────────┐
│ id │              nombre               │ precio │
├────┼───────────────────────────────────┼────────┤
│ 1  │ Laptop                            │ 1200.0 │
│ 2  │ Smartphone                        │ 699.99 │
│ 5  │ Auriculares Bluetooth             │ 79.99  │
│ 6  │ Impresora                         │ 199.99 │
│ 8  │ Reproductor de Audio              │ 149.99 │
│ 9  │ Altavoces Inalámbricos            │ 129.99 │
│ 10 │ Reloj Inteligente                 │ 249.99 │
│ 11 │ Teclado Inalámbrico               │ 59.99  │
│ 12 │ Ratón Óptico                      │ 29.99  │
│ 13 │ Monitor LED                       │ 349.99 │
│ 14 │ Mochila para Portátil             │ 49.99  │
│ 15 │ Disco Duro Externo                │ 89.99  │
│ 16 │ Router Wi-Fi                      │ 69.99  │
│ 20 │ Tarjeta de Memoria                │ 24.99  │
│ 21 │ Cargador Inalámbrico              │ 34.99  │
│ 22 │ Kit de Limpieza para Computadoras │ 9.99   │
│ 24 │ Soporte para Teléfono             │ 14.99  │
│ 27 │ Funda para Laptop                 │ 29.99  │
│ 28 │ Adaptador HDMI                    │ 12.99  │
└────┴───────────────────────────────────┴────────┘
**/
-- Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.

-- Obtener los clientes cuyos nombres no contienen la letra 'i':
select * from Clientes where nombre not regexp 'i';
/**
┌────┬─────────────────┬───────────────────────────┐
│ id │     nombre      │           email           │
├────┼─────────────────┼───────────────────────────┤
│ 1  │ Juan Pérez      │ juan@example.com          │
│ 2  │ María Gómez     │ maria@example.com         │
│ 3  │ Carlos López    │ carlos@example.com        │
│ 4  │ Ana Rodríguez   │ ana@example.com           │
│ 6  │ Pedro Sánchez   │ pedro@example.com         │
│ 7  │ Laura García    │ laura@example.com         │
│ 9  │ Elena González  │ elena@example.com         │
│ 13 │ Carmen Vargas   │ carmen@example.com        │
│ 15 │ Isabel Serrano  │ isabel@example.com        │
│ 16 │ Alejandro Muñoz │ alejandro@example.com     │
│ 17 │ Raquel Herrera  │ raquel@example.com        │
│ 22 │ Carlos Gómez    │ carlos.gomez@example.com  │
│ 23 │ Clara Sánchez   │ clara.sanchez@example.com │
│ 24 │ Andrés Martínez │ andres@example.com        │
│ 25 │ Lucía Díaz      │ lucia@example.com         │
│ 27 │ Eva Torres      │ eva.torres@example.com    │
└────┴─────────────────┴───────────────────────────┘
**/

-- Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.
select * from Pedidos 
where id_cliente=2 and fecha_pedido='2024-02-02';
/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 2         │ 2          │ 2           │ 1        │ 2024-02-02   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/

-- Obtener el precio mínimo de los productos.
select min(precio) as minimo from Productos;
/**
┌────────┐
│ minimo │
├────────┤
│ 9.99   │
└────────┘
**/

-- Obtener los clientes que han realizado al menos un pedido en febrero de 2024.

-- Obtener la fecha del último pedido realizado por el cliente con ID 3.
select * from Pedidos 
where id_cliente=3
order by fecha_pedido limit 1;
/**
┌───────────┬────────────┬─────────────┬──────────┬──────────────┐
│ id_pedido │ id_cliente │ id_producto │ cantidad │ fecha_pedido │
├───────────┼────────────┼─────────────┼──────────┼──────────────┤
│ 3         │ 3          │ 3           │ 3        │ 2024-02-03   │
└───────────┴────────────┴─────────────┴──────────┴──────────────┘
**/
-- Obtener los productos que tienen una 'a' al final del nombre.
select * from Clientes where nombre regexp 'a$';
/**
┌────┬────────────────┬───────────────────────┐
│ id │     nombre     │         email         │
├────┼────────────────┼───────────────────────┤
│ 7  │ Laura García   │ laura@example.com     │
│ 17 │ Raquel Herrera │ raquel@example.com    │
│ 18 │ Francisco Mora │ francisco@example.com │
│ 29 │ Celia García   │ celia@example.com     │
└────┴────────────────┴───────────────────────┘
**/
-- Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).

-- Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.
select * from Productos where precio regexp '\d{4,}.';
/**
┌────┬────────┬────────┐
│ id │ nombre │ precio │
├────┼────────┼────────┤
│ 1  │ Laptop │ 1200.0 │
└────┴────────┴────────┘
**/

-- Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.
select * from Clientes where nombre regexp 'ae';
/**
sqlite> select * from Clientes where nombre regexp 'ae';
sqlite> 
**/
-- Obtener los productos cuyos nombres terminan con una consonante.
select * from Productos where nombre not regexp '[euioa]$';
/**
┌────┬───────────────────────────────────┬────────┐
│ id │              nombre               │ precio │
├────┼───────────────────────────────────┼────────┤
│ 1  │ Laptop                            │ 1200.0 │
│ 3  │ TV LED                            │ 799.5  │
│ 4  │ Tablet                            │ 299.99 │
│ 5  │ Auriculares Bluetooth             │ 79.99  │
│ 7  │ Cámara Digital                    │ 499.99 │
│ 9  │ Altavoces Inalámbricos            │ 129.99 │
│ 13 │ Monitor LED                       │ 349.99 │
│ 14 │ Mochila para Portátil             │ 49.99  │
│ 17 │ Lámpara LED                       │ 39.99  │
│ 19 │ Estuche para Auriculares          │ 14.99  │
│ 22 │ Kit de Limpieza para Computadoras │ 9.99   │
│ 23 │ Funda para Tablet                 │ 19.99  │
│ 25 │ Hub USB                           │ 29.99  │
│ 26 │ Webcam HD                         │ 59.99  │
│ 27 │ Funda para Laptop                 │ 29.99  │
│ 28 │ Adaptador HDMI                    │ 12.99  │
**/
-- Obtener los productos cuyos nombres empiezan con una vocal.
select * from Productos where nombre regexp '^[EUIOAeuioa]';
/**
┌────┬──────────────────────────┬────────┐
│ id │          nombre          │ precio │
├────┼──────────────────────────┼────────┤
│ 5  │ Auriculares Bluetooth    │ 79.99  │
│ 6  │ Impresora                │ 199.99 │
│ 9  │ Altavoces Inalámbricos   │ 129.99 │
│ 19 │ Estuche para Auriculares │ 14.99  │
│ 28 │ Adaptador HDMI           │ 12.99  │
└────┴──────────────────────────┴────────┘
**/