-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?
select co.modelo, co.precio, cl.nombre from coches as co, clientes as cl, ventas as v 
where v.id_cliente=cl.id_cliente and v.id_coche=co.id_coche;
/**
┌────────────────┬─────────┬─────────────────┐
│     modelo     │ precio  │     nombre      │
├────────────────┼─────────┼─────────────────┤
│ Sedán 2022     │ 25000.0 │ Juan Pérez      │
│ Hatchback 2021 │ 22000.0 │ María Gómez     │
│ SUV 2023       │ 30000.0 │ Carlos López    │
│ Coupé 2022     │ 28000.0 │ Ana Martínez    │
│ Camioneta 2023 │ 32000.0 │ Pedro Rodríguez │
│ Compacto 2021  │ 20000.0 │ Laura Sánchez   │
│ Híbrido 2022   │ 27000.0 │ Miguel González │
│ Deportivo 2023 │ 35000.0 │ Isabel Díaz     │
│ Eléctrico 2021 │ 40000.0 │ Elena Torres    │
│ Sedán 2022     │ 25000.0 │ Juan Pérez      │
│ Hatchback 2021 │ 22000.0 │ María Gómez     │
│ SUV 2023       │ 30000.0 │ Carlos López    │
│ Coupé 2022     │ 28000.0 │ Ana Martínez    │
│ Camioneta 2023 │ 32000.0 │ Pedro Rodríguez │
│ Compacto 2021  │ 20000.0 │ Laura Sánchez   │
│ Híbrido 2022   │ 27000.0 │ Miguel González │
│ Deportivo 2023 │ 35000.0 │ Isabel Díaz     │
│ Eléctrico 2021 │ 40000.0 │ Elena Torres    │
└────────────────┴─────────┴─────────────────┘
**/

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)

select cl.*, co.precio from clientes as cl, coches as co, ventas as v 
where v.id_cliente=cl.id_cliente and v.id_coche=co.id_coche
and co.precio>(select avg(precio) from coches);
/**
┌────────────┬─────────────────┬──────┬────────────────┬─────────┐
│ id_cliente │     nombre      │ edad │   direccion    │ precio  │
├────────────┼─────────────────┼──────┼────────────────┼─────────┤
│ 3          │ Carlos López    │ 35   │ Calle C #789   │ 30000.0 │
│ 5          │ Pedro Rodríguez │ 40   │ Calle E #234   │ 32000.0 │
│ 8          │ Isabel Díaz     │ 38   │ Avenida H #111 │ 35000.0 │
│ 10         │ Elena Torres    │ 29   │ Avenida J #333 │ 40000.0 │
│ 3          │ Carlos López    │ 35   │ Calle C #789   │ 30000.0 │
│ 5          │ Pedro Rodríguez │ 40   │ Calle E #234   │ 32000.0 │
│ 8          │ Isabel Díaz     │ 38   │ Avenida H #111 │ 35000.0 │
│ 10         │ Elena Torres    │ 29   │ Avenida J #333 │ 40000.0 │
└────────────┴─────────────────┴──────┴────────────────┴─────────┘
**/

-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:

  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas

select modelo, precio from coches
where id_coche not in(select id_coche from ventas);
/**
┌────────────────┬─────────┐
│     modelo     │ precio  │
├────────────────┼─────────┤
│ Pickup 2022    │ 31000.0 │
│ Sedán 2022     │ 25000.0 │
│ Hatchback 2021 │ 22000.0 │
│ SUV 2023       │ 30000.0 │
│ Coupé 2022     │ 28000.0 │
│ Camioneta 2023 │ 32000.0 │
│ Compacto 2021  │ 20000.0 │
│ Híbrido 2022   │ 27000.0 │
│ Deportivo 2023 │ 35000.0 │
│ Pickup 2022    │ 31000.0 │
│ Eléctrico 2021 │ 40000.0 │
└────────────────┴─────────┘
**/

-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

select sum(precio) as total from coches
where id_coche in (select id_coche from ventas);

/**
┌──────────┐
│  total   │
├──────────┤
│ 259000.0 │
└──────────┘
**/

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?

select co.modelo, co.marca, co.año, co.precio, cl.nombre, v.fecha_venta
from coches as co, clientes as cl, ventas as v 
where co.id_coche=v.id_coche and cl.id_cliente=v.id_cliente
order by v.fecha_venta;

-- Encontrar el modelo de coche más caro que ha sido reparado al menos una vez.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
