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
└────────────────┴─────────┴─────────────────┘
**/

-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)

select cl.*, co.precio from clientes as cl, ventas as v, coches as co 
where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche
and co.precio>(
  select avg(precio) from coches
  where id_coche in(
    select id_coche from ventas
    )
  );
/**
┌────────────┬─────────────────┬──────┬────────────────┬─────────┐
│ id_cliente │     nombre      │ edad │   direccion    │ precio  │
├────────────┼─────────────────┼──────┼────────────────┼─────────┤
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
where id_coche not in(
  select id_coche from ventas
);
/**
┌─────────────┬─────────┐
│   modelo    │ precio  │
├─────────────┼─────────┤
│ Pickup 2022 │ 31000.0 │
└─────────────┴─────────┘
**/

-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

select sum(precio) as total from coches
where id_coche in (
  select id_coche from ventas
  );

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

select co.modelo, co.marca, cl.nombre, v.fecha_venta
from coches as co, clientes as cl, ventas as v 
where co.id_coche=v.id_coche and cl.id_cliente=v.id_cliente
order by v.fecha_venta desc;
/**
┌────────────────┬────────────┬─────────────────┬─────────────┐
│     modelo     │   marca    │     nombre      │ fecha_venta │
├────────────────┼────────────┼─────────────────┼─────────────┤
│ Eléctrico 2021 │ Tesla      │ Elena Torres    │ 2023-10-05  │
│ Deportivo 2023 │ Mazda      │ Isabel Díaz     │ 2023-08-25  │
│ Híbrido 2022   │ Hyundai    │ Miguel González │ 2023-07-20  │
│ Compacto 2021  │ Volkswagen │ Laura Sánchez   │ 2023-06-15  │
│ Camioneta 2023 │ Nissan     │ Pedro Rodríguez │ 2023-05-05  │
│ Coupé 2022     │ Chevrolet  │ Ana Martínez    │ 2023-04-10  │
│ SUV 2023       │ Ford       │ Carlos López    │ 2023-03-25  │
│ Hatchback 2021 │ Honda      │ María Gómez     │ 2023-02-20  │
│ Sedán 2022     │ Toyota     │ Juan Pérez      │ 2023-01-15  │
└────────────────┴────────────┴─────────────────┴─────────────┘
**/

-- Encontrar el modelo de coche más caro que ha sido reparado al menos una vez.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX
  

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT
select id_cliente, count(*) as cantidad_coches from ventas 
group by id_cliente
having cantidad_coches>1;
/**
sqlite> select id_cliente, count(*) as cantidad_coches from ventas 
   ...> group by id_cliente
   ...> having cantidad_coches>1;
sqlite> 
**/

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?
select distinct cl.* from clientes as cl, coches as co, ventas as v 
where v.id_cliente=cl.id_cliente and co.id_coche=v.id_coche 
and co.marca='Toyota';

/**
┌────────────┬────────────┬──────┬──────────────┐
│ id_cliente │   nombre   │ edad │  direccion   │
├────────────┼────────────┼──────┼──────────────┤
│ 1          │ Juan Pérez │ 30   │ Calle A #123 │
└────────────┴────────────┴──────┴──────────────┘
**/

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 

select avg(cl.edad) as edad from clientes as cl, coches as co, ventas as v 
where co.precio>25000 
and cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche;
/**
┌──────────────────┐
│       edad       │
├──────────────────┤
│ 32.8333333333333 │
└──────────────────┘
**/

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
select co.modelo, co.precio from coches as co, clientes as cl, ventas as v 
where co.id_coche=v.id_coche and cl.id_cliente=v.id_cliente
and cl.edad>30;
/**
┌────────────────┬─────────┐
│     modelo     │ precio  │
├────────────────┼─────────┤
│ SUV 2023       │ 30000.0 │
│ Camioneta 2023 │ 32000.0 │
│ Compacto 2021  │ 20000.0 │
│ Deportivo 2023 │ 35000.0 │
└────────────────┴─────────┘
**/

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
select co.*, (select count(*) from ventas 
where fecha_venta regexp '2022') 
from coches as co, ventas as v 
where co.id_coche=v.id_coche and fecha_venta regexp '2022';

/**
sqlite> select distinct co.*, (select count(*) from ventas 
(x1...> where fecha_venta regexp '2022')
   ...> from coches as co, ventas as v
   ...> where co.id_coche=v.id_coche and fecha_venta regexp '2022';
sqlite> 
**/


-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG
select * from coches 
where precio>(
  select avg(precio) from coches
  where id_coche in (
    select distinct v.id_coche from clientes as cl, ventas as v 
    where cl.id_cliente=v.id_cliente
    and cl.edad<30
  )
);
/**
┌──────────┬────────────────┬────────┬──────┬─────────┐
│ id_coche │     modelo     │ marca  │ año  │ precio  │
├──────────┼────────────────┼────────┼──────┼─────────┤
│ 3        │ SUV 2023       │ Ford   │ 2023 │ 30000.0 │
│ 5        │ Camioneta 2023 │ Nissan │ 2023 │ 32000.0 │
│ 8        │ Deportivo 2023 │ Mazda  │ 2023 │ 35000.0 │
│ 9        │ Pickup 2022    │ Ram    │ 2022 │ 31000.0 │
│ 10       │ Eléctrico 2021 │ Tesla  │ 2021 │ 40000.0 │
└──────────┴────────────────┴────────┴──────┴─────────┘
**/

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio

select co.marca, co.id_coche, co.precio*count(v.id_coche) as total from coches as co, ventas as v 
where v.id_coche=co.id_coche
group by co.marca
order by total;

/**
┌────────────┬──────────┬─────────┐
│   marca    │ id_coche │  total  │
├────────────┼──────────┼─────────┤
│ Volkswagen │ 6        │ 20000.0 │
│ Honda      │ 2        │ 22000.0 │
│ Toyota     │ 1        │ 25000.0 │
│ Hyundai    │ 7        │ 27000.0 │
│ Chevrolet  │ 4        │ 28000.0 │
│ Ford       │ 3        │ 30000.0 │
│ Nissan     │ 5        │ 32000.0 │
│ Mazda      │ 8        │ 35000.0 │
│ Tesla      │ 10       │ 40000.0 │
└────────────┴──────────┴─────────┘
**/

