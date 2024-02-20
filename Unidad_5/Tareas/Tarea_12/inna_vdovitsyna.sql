/** # Repasando consultas II

Dadas las siguientes tablas : cliente:

    id: entero autoincremental y clave primaria
    nombre: texto
    apelllido1: texto
    apelllido2: texto
    ciudad: texto
    categoria: entero

comercial

    id: entero autoincremental y clave primaria
    nombre: texto
    apelllido1: texto
    apelllido2: texto
    categoria: real
pedido

    id: entero autoincremental y clave primaria
    total: real
    fecha: texto
    id_cliente: entero
    id_comercial: entero
Se pide:

Crea la estrucuta de tablas en función de las propiedades y sus nombres para determinar las claves primarias, claves foraneas. El fichero de la BBDD debe de llamarse ventas.db.
**/
sql
create table cliente(
    id primary key,
    nombre text,
    apellido1 text,
    apellido2 text,
    ciudad text,
    categotia integer
);
create table comercial(
    id primary key,
    nombre text,
    apellido1 text,
    apellido2 text,
    categoria real
);
create table pedido(
    id primary key,
    total real,
    fecha text,
    id_cliente references cliente(id),
    id_comeracial references comercial(id)
);

/**Almacena el contenido en un fichero y realiza la inserción a través de la sentencia de sqlite que consideres adecuada.

    Nota: Se debe de leer el fichero, utiliza el comando .help para conocer el comando adecuado.

**/
.read inserts.sql
/**

_Apollate en las funciones del lenguaje sql y sqlite:

    Funciones de core.
    Funciones de fechas.

Realiza las siguientes consultas, indicando, la consulta y la salida que has obtenido. Recurda que se debe de entregar:

    Nombre_Apellido1_Apellido2.sql (Consulta y salida).
    ventas.db

## Consultas sobre una tabla

* Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
**/
select * from pedido
order by fecha desc;
/**
┌────┬─────────┬────────────┬────────────┬───────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comeracial │
├────┼─────────┼────────────┼────────────┼───────────────┤
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5             │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5             │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1             │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6             │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2             │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1             │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2             │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1             │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1             │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3             │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5             │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3             │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7             │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1             │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1             │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2             │
└────┴─────────┴────────────┴────────────┴───────────────┘


* Devuelve todos los datos de los dos pedidos de mayor valor.
**/
select * from pedido 
order by total desc
limit 2;
/**
┌────┬────────┬────────────┬────────────┬───────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comeracial │
├────┼────────┼────────────┼────────────┼───────────────┤
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1             │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1             │
└────┴────────┴────────────┴────────────┴───────────────┘
```
* Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
**/
select distinct(id_cliente) from pedido;
/**
┌────────────┐
│ id_cliente │
├────────────┤
│ 5          │
│ 1          │
│ 2          │
│ 8          │
│ 7          │
│ 4          │
│ 3          │
│ 6          │
└────────────┘


* Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
**/
select * from pedido
where fecha regexp '^2017'
and total > 500;
/**
┌────┬─────────┬────────────┬────────────┬───────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comeracial │
├────┼─────────┼────────────┼────────────┼───────────────┤
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2             │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6             │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1             │
└────┴─────────┴────────────┴────────────┴───────────────┘

* Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
**/
select nombre, apellido1, apellido2 from comercial 
where categoria between 0.05 and 0.11;
/**
┌─────────┬───────────┬───────────┐
│ nombre  │ apellido1 │ apellido2 │
├─────────┼───────────┼───────────┤
│ Diego   │ Flores    │ Salas     │
│ Antonio │ Vega      │ Hernández │
│ Alfredo │ Ruiz      │ Flores    │
└─────────┴───────────┴───────────┘


* Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
**/
select max(categoria) from comercial;
/**
┌────────────────┐
│ max(categoria) │
├────────────────┤
│ 0.15           │
└────────────────┘


* Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
**/
select id, nombre, apellido1 from cliente
where apellido2 is not null
order by apellido1, apellido2, nombre;
/**
┌────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │
├────┼───────────┼───────────┤
│ 5  │ Marcos    │ Loyola    │
│ 9  │ Guillermo │ López     │
│ 1  │ Aarón     │ Rivero    │
│ 3  │ Adolfo    │ Rubio     │
│ 8  │ Pepe      │ Ruiz      │
│ 2  │ Adela     │ Salas     │
│ 10 │ Daniel    │ Santana   │
│ 6  │ María     │ Santana   │
└────┴───────────┴───────────┘


* Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
**/
select nombre from cliente
where nombre regexp '^A.*n$'
order by nombre;
/**
┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adrián │
└────────┘


* Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
**/
select nombre from cliente 
where nombre not regexp '^A'
order by nombre;
/**
┌───────────┐
│  nombre   │
├───────────┤
│ Daniel    │
│ Guillermo │
│ Marcos    │
│ María     │
│ Pepe      │
│ Pilar     │
└───────────┘
```

* Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
**/
select distinct(nombre) from comercial
where nombre regexp 'o$';
/**
┌─────────┐
│ nombre  │
├─────────┤
│ Diego   │
│ Antonio │
│ Alfredo │
└─────────┘


## Consultas multitabla

Nota: Resuelva todas las consultas utilizando las cláusulas INNER JOIN.

* Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
**/
select distinct(c.id), c.nombre, c.apellido1, c.apellido2 from cliente as c
join pedido as p on c.id=p.id_cliente
order by nombre;
/**
┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │
├────┼────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │
│ 2  │ Adela  │ Salas     │ Díaz      │
│ 3  │ Adolfo │ Rubio     │ Flores    │
│ 4  │ Adrián │ Suárez    │           │
│ 5  │ Marcos │ Loyola    │ Méndez    │
│ 6  │ María  │ Santana   │ Moreno    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │
│ 7  │ Pilar  │ Ruiz      │           │
└────┴────────┴───────────┴───────────┘

* Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
**/
select p.*, c.* from cliente as c
join pedido as p on c.id=p.id_cliente
order by c.nombre;
/**
┌────┬─────────┬────────────┬────────────┬───────────────┬────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comeracial │ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categotia │
├────┼─────────┼────────────┼────────────┼───────────────┼────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5             │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5             │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5             │ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1             │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1             │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1             │ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7             │ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6             │ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2             │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2             │ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1             │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1             │ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3             │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3             │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2             │ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1             │ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │
└────┴─────────┴────────────┴────────────┴───────────────┴────┴────────┴───────────┴───────────┴─────────┴───────────┘
```
* Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
**/
select c.*, p.* from comercial as c
join pedido as p on c.id=p.id_comeracial
order by c.nombre;
/**
┌────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬────────────┬───────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comeracial │
├────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼────────────┼───────────────┤
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5             │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7             │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5             │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1             │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1             │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3             │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2             │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2             │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6             │
└────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴────────────┴───────────────┘

* Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
**/
select c.*, co.*, p.* from cliente as c
join comercial as co, pedido as p
on c.id=p.id_cliente and p.id_comeracial=co.id;
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬────────────┬───────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categotia │ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comeracial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼────────────┼───────────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2             │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5             │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1             │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3             │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2             │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1             │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1             │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6             │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3             │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2             │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7             │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1             │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1             │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1             │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5             │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5             │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴────────────┴───────────────┘


* Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
**/
select c.* from cliente as c
join pedido as p on c.id=p.id_cliente 
where p.total between 300 and 1000
and strftime('%Y', p.fecha);
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categotia │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘

* Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
**/
select distinct(c.nombre), c.apellido1, c.apellido2 from comercial as c
join cliente as cl, pedido as p 
on c.id=p.id_comeracial and p.id_cliente=cl.id
where cl.nombre='María' and cl.apellido1='Santana' and cl.apellido2='Moreno';
/**
┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Daniel │ Sáez      │ Vega      │
└────────┴───────────┴───────────┘

* Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
**/
select distinct(c.nombre) from cliente as c
join pedido as p, comercial as co 
on c.id=p.id_cliente and p.id_comeracial=co.id
where co.nombre='Daniel' and co.apellido1='Sáez' and co.apellido2='Vega';
/**
┌────────┐
│ nombre │
├────────┤
│ Adela  │
│ Pilar  │
│ María  │
└────────┘


## Consultas resumen (Funciones)

* Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
**/
select sum(total) as total from pedido;
┌──────────┐
│  total   │
├──────────┤
│ 20992.83 │
└──────────┘
/**

* Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
**/
select avg(total) as media from pedido;
/**
┌─────────────┐
│    media    │
├─────────────┤
│ 1312.051875 │
└─────────────┘

* Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
**/
select sum(total) as total, id_comeracial from pedido
group by id_comeracial;
/**
┌──────────┬───────────────┐
│  total   │ id_comeracial │
├──────────┼───────────────┤
│ 11963.03 │ 1             │
│ 1349.45  │ 2             │
│ 2590.9   │ 3             │
│ 3030.73  │ 5             │
│ 1983.43  │ 6             │
│ 75.29    │ 7             │
└──────────┴───────────────┘

* Calcula el número total de clientes que aparecen en la tabla cliente.
**/
select count(*) from cliente;
/**
┌──────────┐
│ count(*) │
├──────────┤
│ 10       │
└──────────┘

* Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
**/
select max(total) as max from pedido;
/**
┌────────┐
│  max   │
├────────┤
│ 5760.0 │
└────────┘

* Calcula cuál es la menor cantidad que aparece en la tabla pedido.
**/
select min(total) as min from pedido;
/**
┌───────┐
│  min  │
├───────┤
│ 65.26 │
└───────┘

* Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
**/
select max(categotia) as max, ciudad from cliente
group by ciudad;
/**
┌─────┬─────────┐
│ max │ ciudad  │
├─────┼─────────┤
│ 200 │ Almería │
│ 100 │ Cádiz   │
│ 225 │ Granada │
│ 200 │ Huelva  │
│ 300 │ Jaén    │
│ 300 │ Sevilla │
└─────┴─────────┘

* Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
**/
select c.id, c.nombre, c.apellido1, c.apellido2, max(p.total), p.fecha 
from cliente as c
join pedido as p on c.id=p.id_cliente
group by p.id_cliente, p.fecha;
/**
┌────┬────────┬───────────┬───────────┬──────────────┬────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ max(p.total) │   fecha    │
├────┼────────┼───────────┼───────────┼──────────────┼────────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 270.65       │ 2016-09-10 │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 2389.23      │ 2019-03-11 │
│ 2  │ Adela  │ Salas     │ Díaz      │ 5760.0       │ 2015-09-10 │
│ 2  │ Adela  │ Salas     │ Díaz      │ 3045.6       │ 2017-04-25 │
│ 2  │ Adela  │ Salas     │ Díaz      │ 65.26        │ 2017-10-05 │
│ 3  │ Adolfo │ Rubio     │ Flores    │ 75.29        │ 2016-08-17 │
│ 4  │ Adrián │ Suárez    │           │ 1983.43      │ 2017-10-10 │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 948.5        │ 2017-09-10 │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 150.5        │ 2017-10-05 │
│ 6  │ María  │ Santana   │ Moreno    │ 145.82       │ 2017-02-02 │
│ 6  │ María  │ Santana   │ Moreno    │ 545.75       │ 2019-01-25 │
│ 7  │ Pilar  │ Ruiz      │           │ 2400.6       │ 2016-07-27 │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 250.45       │ 2015-06-27 │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 110.5        │ 2016-08-17 │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2480.4       │ 2016-10-10 │
└────┴────────┴───────────┴───────────┴──────────────┴────────────┘

* Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
**/
select c.id, c.nombre, c.apellido1, c.apellido2, max(p.total), p.fecha 
from cliente as c
join pedido as p on c.id=p.id_cliente
group by p.id_cliente, p.fecha
having p.total>2000;
/**
┌────┬────────┬───────────┬───────────┬──────────────┬────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ max(p.total) │   fecha    │
├────┼────────┼───────────┼───────────┼──────────────┼────────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 2389.23      │ 2019-03-11 │
│ 2  │ Adela  │ Salas     │ Díaz      │ 5760.0       │ 2015-09-10 │
│ 2  │ Adela  │ Salas     │ Díaz      │ 3045.6       │ 2017-04-25 │
│ 7  │ Pilar  │ Ruiz      │           │ 2400.6       │ 2016-07-27 │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 2480.4       │ 2016-10-10 │
└────┴────────┴───────────┴───────────┴──────────────┴────────────┘

* Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
**/
select c.id, c.nombre, c.apellido1, c.apellido2, max(p.total)
from comercial as c
join pedido as p on c.id=p.id_comeracial
where fecha='2016-08-17';
/**
┌────┬────────┬───────────┬───────────┬──────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ max(p.total) │
├────┼────────┼───────────┼───────────┼──────────────┤
│ 3  │ Diego  │ Flores    │ Salas     │ 110.5        │
└────┴────────┴───────────┴───────────┴──────────────┘

* Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. 
**/
select c.id, c.nombre, c.apellido1, c.apellido2, count(p.id) as num_ped
from cliente as c
join pedido as p on c.id=p.id_cliente
group by c.id
having num_ped>0;
/**
┌────┬────────┬───────────┬───────────┬─────────┐
│ id │ nombre │ apellido1 │ apellido2 │ num_ped │
├────┼────────┼───────────┼───────────┼─────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ 3       │
│ 2  │ Adela  │ Salas     │ Díaz      │ 3       │
│ 3  │ Adolfo │ Rubio     │ Flores    │ 1       │
│ 4  │ Adrián │ Suárez    │           │ 1       │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2       │
│ 6  │ María  │ Santana   │ Moreno    │ 2       │
│ 7  │ Pilar  │ Ruiz      │           │ 1       │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ 3       │
└────┴────────┴───────────┴───────────┴─────────┘

* Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
**/
select c.* from cliente as c
left join pedido as p on c.id=p.id_cliente
where p.id is null;
/**
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categotia │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘
* Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
**/
select c.id, c.nombre, c.apellido1, c.apellido2, count(p.id) as num_ped from cliente as c
join pedido as p on c.id=p.id_cliente
where strftime('%Y', p.fecha)="2017"
group by c.id;
/**
┌────┬────────┬───────────┬───────────┬─────────┐
│ id │ nombre │ apellido1 │ apellido2 │ num_ped │
├────┼────────┼───────────┼───────────┼─────────┤
│ 2  │ Adela  │ Salas     │ Díaz      │ 2       │
│ 4  │ Adrián │ Suárez    │           │ 1       │
│ 5  │ Marcos │ Loyola    │ Méndez    │ 2       │
│ 6  │ María  │ Santana   │ Moreno    │ 1       │
└────┴────────┴───────────┴───────────┴─────────┘

* Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.
**/
select c.id, c.nombre, c.apellido1, ifnull(p.total*count(p.id), 0) as cantidad
from cliente as c
left join pedido as p on c.id=p.id_cliente
group by c.id;
/**
┌────┬───────────┬───────────┬──────────┐
│ id │  nombre   │ apellido1 │ cantidad │
├────┼───────────┼───────────┼──────────┤
│ 1  │ Aarón     │ Rivero    │ 811.95   │
│ 2  │ Adela     │ Salas     │ 195.78   │
│ 3  │ Adolfo    │ Rubio     │ 75.29    │
│ 4  │ Adrián    │ Suárez    │ 1983.43  │
│ 5  │ Marcos    │ Loyola    │ 301.0    │
│ 6  │ María     │ Santana   │ 1091.5   │
│ 7  │ Pilar     │ Ruiz      │ 2400.6   │
│ 8  │ Pepe      │ Ruiz      │ 331.5    │
│ 9  │ Guillermo │ López     │ 0        │
│ 10 │ Daniel    │ Santana   │ 0        │
└────┴───────────┴───────────┴──────────┘

* Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
**/
select max(total) from pedido
group by strftime('%Y', fecha);
/**
┌────────────┐
│ max(total) │
├────────────┤
│ 5760.0     │
│ 2480.4     │
│ 3045.6     │
│ 2389.23    │
└────────────┘
```

    Devuelve el número total de pedidos que se han realizado cada año.
**/
select count(*), strftime('%Y', fecha) as año from pedido
group by año;
/**
┌──────────┬──────┐
│ count(*) │ año  │
├──────────┼──────┤
│ 2        │ 2015 │
│ 5        │ 2016 │
│ 6        │ 2017 │
│ 3        │ 2019 │
└──────────┴──────┘


Subconsultas
Con operadores básicos de comparación

* Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
**/
select * from pedido
where id_cliente=(
select id from cliente
where nombre='Adela' and apellido1='Salas'
and apellido2='Díaz');
/**
┌────┬────────┬────────────┬────────────┬───────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comeracial │
├────┼────────┼────────────┼────────────┼───────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1             │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1             │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1             │
└────┴────────┴────────────┴────────────┴───────────────┘


* Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
**/
select * from pedido
where id_comeracial=(
select id from comercial
where nombre='Daniel' and apellido1='Sáez' and apellido2='Vega') ;
/**
┌────┬────────┬────────────┬────────────┬───────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comeracial │
├────┼────────┼────────────┼────────────┼───────────────┤
│ 3  │ 65.26  │ 2017-10-05 │ 2          │ 1             │
│ 6  │ 2400.6 │ 2016-07-27 │ 7          │ 1             │
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1             │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1             │
│ 13 │ 545.75 │ 2019-01-25 │ 6          │ 1             │
│ 14 │ 145.82 │ 2017-02-02 │ 6          │ 1             │
└────┴────────┴────────────┴────────────┴───────────────┘

* Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
**/
select * from cliente
where id=(
select id_cliente from pedido
where strftime('%Y', fecha)='2019'
order by total limit 1) ;
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categotia │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘

* Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
**/
select fecha, count(*) as cantidad from pedido
where id_cliente=(
    select id from cliente
    where nombre='Pepe' and apellido1='Ruiz'
    and apellido2='Santana'
);
/**
┌────────────┬──────────┐
│   fecha    │ cantidad │
├────────────┼──────────┤
│ 2016-08-17 │ 3        │
└────────────┴──────────┘
* Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.
**/
select c.*, p.* from cliente as c
join pedido as p on c.id=p.id_cliente
where c.id in(
    select id_cliente from pedido
    where strftime('%Y', fecha)='2017'
    and total>=(
        select avg(total) from pedido
        where strftime('%Y', fecha)='2017'
    )
);
/**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬───────────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categotia │ id │  total  │   fecha    │ id_cliente │ id_comeracial │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼───────────────┤
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1             │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1             │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6             │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1             │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴───────────────┘

## Subconsultas con IN y NOT IN

* Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
**/
select * from cliente 
where id not in(
    select id_cliente from pedido
);
/**
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categotia │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘

* Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
**/
select * from comercial
where id not in(
    select id_comeracial from pedido
);
/**
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘

## Subconsultas con EXISTS y NOT EXISTS

* Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
**/
select * from cliente
where not exists (
    select id_cliente from pedido
    where cliente.id=pedido.id_cliente
);
/**
┌────┬───────────┬───────────┬───────────┬─────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │ ciudad  │ categotia │
├────┼───────────┼───────────┼───────────┼─────────┼───────────┤
│ 9  │ Guillermo │ López     │ Gómez     │ Granada │ 225       │
│ 10 │ Daniel    │ Santana   │ Loyola    │ Sevilla │ 125       │
└────┴───────────┴───────────┴───────────┴─────────┴───────────┘

* Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
**/
select * from comercial
where not exists (
    select id_comeracial from pedido
    where pedido.id_comeracial=comercial.id
);
/**
┌────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼─────────┼───────────┼───────────┼───────────┤
│ 4  │ Marta   │ Herrera   │ Gil       │ 0.14      │
│ 8  │ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└────┴─────────┴───────────┴───────────┴───────────┘
**/
