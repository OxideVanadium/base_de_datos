# Trabajo con funciones en BBDD
## Objetivo

## Pasos:
### Paso 1: Creación de la BBDD

### Paso 2 Lectura del fichero sql.

```sql
.read supermercado_dump.sql
```

### Paso 3: Responde a las siguientes cuestiones

* Realiza el diagrama ER de la BBDD supermercado.

<img src=er.png />

* Realiza el diagrama MR de la BBDD supermercado.

<img src=rel.png />

* Indica si la BBDD esta normalizada hasta la 3ª forma normal, justificando la respuesta.

* 1FN: solo valores atomicos
* 2FN: solo dependencias funcionales del clave principal
* 3FN: no hay dependencias transitivas

### Paso 4: Responde a las siguientes cuestiones

Realiza las siguientes consultas, y muestra el resultado obtenido:

* Mostrar todos los productos de la categoría "Bebidas".

```sql
select * from productos where categoria='Bebidas';

│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
```

* Listar los productos ordenados por precio de forma descendente.

```sql
select * from productos order by precio desc;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 6  │ Huevos             │ Lácteos   │ 1.0    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 18 │ Jabón de Baño      │ Higiene   │ 1.2    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 8  │ Tomates            │ Verduras  │ 2.2    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 1  │ Arroz              │ Alimentos │ 2.5    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 4  │ Manzanas           │ Frutas    │ 3.0    │
│ 10 │ Cereal             │ Desayuno  │ 3.5    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 16 │ Café               │ Bebidas   │ 5.0    │
│ 5  │ Pollo              │ Carnes    │ 5.5    │
└────┴────────────────────┴───────────┴────────┘

```

* Calcular el precio total de todos los productos en la tabla "productos".

```sql
select sum(precio) as precio_total from productos;

┌──────────────┐
│ precio_total │
├──────────────┤
│ 52.5         │
└──────────────┘

```

* Encontrar los productos con un nombre que contenga la letra 'a'.

```sql
select * from productos where nombre like '%a%';
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 1  │ Arroz            │ Alimentos │ 2.5    │
│ 3  │ Pan              │ Panadería │ 1.2    │
│ 4  │ Manzanas         │ Frutas    │ 3.0    │
│ 8  │ Tomates          │ Verduras  │ 2.2    │
│ 10 │ Cereal           │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico  │ Hogar     │ 1.5    │
│ 14 │ Galletas         │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva  │ Cocina    │ 4.5    │
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 17 │ Sopa enlatada    │ Conservas │ 2.3    │
│ 18 │ Jabón de Baño    │ Higiene   │ 1.2    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘
```

* Obtener la cantidad total de productos vendidos en todas las fechas.

```sql
select sum(cantidad) as cantidad_total from ventas;
┌────────────────┐
│ cantidad_total │
├────────────────┤
│ 43             │
└────────────────┘
```

* Encontrar el producto más caro en cada categoría.

```sql
select nombre, max(precio) as precio, categoria
from productos
group by categoria;
┌────────────────────┬────────┬───────────┐
│       nombre       │ precio │ categoria │
├────────────────────┼────────┼───────────┤
│ Arroz              │ 2.5    │ Alimentos │
│ Café               │ 5.0    │ Bebidas   │
│ Pollo              │ 5.5    │ Carnes    │
│ Aceite de Oliva    │ 4.5    │ Cocina    │
│ Sopa enlatada      │ 2.3    │ Conservas │
│ Cereal             │ 3.5    │ Desayuno  │
│ Manzanas           │ 3.0    │ Frutas    │
│ Cepillo de Dientes │ 2.0    │ Higiene   │
│ Papel Higiénico    │ 1.5    │ Hogar     │
│ Detergente         │ 2.8    │ Limpieza  │
│ Queso              │ 4.0    │ Lácteos   │
│ Pan                │ 1.2    │ Panadería │
│ Galletas           │ 1.7    │ Snacks    │
│ Tomates            │ 2.2    │ Verduras  │
└────────────────────┴────────┴───────────┘
```

* Listar los productos que no han sido vendidos.

```sql
select * from productos
where id not in (select ventas.id_producto from productos, ventas where productos.id=ventas.id_producto);
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
└────┴────────────────────┴───────────┴────────┘
```

* Calcular el precio promedio de los productos en la categoría "Snacks".

```sql
select avg(precio) as promedio from productos where categoria='Snacks';
┌──────────┐
│ promedio │
├──────────┤
│ 1.7      │
└──────────┘
```

* Encontrar los productos que han sido vendidos más de 5 veces.

```sql
select productos.nombre, productos.precio, ventas.cantidad 
from productos, ventas 
where ventas.cantidad >=5 
and productos.id=ventas.id_producto;
┌───────────────┬────────┬──────────┐
│    nombre     │ precio │ cantidad │
├───────────────┼────────┼──────────┤
│ Arroz         │ 2.5    │ 5        │
│ Huevos        │ 1.0    │ 10       │
│ Galletas      │ 1.7    │ 7        │
│ Jabón de Baño │ 1.2    │ 6        │
└───────────────┴────────┴──────────┘
```

* Mostrar la fecha y la cantidad de ventas para cada producto.

```sql
select productos.nombre, productos.precio, ventas.fecha, ventas.cantidad
from ventas, productos
where productos.id=ventas.id_producto;
┌───────────────┬────────┬────────────┬──────────┐
│    nombre     │ precio │   fecha    │ cantidad │
├───────────────┼────────┼────────────┼──────────┤
│ Arroz         │ 2.5    │ 2024-01-17 │ 5        │
│ Leche         │ 1.8    │ 2024-01-17 │ 3        │
│ Manzanas      │ 3.0    │ 2024-01-17 │ 2        │
│ Pollo         │ 5.5    │ 2024-01-17 │ 1        │
│ Huevos        │ 1.0    │ 2024-01-18 │ 10       │
│ Tomates       │ 2.2    │ 2024-01-18 │ 4        │
│ Cereal        │ 3.5    │ 2024-01-18 │ 2        │
│ Galletas      │ 1.7    │ 2024-01-19 │ 7        │
│ Café          │ 5.0    │ 2024-01-19 │ 3        │
│ Jabón de Baño │ 1.2    │ 2024-01-20 │ 6        │
└───────────────┴────────┴────────────┴──────────┘
```

* Encontrar los productos que tienen un precio menor o igual a 2.

```sql
select * from productos where precio <= 2;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 6  │ Huevos             │ Lácteos   │ 1.0    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 18 │ Jabón de Baño      │ Higiene   │ 1.2    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
└────┴────────────────────┴───────────┴────────┘
```

* Calcular la cantidad total de ventas para cada fecha.

```sql
select sum(cantidad) as cantidad_total, fecha
from ventas
group by fecha;
┌────────────────┬────────────┐
│ cantidad_total │   fecha    │
├────────────────┼────────────┤
│ 11             │ 2024-01-17 │
│ 16             │ 2024-01-18 │
│ 10             │ 2024-01-19 │
│ 6              │ 2024-01-20 │
└────────────────┴────────────┘
```

* Listar los productos cuyo nombre comienza con la letra 'P'.

```sql
select * from productos where nombre like 'P%';
┌────┬─────────────────┬───────────┬────────┐
│ id │     nombre      │ categoria │ precio │
├────┼─────────────────┼───────────┼────────┤
│ 3  │ Pan             │ Panadería │ 1.2    │
│ 5  │ Pollo           │ Carnes    │ 5.5    │
│ 11 │ Papel Higiénico │ Hogar     │ 1.5    │
└────┴─────────────────┴───────────┴────────┘
```


* Obtener el producto más vendido en términos de cantidad.

```sql
select productos.nombre, ventas.cantidad
from productos, ventas
where productos.id=ventas.id_producto
order by cantidad desc limit 1;
┌────────┬──────────┐
│ nombre │ cantidad │
├────────┼──────────┤
│ Huevos │ 10       │
└────────┴──────────┘
```

* Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.

```sql
select productos.nombre, ventas.fecha 
from productos,ventas
where ventas.fecha='2024-01-18'
and productos.id=ventas.id_producto;
┌─────────┬────────────┐
│ nombre  │   fecha    │
├─────────┼────────────┤
│ Huevos  │ 2024-01-18 │
│ Tomates │ 2024-01-18 │
│ Cereal  │ 2024-01-18 │
└─────────┴────────────┘
```

* Calcular el total de ventas para cada producto.

```sql
select productos.nombre, productos.precio*ventas.cantidad as total
from productos, ventas
where productos.id=ventas.id_producto;
┌───────────────┬───────┐
│    nombre     │ total │
├───────────────┼───────┤
│ Arroz         │ 12.5  │
│ Leche         │ 5.4   │
│ Manzanas      │ 6.0   │
│ Pollo         │ 5.5   │
│ Huevos        │ 10.0  │
│ Tomates       │ 8.8   │
│ Cereal        │ 7.0   │
│ Galletas      │ 11.9  │
│ Café          │ 15.0  │
│ Jabón de Baño │ 7.2   │
└───────────────┴───────┘
```

* Encontrar los productos con un precio entre 3 y 4.

```sql
select * from productos where precio between 3 and 4;
┌────┬──────────┬───────────┬────────┐
│ id │  nombre  │ categoria │ precio │
├────┼──────────┼───────────┼────────┤
│ 4  │ Manzanas │ Frutas    │ 3.0    │
│ 9  │ Queso    │ Lácteos   │ 4.0    │
│ 10 │ Cereal   │ Desayuno  │ 3.5    │
│ 20 │ Cerveza  │ Bebidas   │ 3.8    │
└────┴──────────┴───────────┴────────┘
```

* Listar los productos y sus categorías ordenados alfabéticamente por categoría.

```sql
select nombre, categoria from productos order by categoria;
┌────────────────────┬───────────┐
│       nombre       │ categoria │
├────────────────────┼───────────┤
│ Arroz              │ Alimentos │
│ Café               │ Bebidas   │
│ Botellas de Agua   │ Bebidas   │
│ Cerveza            │ Bebidas   │
│ Pollo              │ Carnes    │
│ Aceite de Oliva    │ Cocina    │
│ Sopa enlatada      │ Conservas │
│ Cereal             │ Desayuno  │
│ Manzanas           │ Frutas    │
│ Cepillo de Dientes │ Higiene   │
│ Jabón de Baño      │ Higiene   │
│ Papel Higiénico    │ Hogar     │
│ Detergente         │ Limpieza  │
│ Leche              │ Lácteos   │
│ Huevos             │ Lácteos   │
│ Yogurt             │ Lácteos   │
│ Queso              │ Lácteos   │
│ Pan                │ Panadería │
│ Galletas           │ Snacks    │
│ Tomates            │ Verduras  │
└────────────────────┴───────────┘
```

* Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.

```sql
select sum(productos.precio*ventas.cantidad) as precio_total, ventas.fecha
from productos, ventas
where ventas.fecha='2024-01-19'
and productos.id=ventas.id_producto;
┌──────────────┬────────────┐
│ precio_total │   fecha    │
├──────────────┼────────────┤
│ 26.9         │ 2024-01-19 │
└──────────────┴────────────┘
```

* Mostrar los productos que no pertenecen a la categoría "Higiene".

```sql
select * from productos where categoria!='Higiene';
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 1  │ Arroz            │ Alimentos │ 2.5    │
│ 2  │ Leche            │ Lácteos   │ 1.8    │
│ 3  │ Pan              │ Panadería │ 1.2    │
│ 4  │ Manzanas         │ Frutas    │ 3.0    │
│ 5  │ Pollo            │ Carnes    │ 5.5    │
│ 6  │ Huevos           │ Lácteos   │ 1.0    │
│ 7  │ Yogurt           │ Lácteos   │ 2.0    │
│ 8  │ Tomates          │ Verduras  │ 2.2    │
│ 9  │ Queso            │ Lácteos   │ 4.0    │
│ 10 │ Cereal           │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico  │ Hogar     │ 1.5    │
│ 13 │ Detergente       │ Limpieza  │ 2.8    │
│ 14 │ Galletas         │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva  │ Cocina    │ 4.5    │
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 17 │ Sopa enlatada    │ Conservas │ 2.3    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘
```

* Encontrar la cantidad total de productos en cada categoría.

```sql
select categoria, count(nombre) as cantidad
from productos
group by categoria;
┌───────────┬──────────┐
│ categoria │ cantidad │
├───────────┼──────────┤
│ Alimentos │ 1        │
│ Bebidas   │ 3        │
│ Carnes    │ 1        │
│ Cocina    │ 1        │
│ Conservas │ 1        │
│ Desayuno  │ 1        │
│ Frutas    │ 1        │
│ Higiene   │ 2        │
│ Hogar     │ 1        │
│ Limpieza  │ 1        │
│ Lácteos   │ 4        │
│ Panadería │ 1        │
│ Snacks    │ 1        │
│ Verduras  │ 1        │
└───────────┴──────────┘
```

* Listar los productos que tienen un precio igual a la media de precios.
!!!!!!! 
```sql
select * from productos
where precio=(select avg(precio) from productos);
```

* Calcular el precio total de los productos vendidos en cada fecha.
!!!! 
```sql
select sum(productos.precio*ventas.cantidad) as precio_total, fecha
from productos, ventas
where productos.id=ventas.id_producto
group by fecha;
┌────────┬──────────┬──────────────┬────────────┐
│ precio │ cantidad │ precio_total │   fecha    │
├────────┼──────────┼──────────────┼────────────┤
│ 2.5    │ 5        │ 29.4         │ 2024-01-17 │
│ 1.0    │ 10       │ 25.8         │ 2024-01-18 │
│ 1.7    │ 7        │ 26.9         │ 2024-01-19 │
│ 1.2    │ 6        │ 7.2          │ 2024-01-20 │
└────────┴──────────┴──────────────┴────────────┘
```

* Mostrar los productos con un nombre que termina con la letra 'o'.

```sql
select * from productos where nombre like '%o';
┌────┬─────────────────┬───────────┬────────┐
│ id │     nombre      │ categoria │ precio │
├────┼─────────────────┼───────────┼────────┤
│ 5  │ Pollo           │ Carnes    │ 5.5    │
│ 9  │ Queso           │ Lácteos   │ 4.0    │
│ 11 │ Papel Higiénico │ Hogar     │ 1.5    │
│ 18 │ Jabón de Baño   │ Higiene   │ 1.2    │
└────┴─────────────────┴───────────┴────────┘
```

* Encontrar los productos que han sido vendidos en más de una fecha.

```sql
:(
```

* Listar los productos cuya categoría comienza con la letra 'L'.

```sql
select * from productos where categoria like 'L%';
┌────┬────────────┬───────────┬────────┐
│ id │   nombre   │ categoria │ precio │
├────┼────────────┼───────────┼────────┤
│ 2  │ Leche      │ Lácteos   │ 1.8    │
│ 6  │ Huevos     │ Lácteos   │ 1.0    │
│ 7  │ Yogurt     │ Lácteos   │ 2.0    │
│ 9  │ Queso      │ Lácteos   │ 4.0    │
│ 13 │ Detergente │ Limpieza  │ 2.8    │
└────┴────────────┴───────────┴────────┘
```

* Calcular el total de ventas para cada producto en la fecha '2024-01-17'.

```sql
select productos.nombre, productos.precio*ventas.cantidad as total, fecha
from productos, ventas
where fecha='2024-01-17'
and productos.id=ventas.id_producto
group by ventas.id_producto;
┌──────────┬───────┬────────────┐
│  nombre  │ total │   fecha    │
├──────────┼───────┼────────────┤
│ Arroz    │ 12.5  │ 2024-01-17 │
│ Leche    │ 5.4   │ 2024-01-17 │
│ Manzanas │ 6.0   │ 2024-01-17 │
│ Pollo    │ 5.5   │ 2024-01-17 │
└──────────┴───────┴────────────┘
```

* Mostrar los productos cuyo nombre tiene al menos 5 caracteres.

```sql
select * from productos
where length(nombre)>=5;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 1  │ Arroz              │ Alimentos │ 2.5    │
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 4  │ Manzanas           │ Frutas    │ 3.0    │
│ 5  │ Pollo              │ Carnes    │ 5.5    │
│ 6  │ Huevos             │ Lácteos   │ 1.0    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 8  │ Tomates            │ Verduras  │ 2.2    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 10 │ Cereal             │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 18 │ Jabón de Baño      │ Higiene   │ 1.2    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
└────┴────────────────────┴───────────┴────────┘
```

* Encontrar los productos que tienen un precio superior al precio promedio en la tabla "productos".

```sql
select * from productos
where precio>(select avg(precio) from productos);
┌────┬─────────────────┬───────────┬────────┐
│ id │     nombre      │ categoria │ precio │
├────┼─────────────────┼───────────┼────────┤
│ 4  │ Manzanas        │ Frutas    │ 3.0    │
│ 5  │ Pollo           │ Carnes    │ 5.5    │
│ 9  │ Queso           │ Lácteos   │ 4.0    │
│ 10 │ Cereal          │ Desayuno  │ 3.5    │
│ 13 │ Detergente      │ Limpieza  │ 2.8    │
│ 15 │ Aceite de Oliva │ Cocina    │ 4.5    │
│ 16 │ Café            │ Bebidas   │ 5.0    │
│ 20 │ Cerveza         │ Bebidas   │ 3.8    │
└────┴─────────────────┴───────────┴────────┘
```


