-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
select cl.nombre, cl.edad from clientes as cl, ventas as v, coches as co 
where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche
and co.marca='Toyota';
/**
┌────────────┬──────┐
│   nombre   │ edad │
├────────────┼──────┤
│ Juan Pérez │ 30   │
└────────────┴──────┘
**/

-- Consulta para calcular el precio promedio de los coches vendidos.
select avg(precio) from coches
where id_coche in (select id_coche from ventas);
/**
┌──────────────────┐
│   avg(precio)    │
├──────────────────┤
│ 28777.7777777778 │
└──────────────────┘
**/

-- Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.
select co.modelo, co.marca from coches as co, clientes as cl, ventas as v 
where co.id_coche=v.id_coche and cl.id_cliente=v.id_cliente
and cl.edad>30;
/**
┌────────────────┬────────────┐
│     modelo     │   marca    │
├────────────────┼────────────┤
│ SUV 2023       │ Ford       │
│ Camioneta 2023 │ Nissan     │
│ Compacto 2021  │ Volkswagen │
│ Deportivo 2023 │ Mazda      │
└────────────────┴────────────┘
**/

-- Consulta para contar el número de coches vendidos de cada marca.
select count(v.id_coche) as numero, co.marca from ventas as v, coches as co 
where v.id_coche=co.id_coche
group by co.marca;
/**
┌────────┬────────────┐
│ numero │   marca    │
├────────┼────────────┤
│ 1      │ Chevrolet  │
│ 1      │ Ford       │
│ 1      │ Honda      │
│ 1      │ Hyundai    │
│ 1      │ Mazda      │
│ 1      │ Nissan     │
│ 1      │ Tesla      │
│ 1      │ Toyota     │
│ 1      │ Volkswagen │
└────────┴────────────┘
**/
-- Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.
select cl.nombre, cl.direccion from clientes as cl, reparacion as r 
where cl.id_cliente=r.id_cliente 
and fecha_reparación regexp '^2024';
/**
┌─────────────────┬────────────────┐
│     nombre      │   direccion    │
├─────────────────┼────────────────┤
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
│ Juan Pérez      │ Calle A #123   │
│ María Gómez     │ Avenida B #456 │
│ Carlos López    │ Calle C #789   │
│ Ana Martínez    │ Avenida D #101 │
│ Pedro Rodríguez │ Calle E #234   │
│ Laura Sánchez   │ Avenida F #567 │
│ Miguel González │ Calle G #890   │
│ Isabel Díaz     │ Avenida H #111 │
│ Francisco Ruiz  │ Calle I #222   │
│ Elena Torres    │ Avenida J #333 │
└─────────────────┴────────────────┘
**/

-- Consulta para calcular el total gastado en reparaciones por cada cliente.


-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.
select cl.nombre, cl.edad from clientes as cl, ventas as v, coches as co 
where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche
and co.precio>30000;
/**
┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
└─────────────────┴──────┘
**/

-- Consulta para calcular el precio medio de los coches vendidos en 2023.
select avg(co.precio) as promedio from coches as co, ventas as v 
where co.id_coche=v.id_coche 
and v.fecha_venta regexp '^2023';
/**
┌──────────────────┐
│     promedio     │
├──────────────────┤
│ 28777.7777777778 │
└──────────────────┘
**/
-- Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.
select cl.nombre, cl.direccion from clientes as cl, ventas as v, coches as co 
where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche
and co.marca='Ford';
/**
┌──────────────┬──────────────┐
│    nombre    │  direccion   │
├──────────────┼──────────────┤
│ Carlos López │ Calle C #789 │
└──────────────┴──────────────┘
**/

-- Consulta para contar el número de coches vendidos por año.
select count(*), substr(fecha_venta, 0, 5) as año from ventas
group by año;
/**
┌──────────┬──────┐
│ count(*) │ año  │
├──────────┼──────┤
│ 9        │ 2023 │
└──────────┴──────┘
**/

-- Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
select cl.nombre, cl.edad from clientes as cl, coches as co, ventas as v, reparacion as r 
where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and cl.id_cliente=r.id_cliente and co.id_coche=r.id_coche
and co.precio>30000;
/**
┌─────────────────┬──────┐
│     nombre      │ edad │
├─────────────────┼──────┤
│ Pedro Rodríguez │ 40   │
│ Isabel Díaz     │ 38   │
│ Elena Torres    │ 29   │
└─────────────────┴──────┘
**/

-- Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
select sum(co.precio) from coches as co, clientes as cl, ventas as v 
where co.id_coche=v.id_coche and cl.id_cliente=v.id_cliente
and cl.edad<30;
/**
┌────────────────┐
│ sum(co.precio) │
├────────────────┤
│ 117000.0       │
└────────────────┘
**/
--Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
select distinct co.modelo, co.año from coches as co, reparacion as r, ventas as v 
where co.id_coche=r.id_coche and co.id_coche=v.id_coche 
and v.fecha_venta regexp '^2023';
/**
┌────────────────┬──────┐
│     modelo     │ año  │
├────────────────┼──────┤
│ Sedán 2022     │ 2022 │
│ SUV 2023       │ 2023 │
│ Hatchback 2021 │ 2021 │
│ Coupé 2022     │ 2022 │
│ Camioneta 2023 │ 2023 │
│ Compacto 2021  │ 2021 │
│ Híbrido 2022   │ 2022 │
│ Deportivo 2023 │ 2023 │
│ Eléctrico 2021 │ 2021 │
└────────────────┴──────┘
**/


-- Consulta para contar el número de coches vendidos por cliente.
select count(id_coche) as numero, id_cliente from ventas
group by id_cliente;
/**
┌────────┬────────────┐
│ numero │ id_cliente │
├────────┼────────────┤
│ 1      │ 1          │
│ 1      │ 2          │
│ 1      │ 3          │
│ 1      │ 4          │
│ 1      │ 5          │
│ 1      │ 6          │
│ 1      │ 7          │
│ 1      │ 8          │
│ 1      │ 10         │
└────────┴────────────┘
**/

-- Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.
select cl.nombre, cl.edad, co.precio from clientes as cl, coches as co, ventas as v 
where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche
and cl.edad>35;
/**
┌─────────────────┬──────┬─────────┐
│     nombre      │ edad │ precio  │
├─────────────────┼──────┼─────────┤
│ Pedro Rodríguez │ 40   │ 32000.0 │
│ Isabel Díaz     │ 38   │ 35000.0 │
└─────────────────┴──────┴─────────┘
**/

--Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).
select substr(cl.direccion, 0, instr(direccion, '#')) as calle, sum(co.precio) as total from coches as co, clientes as cl, ventas as v 
where co.id_coche=v.id_coche and cl.id_cliente=v.id_cliente
group by calle;
/**
┌────────────┬─────────┐
│   calle    │  total  │
├────────────┼─────────┤
│ Avenida B  │ 22000.0 │
│ Avenida D  │ 28000.0 │
│ Avenida F  │ 20000.0 │
│ Avenida H  │ 35000.0 │
│ Avenida J  │ 40000.0 │
│ Calle A    │ 25000.0 │
│ Calle C    │ 30000.0 │
│ Calle E    │ 32000.0 │
│ Calle G    │ 27000.0 │
└────────────┴─────────┘
**/
--Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
select cl.nombre, cl.direccion from clientes as cl, ventas as v, coches as co, reparacion as r 
where co.id_coche=v.id_coche and cl.id_cliente=v.id_cliente and co.id_coche=r.id_coche and cl.id_cliente=r.id_cliente 
and co.precio>30000 and r.fecha_reparación regexp '^2024';
/**
┌──────────────┬────────────────┐
│    nombre    │   direccion    │
├──────────────┼────────────────┤
│ Elena Torres │ Avenida J #333 │
└──────────────┴────────────────┘
**/

-- Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.
select avg(co.precio) from coches as co, clientes as cl, ventas as v, reparacion as r 
where co.id_coche=v.id_coche and co.id_coche=r.id_coche and cl.id_cliente=v.id_cliente and cl.id_cliente=r.id_cliente
and cl.edad<30 and fecha_venta regexp '^2023';
/**
┌────────────────┐
│ avg(co.precio) │
├────────────────┤
│ 31000.0        │
└────────────────┘
**/

-- Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".
select co.modelo, co.año from coches as co, clientes as cl, ventas as v 
where co.id_coche=v.id_coche and cl.id_cliente=v.id_cliente
and direccion regexp '^Avenida';
/**
┌────────────────┬──────┐
│     modelo     │ año  │
├────────────────┼──────┤
│ Hatchback 2021 │ 2021 │
│ Coupé 2022     │ 2022 │
│ Compacto 2021  │ 2021 │
│ Deportivo 2023 │ 2023 │
│ Eléctrico 2021 │ 2021 │
└────────────────┴──────┘
**/

-- Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.
select id_cliente, count(*) as numero from reparacion
group by id_cliente;
/**
┌────────────┬────────┐
│ id_cliente │ numero │
├────────────┼────────┤
│ 1          │ 2      │
│ 2          │ 2      │
│ 3          │ 2      │
│ 4          │ 2      │
│ 5          │ 2      │
│ 6          │ 2      │
│ 7          │ 2      │
│ 8          │ 2      │
│ 9          │ 2      │
│ 10         │ 2      │
└────────────┴────────┘
**/
