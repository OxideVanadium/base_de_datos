/**
Se pide realizar los procedimientos y funciones:

Realice los siguientes procedimientos y funciones sobre la base de datos jardineria.

Función calcular_precio_total_pedido
Nota:Dado un código de pedido la función debe calcular la suma total del pedido. 
Tenga en cuenta que un pedido puede contener varios productos diferentes y varias cantidades de cada producto.
Parámetros de entrada: codigo_pedido (INT)
Parámetros de salida: El precio total del pedido (FLOAT) **/

delimiter $$
create function precio_total_pedido(cod_pedido int) returns float DETERMINISTIC
begin
declare precio_total float;
select sum(cantidad*precio_unidad) from detalle_pedido
where codigo_pedido=cod_pedido 
into precio_total;
return precio_total;
end$$

delimiter ;
/**
mysql> select precio_total_pedido(1);
+------------------------+
| precio_total_pedido(1) |
+------------------------+
|                   1567 |
+------------------------+

Función calcular_suma_pedidos_cliente
Nota:Dado un código de cliente la función debe calcular la suma total de todos los pedidos realizados por el cliente. Deberá hacer uso de la función calcular_precio_total_pedido que ha desarrollado en el apartado anterior.
Parámetros de entrada: codigo_cliente (INT)
Parámetros de salida: La suma total de todos los pedidos del cliente (FLOAT) **/
delimiter $$ 

create function calcular_suma_pedidos_cliente(cod_cli int) returns float DETERMINISTIC
begin
declare suma_cliente float;
select sum(dp.codigo_producto*dp.precio_unidad) from detalle_pedido as dp
join pedido as p on dp.codigo_pedido=p.cod_pedido
where p.codigo_cliente=cod_cli
into suma_cliente;
return suma_cliente;
end$$

delimiter ;

/**
select calcular_suma_pedidos_cliente(1);


Función calcular_suma_pagos_cliente
Nota:Dado un código de cliente la función debe calcular la suma total de los pagos realizados por ese cliente.
Parámetros de entrada: codigo_cliente (INT)
Parámetros de salida: La suma total de todos los pagos del cliente (FLOAT) **/

/**
Procedimiento calcular_pagos_pendientes
Nota:Deberá calcular los pagos pendientes de todos los clientes. Para saber si un cliente tiene algún pago pendiente deberemos calcular cuál es la cantidad de todos
 los pedidos y los pagos que ha realizado. Si la cantidad de los pedidos es mayor que la de los pagos entonces ese cliente tiene pagos pendientes. **/

/**
Carga de datos
Realiza la carga de la BBDD de Jardineria y describe los pasos que has realizado.
**/

source jardineria.sql;