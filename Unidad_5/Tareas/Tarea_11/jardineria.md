# Consultas a Realizar
## Consultas SQL sobre una tabla

* Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
```sql
select codigo_oficina, ciudad from oficina;┌────────────────┬──────────────────────┐
│ codigo_oficina │        ciudad        │
├────────────────┼──────────────────────┤
│ BCN-ES         │ Barcelona            │
│ BOS-USA        │ Boston               │
│ LON-UK         │ Londres              │
│ MAD-ES         │ Madrid               │
│ PAR-FR         │ Paris                │
│ SFC-USA        │ San Francisco        │
│ SYD-AU         │ Sydney               │
│ TAL-ES         │ Talavera de la Reina │
│ TOK-JP         │ Tokyo                │
└────────────────┴──────────────────────┘

```
* Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
```sql
select ciudad, telefono from oficina
where pais='España';
┌──────────────────────┬────────────────┐
│        ciudad        │    telefono    │
├──────────────────────┼────────────────┤
│ Barcelona            │ +34 93 3561182 │
│ Madrid               │ +34 91 7514487 │
│ Talavera de la Reina │ +34 925 867231 │
└──────────────────────┴────────────────┘
```
* Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
```sql
select nombre, apellido1, apellido2, email from empleado
where codigo_jefe='7';
┌─────────┬───────────┬───────────┬──────────────────────────┐
│ nombre  │ apellido1 │ apellido2 │          email           │
├─────────┼───────────┼───────────┼──────────────────────────┤
│ Mariano │ López     │ Murcia    │ mlopez@jardineria.es     │
│ Lucio   │ Campoamor │ Martín    │ lcampoamor@jardineria.es │
│ Hilario │ Rodriguez │ Huertas   │ hrodriguez@jardineria.es │
└─────────┴───────────┴───────────┴──────────────────────────┘
```
* Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
```sql
select puesto, nombre, apellido1, apellido2, email from empleado
where codigo_jefe is null;
┌──────────────────┬────────┬───────────┬───────────┬──────────────────────┐
│      puesto      │ nombre │ apellido1 │ apellido2 │        email         │
├──────────────────┼────────┼───────────┼───────────┼──────────────────────┤
│ Director General │ Marcos │ Magaña    │ Perez     │ marcos@jardineria.es │
└──────────────────┴────────┴───────────┴───────────┴──────────────────────┘
```
* Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
```sql
select puesto, nombre, apellido1, apellido2 from empleado 
where puesto!='Representante Ventas';
┌───────────────────────┬──────────┬────────────┬───────────┐
│        puesto         │  nombre  │ apellido1  │ apellido2 │
├───────────────────────┼──────────┼────────────┼───────────┤
│ Director General      │ Marcos   │ Magaña     │ Perez     │
│ Subdirector Marketing │ Ruben    │ López      │ Martinez  │
│ Subdirector Ventas    │ Alberto  │ Soria      │ Carrasco  │
│ Secretaria            │ Maria    │ Solís      │ Jerez     │
│ Director Oficina      │ Carlos   │ Soria      │ Jimenez   │
│ Director Oficina      │ Emmanuel │ Magaña     │ Perez     │
│ Director Oficina      │ Francois │ Fignon     │           │
│ Director Oficina      │ Michael  │ Bolton     │           │
│ Director Oficina      │ Hilary   │ Washington │           │
│ Director Oficina      │ Nei      │ Nishikori  │           │
│ Director Oficina      │ Amy      │ Johnson    │           │
│ Director Oficina      │ Kevin    │ Fallmer    │           │
└───────────────────────┴──────────┴────────────┴───────────┘
```
* Devuelve un listado con el nombre de los todos los clientes españoles.
```sql
select nombre_cliente from cliente
where pais='Spain';
┌────────────────────────────────┐
│         nombre_cliente         │
├────────────────────────────────┤
│ Lasas S.A.                     │
│ Beragua                        │
│ Club Golf Puerta del hierro    │
│ Naturagua                      │
│ DaraDistribuciones             │
│ Madrileña de riegos            │
│ Lasas S.A.                     │
│ Camunas Jardines S.L.          │
│ Dardena S.A.                   │
│ Jardin de Flores               │
│ Flores Marivi                  │
│ Flowers, S.A                   │
│ Naturajardin                   │
│ Golf S.A.                      │
│ Americh Golf Management SL     │
│ Aloha                          │
│ El Prat                        │
│ Sotogrande                     │
│ Vivero Humanes                 │
│ Fuenla City                    │
│ Jardines y Mansiones Cactus SL │
│ Jardinerías Matías SL          │
│ Agrojardin                     │
│ Top Campo                      │
│ Jardineria Sara                │
│ Campohermoso                   │
│ Flores S.L.                    │
└────────────────────────────────┘
```
* Devuelve un listado con los distintos estados por los que puede pasar un pedido.
```sql
select distinct(estado) from pedido;
┌───────────┐
│  estado   │
├───────────┤
│ Entregado │
│ Rechazado │
│ Pendiente │
└───────────┘
```
* Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos.
```sql
select distinct(codigo_cliente) from pago
where fecha_pago regexp '^2008';
┌────────────────┐
│ codigo_cliente │
├────────────────┤
│ 1              │
│ 13             │
│ 14             │
│ 26             │
└────────────────┘
```
* Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
```sql
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido
where fecha_entrega!=fecha_esperada limit 15;
┌───────────────┬────────────────┬────────────────┬───────────────┐
│ codigo_pedido │ codigo_cliente │ fecha_esperada │ fecha_entrega │
├───────────────┼────────────────┼────────────────┼───────────────┤
│ 2             │ 5              │ 2007-10-28     │ 2007-10-26    │
│ 9             │ 1              │ 2008-12-27     │ 2008-12-28    │
│ 13            │ 7              │ 2009-01-14     │ 2009-01-15    │
│ 15            │ 7              │ 2009-01-12     │ 2009-01-11    │
│ 16            │ 7              │ 2009-01-07     │ 2009-01-15    │
│ 17            │ 7              │ 2009-01-09     │ 2009-01-11    │
│ 18            │ 9              │ 2009-01-06     │ 2009-01-07    │
│ 22            │ 9              │ 2009-01-11     │ 2009-01-13    │
│ 24            │ 14             │ 2008-07-31     │ 2008-07-25    │
│ 28            │ 3              │ 2009-02-17     │ 2009-02-20    │
│ 30            │ 13             │ 2008-09-03     │ 2008-08-31    │
│ 31            │ 13             │ 2008-09-30     │ 2008-10-04    │
│ 32            │ 4              │ 2007-01-19     │ 2007-01-27    │
│ 36            │ 14             │ 2008-12-15     │ 2008-12-10    │
│ 38            │ 19             │ 2009-03-06     │ 2009-03-07    │
└───────────────┴────────────────┴────────────────┴───────────────┘
```
* Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
```sql

```
* Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
```sql 
select * from pedido 
where estado='Rechazado' and fecha_entrega regexp '^2009';
┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬───────────────────────────────────────────────────────────┬────────────────┐
│ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                        comentarios                        │ codigo_cliente │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼───────────────────────────────────────────────────────────┼────────────────┤
│ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                                  │ 9              │
│ 40            │ 2009-03-09   │ 2009-03-10     │ 2009-03-13    │ Rechazado │                                                           │ 19             │
│ 46            │ 2009-04-03   │ 2009-03-04     │ 2009-03-05    │ Rechazado │                                                           │ 23             │
│ 113           │ 2008-10-28   │ 2008-11-09     │ 2009-01-09    │ Rechazado │ El producto ha sido rechazado por la tardanza de el envio │ 36             │
└───────────────┴──────────────┴────────────────┴───────────────┴───────────┴───────────────────────────────────────────────────────────┴────────────────┘
```
* Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
```sql
select * from pedido
where fecha_entrega regexp '-01-' limit 15;
┌───────────────┬──────────────┬────────────────┬───────────────┬───────────┬─────────────────────────────────────────────────────┬────────────────┐
│ codigo_pedido │ fecha_pedido │ fecha_esperada │ fecha_entrega │  estado   │                     comentarios                     │ codigo_cliente │
├───────────────┼──────────────┼────────────────┼───────────────┼───────────┼─────────────────────────────────────────────────────┼────────────────┤
│ 1             │ 2006-01-17   │ 2006-01-19     │ 2006-01-19    │ Entregado │ Pagado a plazos                                     │ 5              │
│ 13            │ 2009-01-12   │ 2009-01-14     │ 2009-01-15    │ Entregado │                                                     │ 7              │
│ 15            │ 2009-01-09   │ 2009-01-12     │ 2009-01-11    │ Entregado │                                                     │ 7              │
│ 16            │ 2009-01-06   │ 2009-01-07     │ 2009-01-15    │ Entregado │                                                     │ 7              │
│ 17            │ 2009-01-08   │ 2009-01-09     │ 2009-01-11    │ Entregado │ mal estado                                          │ 7              │
│ 18            │ 2009-01-05   │ 2009-01-06     │ 2009-01-07    │ Entregado │                                                     │ 9              │
│ 21            │ 2009-01-09   │ 2009-01-09     │ 2009-01-09    │ Rechazado │ mal pago                                            │ 9              │
│ 22            │ 2009-01-11   │ 2009-01-11     │ 2009-01-13    │ Entregado │                                                     │ 9              │
│ 32            │ 2007-01-07   │ 2007-01-19     │ 2007-01-27    │ Entregado │ Entrega tardia, el cliente puso reclamacion         │ 4              │
│ 55            │ 2008-12-10   │ 2009-01-10     │ 2009-01-11    │ Entregado │ Retrasado 1 dia por problemas de transporte         │ 14             │
│ 58            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                       │ 3              │
│ 64            │ 2009-01-24   │ 2009-01-31     │ 2009-01-30    │ Entregado │ Todo correcto                                       │ 1              │
│ 75            │ 2009-01-11   │ 2009-01-13     │ 2009-01-13    │ Entregado │ El pedido llego perfectamente                       │ 15             │
│ 79            │ 2009-01-12   │ 2009-01-13     │ 2009-01-13    │ Entregado │                                                     │ 28             │
│ 82            │ 2009-01-20   │ 2009-01-29     │ 2009-01-29    │ Entregado │ El pedido llego un poco mas tarde de la hora fijada │ 28             │
└───────────────┴──────────────┴────────────────┴───────────────┴───────────┴─────────────────────────────────────────────────────┴────────────────┘
```
* Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
```sql
select * from pago
where forma_pago='PayPal' and fecha_pago regexp '^2008'
order by total desc;
┌────────────────┬────────────┬────────────────┬────────────┬───────┐
│ codigo_cliente │ forma_pago │ id_transaccion │ fecha_pago │ total │
├────────────────┼────────────┼────────────────┼────────────┼───────┤
│ 26             │ PayPal     │ ak-std-000020  │ 2008-03-18 │ 18846 │
│ 14             │ PayPal     │ ak-std-000015  │ 2008-07-15 │ 4160  │
│ 13             │ PayPal     │ ak-std-000014  │ 2008-08-04 │ 2246  │
│ 1              │ PayPal     │ ak-std-000001  │ 2008-11-10 │ 2000  │
│ 1              │ PayPal     │ ak-std-000002  │ 2008-12-10 │ 2000  │
└────────────────┴────────────┴────────────────┴────────────┴───────┘
```
* Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
```sql
select distinct(forma_pago) from pago;
┌───────────────┐
│  forma_pago   │
├───────────────┤
│ PayPal        │
│ Transferencia │
│ Cheque        │
└───────────────┘
```
* Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
```sql
select * from producto 
where gama='Ornamentales' and cantidad_en_stock>100 limit 15;
┌─────────────────┬──────────────────────────────────────────────┬──────────────┬─────────────┬──────────────────┬───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┬───────────────────┬──────────────┬──────────────────┐
│ codigo_producto │                    nombre                    │     gama     │ dimensiones │    proveedor     │                                                                                                                                                                                descripcion                                                                                                                                                                                │ cantidad_en_stock │ precio_venta │ precio_proveedor │
├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ OR-112          │ Escallonia (Mix)                             │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5            │ 4                │
│ OR-113          │ Evonimus Emerald Gayeti                      │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5            │ 4                │
│ OR-114          │ Evonimus Pulchellus                          │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5            │ 4                │
│ OR-115          │ Forsytia Intermedia \"Lynwood\"              │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 7            │ 5                │
│ OR-116          │ Hibiscus Syriacus  \"Diana\" -Blanco Puro    │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. │ 120               │ 7            │ 5                │
│ OR-117          │ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. │ 120               │ 7            │ 5                │
│ OR-118          │ Hibiscus Syriacus \"Pink Giant\" Rosa        │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente moldeadas como bonsái en el transcurso de pocos años. Flores de muchos colores según la variedad, desde el blanco puro al rojo intenso, del amarillo al anaranjado. La flor apenas dura 1 día, pero continuamente aparecen nuevas y la floración se prolonga durante todo el periodo de crecimiento vegetativo. │ 120               │ 7            │ 5                │
│ OR-119          │ Laurus Nobilis Arbusto - Ramificado Bajo     │ Ornamentales │ 40-50       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5            │ 4                │
│ OR-120          │ Lonicera Nitida                              │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5            │ 4                │
│ OR-121          │ Lonicera Nitida \"Maigrum\"                  │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5            │ 4                │
│ OR-122          │ Lonicera Pileata                             │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5            │ 4                │
│ OR-123          │ Philadelphus \"Virginal\"                    │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5            │ 4                │
│ OR-124          │ Prunus pisardii                              │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5            │ 4                │
│ OR-125          │ Viburnum Tinus \"Eve Price\"                 │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5            │ 4                │
│ OR-126          │ Weigelia \"Bristol Ruby\"                    │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                                                                                                                                                                                                                                                                                                                                           │ 120               │ 5            │ 4                │
└─────────────────┴──────────────────────────────────────────────┴──────────────┴─────────────┴──────────────────┴───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┴───────────────────┴──────────────┴──────────────────┘
```
* Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
```sql
select * from cliente
where ciudad='Madrid' and codigo_empleado_rep_ventas regexp '^11|30';
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬───────────┬───────────┬───────────────────┬──────────────────┬────────┬────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │ telefono  │    fax    │ linea_direccion1  │ linea_direccion2 │ ciudad │ region │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼───────────┼───────────┼───────────────────┼──────────────────┼────────┼────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 7              │ Beragua                     │ Jose            │ Bermejo           │ 654987321 │ 916549872 │ C/pintor segundo  │ Getafe           │ Madrid │ Madrid │ Spain │ 28942         │ 11                         │ 20000          │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810  │ 919535678 │ C/sinesio delgado │ Madrid           │ Madrid │ Madrid │ Spain │ 28930         │ 11                         │ 40000          │
│ 9              │ Naturagua                   │ Guillermo       │ Rengifo           │ 689234750 │ 916428956 │ C/majadahonda     │ Boadilla         │ Madrid │ Madrid │ Spain │ 28947         │ 11                         │ 32000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001 │ 916421756 │ C/azores          │ Fuenlabrada      │ Madrid │ Madrid │ Spain │ 28946         │ 11                         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045 │ 916689215 │ C/Lagañas         │ Fuenlabrada      │ Madrid │ Madrid │ Spain │ 28943         │ 11                         │ 20000          │
│ 15             │ Jardin de Flores            │ Javier          │ Villar            │ 654865643 │ 914538776 │ C/ Oña 34         │                  │ Madrid │ Madrid │ Spain │ 28950         │ 30                         │ 40000          │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529 │ 916548735 │ Plaza Magallón 15 │                  │ Madrid │ Madrid │ Spain │ 28011         │ 30                         │ 5050           │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴───────────┴───────────┴───────────────────┴──────────────────┴────────┴────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```

## Consultas multitabla (Where para unir tablas)

* Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
```sql
select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2 from cliente as c, empleado as e
where e.codigo_empleado=c.codigo_empleado_rep_ventas limit 15;
┌─────────────────────────────┬─────────────────┬────────────┬───────────┐
│       nombre_cliente        │     nombre      │ apellido1  │ apellido2 │
├─────────────────────────────┼─────────────────┼────────────┼───────────┤
│ GoldFish Garden             │ Walter Santiago │ Sanchez    │ Lopez     │
│ Gardening Associates        │ Walter Santiago │ Sanchez    │ Lopez     │
│ Gerudo Valley               │ Lorena          │ Paxton     │           │
│ Tendo Garden                │ Lorena          │ Paxton     │           │
│ Lasas S.A.                  │ Mariano         │ López      │ Murcia    │
│ Beragua                     │ Emmanuel        │ Magaña     │ Perez     │
│ Club Golf Puerta del hierro │ Emmanuel        │ Magaña     │ Perez     │
│ Naturagua                   │ Emmanuel        │ Magaña     │ Perez     │
│ DaraDistribuciones          │ Emmanuel        │ Magaña     │ Perez     │
│ Madrileña de riegos         │ Emmanuel        │ Magaña     │ Perez     │
│ Lasas S.A.                  │ Mariano         │ López      │ Murcia    │
│ Camunas Jardines S.L.       │ Mariano         │ López      │ Murcia    │
│ Dardena S.A.                │ Mariano         │ López      │ Murcia    │
│ Jardin de Flores            │ Julian          │ Bellinelli │           │
│ Flores Marivi               │ Felipe          │ Rosas      │ Marquez   │
└─────────────────────────────┴─────────────────┴────────────┴───────────┘
```
* Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
```sql
select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2 from cliente as c, empleado as e, pago as p
where e.codigo_empleado=c.codigo_empleado_rep_ventas
and p.codigo_cliente=c.codigo_cliente
limit 15;
┌───────────────────────┬─────────────────┬───────────┬───────────┐
│    nombre_cliente     │     nombre      │ apellido1 │ apellido2 │
├───────────────────────┼─────────────────┼───────────┼───────────┤
│ GoldFish Garden       │ Walter Santiago │ Sanchez   │ Lopez     │
│ GoldFish Garden       │ Walter Santiago │ Sanchez   │ Lopez     │
│ Gardening Associates  │ Walter Santiago │ Sanchez   │ Lopez     │
│ Gardening Associates  │ Walter Santiago │ Sanchez   │ Lopez     │
│ Gardening Associates  │ Walter Santiago │ Sanchez   │ Lopez     │
│ Gerudo Valley         │ Lorena          │ Paxton    │           │
│ Gerudo Valley         │ Lorena          │ Paxton    │           │
│ Gerudo Valley         │ Lorena          │ Paxton    │           │
│ Gerudo Valley         │ Lorena          │ Paxton    │           │
│ Gerudo Valley         │ Lorena          │ Paxton    │           │
│ Tendo Garden          │ Lorena          │ Paxton    │           │
│ Beragua               │ Emmanuel        │ Magaña    │ Perez     │
│ Naturagua             │ Emmanuel        │ Magaña    │ Perez     │
│ Camunas Jardines S.L. │ Mariano         │ López     │ Murcia    │
│ Dardena S.A.          │ Mariano         │ López     │ Murcia    │
└───────────────────────┴─────────────────┴───────────┴───────────┘
```
* Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
```sql
select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2 from cliente as c, empleado as e 
where e.codigo_empleado=c.codigo_empleado_rep_ventas
and c.codigo_cliente not in(select codigo_cliente from pago);
┌─────────────────────────────┬─────────────┬────────────┬───────────┐
│       nombre_cliente        │   nombre    │ apellido1  │ apellido2 │
├─────────────────────────────┼─────────────┼────────────┼───────────┤
│ Lasas S.A.                  │ Mariano     │ López      │ Murcia    │
│ Club Golf Puerta del hierro │ Emmanuel    │ Magaña     │ Perez     │
│ DaraDistribuciones          │ Emmanuel    │ Magaña     │ Perez     │
│ Madrileña de riegos         │ Emmanuel    │ Magaña     │ Perez     │
│ Lasas S.A.                  │ Mariano     │ López      │ Murcia    │
│ Flowers, S.A                │ Felipe      │ Rosas      │ Marquez   │
│ Naturajardin                │ Julian      │ Bellinelli │           │
│ Americh Golf Management SL  │ José Manuel │ Martinez   │ De la Osa │
│ Aloha                       │ José Manuel │ Martinez   │ De la Osa │
│ El Prat                     │ José Manuel │ Martinez   │ De la Osa │
│ Vivero Humanes              │ Julian      │ Bellinelli │           │
│ Fuenla City                 │ Felipe      │ Rosas      │ Marquez   │
│ Top Campo                   │ Felipe      │ Rosas      │ Marquez   │
│ Campohermoso                │ Julian      │ Bellinelli │           │
│ france telecom              │ Lionel      │ Narvaez    │           │
│ Musée du Louvre             │ Lionel      │ Narvaez    │           │
│ Flores S.L.                 │ Michael     │ Bolton     │           │
│ The Magic Garden            │ Michael     │ Bolton     │           │
└─────────────────────────────┴─────────────┴────────────┴───────────┘
```
* Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
```sql
select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad from cliente as c, empleado as e, pago as p, oficina as o
where e.codigo_empleado=c.codigo_empleado_rep_ventas
and c.codigo_cliente=p.codigo_cliente
and o.codigo_oficina=e.codigo_oficina limit 15;
┌───────────────────────┬─────────────────┬───────────┬───────────┬───────────────┐
│    nombre_cliente     │     nombre      │ apellido1 │ apellido2 │    ciudad     │
├───────────────────────┼─────────────────┼───────────┼───────────┼───────────────┤
│ GoldFish Garden       │ Walter Santiago │ Sanchez   │ Lopez     │ San Francisco │
│ GoldFish Garden       │ Walter Santiago │ Sanchez   │ Lopez     │ San Francisco │
│ Gardening Associates  │ Walter Santiago │ Sanchez   │ Lopez     │ San Francisco │
│ Gardening Associates  │ Walter Santiago │ Sanchez   │ Lopez     │ San Francisco │
│ Gardening Associates  │ Walter Santiago │ Sanchez   │ Lopez     │ San Francisco │
│ Gerudo Valley         │ Lorena          │ Paxton    │           │ Boston        │
│ Gerudo Valley         │ Lorena          │ Paxton    │           │ Boston        │
│ Gerudo Valley         │ Lorena          │ Paxton    │           │ Boston        │
│ Gerudo Valley         │ Lorena          │ Paxton    │           │ Boston        │
│ Gerudo Valley         │ Lorena          │ Paxton    │           │ Boston        │
│ Tendo Garden          │ Lorena          │ Paxton    │           │ Boston        │
│ Beragua               │ Emmanuel        │ Magaña    │ Perez     │ Barcelona     │
│ Naturagua             │ Emmanuel        │ Magaña    │ Perez     │ Barcelona     │
│ Camunas Jardines S.L. │ Mariano         │ López     │ Murcia    │ Madrid        │
│ Dardena S.A.          │ Mariano         │ López     │ Murcia    │ Madrid        │
└───────────────────────┴─────────────────┴───────────┴───────────┴───────────────┘
```
* Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
```sql
select c.nombre_cliente, e.nombre, e.apellido1, e.apellido2, o.ciudad from cliente as c, empleado as e, oficina as o
where e.codigo_empleado=c.codigo_empleado_rep_ventas
and o.codigo_oficina=e.codigo_oficina 
and c.codigo_cliente not in(select codigo_cliente from pago);
┌─────────────────────────────┬─────────────┬────────────┬───────────┬──────────────────────┐
│       nombre_cliente        │   nombre    │ apellido1  │ apellido2 │        ciudad        │
├─────────────────────────────┼─────────────┼────────────┼───────────┼──────────────────────┤
│ Lasas S.A.                  │ Mariano     │ López      │ Murcia    │ Madrid               │
│ Club Golf Puerta del hierro │ Emmanuel    │ Magaña     │ Perez     │ Barcelona            │
│ DaraDistribuciones          │ Emmanuel    │ Magaña     │ Perez     │ Barcelona            │
│ Madrileña de riegos         │ Emmanuel    │ Magaña     │ Perez     │ Barcelona            │
│ Lasas S.A.                  │ Mariano     │ López      │ Murcia    │ Madrid               │
│ Flowers, S.A                │ Felipe      │ Rosas      │ Marquez   │ Talavera de la Reina │
│ Naturajardin                │ Julian      │ Bellinelli │           │ Sydney               │
│ Americh Golf Management SL  │ José Manuel │ Martinez   │ De la Osa │ Barcelona            │
│ Aloha                       │ José Manuel │ Martinez   │ De la Osa │ Barcelona            │
│ El Prat                     │ José Manuel │ Martinez   │ De la Osa │ Barcelona            │
│ Vivero Humanes              │ Julian      │ Bellinelli │           │ Sydney               │
│ Fuenla City                 │ Felipe      │ Rosas      │ Marquez   │ Talavera de la Reina │
│ Top Campo                   │ Felipe      │ Rosas      │ Marquez   │ Talavera de la Reina │
│ Campohermoso                │ Julian      │ Bellinelli │           │ Sydney               │
│ france telecom              │ Lionel      │ Narvaez    │           │ Paris                │
│ Musée du Louvre             │ Lionel      │ Narvaez    │           │ Paris                │
│ Flores S.L.                 │ Michael     │ Bolton     │           │ San Francisco        │
│ The Magic Garden            │ Michael     │ Bolton     │           │ San Francisco        │
└─────────────────────────────┴─────────────┴────────────┴───────────┴──────────────────────┘
```
* Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
```sql
select o.linea_direccion1, o.linea_direccion2 from oficina as o, cliente as c, empleado as e
where o.codigo_oficina=e.codigo_oficina and e.codigo_empleado=c.codigo_empleado_rep_ventas
and c.region='Fuenlabrada';
┌───────────────────┬──────────────────┐
│ linea_direccion1  │ linea_direccion2 │
├───────────────────┼──────────────────┤
│ 100 Market Street │ Suite 300        │
└───────────────────┴──────────────────┘
```
* Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
```sql
select c.nombre_cliente, e.nombre, o.ciudad from cliente as c, empleado as e, oficina as o
where e.codigo_empleado=c.codigo_empleado_rep_ventas
and o.codigo_oficina=e.codigo_oficina limit 15;
┌─────────────────────────────┬─────────────────┬──────────────────────┐
│       nombre_cliente        │     nombre      │        ciudad        │
├─────────────────────────────┼─────────────────┼──────────────────────┤
│ GoldFish Garden             │ Walter Santiago │ San Francisco        │
│ Gardening Associates        │ Walter Santiago │ San Francisco        │
│ Gerudo Valley               │ Lorena          │ Boston               │
│ Tendo Garden                │ Lorena          │ Boston               │
│ Lasas S.A.                  │ Mariano         │ Madrid               │
│ Beragua                     │ Emmanuel        │ Barcelona            │
│ Club Golf Puerta del hierro │ Emmanuel        │ Barcelona            │
│ Naturagua                   │ Emmanuel        │ Barcelona            │
│ DaraDistribuciones          │ Emmanuel        │ Barcelona            │
│ Madrileña de riegos         │ Emmanuel        │ Barcelona            │
│ Lasas S.A.                  │ Mariano         │ Madrid               │
│ Camunas Jardines S.L.       │ Mariano         │ Madrid               │
│ Dardena S.A.                │ Mariano         │ Madrid               │
│ Jardin de Flores            │ Julian          │ Sydney               │
│ Flores Marivi               │ Felipe          │ Talavera de la Reina │
└─────────────────────────────┴─────────────────┴──────────────────────┘
```
* Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
```sql

```
* Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
```sql

```
* Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
```sql
select c.nombre_cliente from cliente as c, pedido as p
where c.codigo_cliente=p.codigo_cliente 
and p.fecha_esperada!=fecha_entrega limit 15;
┌───────────────────────┐
│    nombre_cliente     │
├───────────────────────┤
│ Tendo Garden          │
│ GoldFish Garden       │
│ Beragua               │
│ Beragua               │
│ Beragua               │
│ Beragua               │
│ Naturagua             │
│ Naturagua             │
│ Dardena S.A.          │
│ Gardening Associates  │
│ Camunas Jardines S.L. │
│ Camunas Jardines S.L. │
│ Gerudo Valley         │
│ Dardena S.A.          │
│ Golf S.A.             │
└───────────────────────┘
```
* Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
```sql

```

## Consultas multitabla (inner join)

* Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql
select * from cliente 
where codigo_cliente not in(
    select c.codigo_cliente from cliente as c
    join pago as p on c.codigo_cliente=p.codigo_cliente
)
limit 15;
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬────────────────┬────────────────┬──────────────────────────┬──────────────────┬──────────────────────┬───────────┬────────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │    telefono    │      fax       │     linea_direccion1     │ linea_direccion2 │        ciudad        │  region   │  pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼────────────────┼────────────────┼──────────────────────────┼──────────────────┼──────────────────────┼───────────┼────────┼───────────────┼────────────────────────────┼────────────────┤
│ 6              │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid    │ Spain  │ 28945         │ 8                          │ 154310         │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810       │ 919535678      │ C/sinesio delgado        │ Madrid           │ Madrid               │ Madrid    │ Spain  │ 28930         │ 11                         │ 40000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001      │ 916421756      │ C/azores                 │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain  │ 28946         │ 11                         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045      │ 916689215      │ C/Lagañas                │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain  │ 28943         │ 11                         │ 20000          │
│ 12             │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid    │ Spain  │ 28945         │ 8                          │ 154310         │
│ 17             │ Flowers, S.A                │ Beatriz         │ Fernandez         │ 698754159      │ 978453216      │ C/Luis Salquillo4        │                  │ Montornes del valles │ Barcelona │ Spain  │ 24586         │ 5                          │ 3500           │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529      │ 916548735      │ Plaza Magallón 15        │                  │ Madrid               │ Madrid    │ Spain  │ 28011         │ 30                         │ 5050           │
│ 20             │ Americh Golf Management SL  │ Mario           │ Suarez            │ 964493072      │ 964493063      │ C/Letardo                │                  │ Barcelona            │ Cataluña  │ Spain  │ 12320         │ 12                         │ 20000          │
│ 21             │ Aloha                       │ Cristian        │ Rodrigez          │ 916485852      │ 914489898      │ C/Roman 3                │                  │ Canarias             │ Canarias  │ Spain  │ 35488         │ 12                         │ 50000          │
│ 22             │ El Prat                     │ Francisco       │ Camacho           │ 916882323      │ 916493211      │ Avenida Tibidabo         │                  │ Barcelona            │ Cataluña  │ Spain  │ 12320         │ 12                         │ 30000          │
│ 24             │ Vivero Humanes              │ Federico        │ Gomez             │ 654987690      │ 916040875      │ C/Miguel Echegaray 54    │                  │ Humanes              │ Madrid    │ Spain  │ 28970         │ 30                         │ 7430           │
│ 25             │ Fuenla City                 │ Tony            │ Muñoz Mena        │ 675842139      │ 915483754      │ C/Callo 52               │                  │ Fuenlabrada          │ Madrid    │ Spain  │ 28574         │ 5                          │ 4500           │
│ 29             │ Top Campo                   │ Joseluis        │ Sanchez           │ 685746512      │ 974315924      │ C/Ibiza 32               │                  │ Humanes              │ Madrid    │ Spain  │ 28574         │ 5                          │ 5500           │
│ 31             │ Campohermoso                │ Luis            │ Jimenez           │ 645925376      │ 916159116      │ C/Peru 78                │                  │ Fuenlabrada          │ Madrid    │ Spain  │ 28945         │ 30                         │ 3250           │
│ 32             │ france telecom              │ FraÃ§ois        │ Toulou            │ (33)5120578961 │ (33)5120578961 │ 6 place d Alleray 15Ã¨me │                  │ Paris                │           │ France │ 75010         │ 16                         │ 10000          │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴────────────────┴────────────────┴──────────────────────────┴──────────────────┴──────────────────────┴───────────┴────────┴───────────────┴────────────────────────────┴────────────────┘
```
* Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
```sql
select * from cliente 
where codigo_cliente not in(
    select c.codigo_cliente from cliente as c
    join pedido as p on c.codigo_cliente=p.codigo_cliente
)
limit 15;┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬────────────────┬────────────────┬──────────────────────────┬──────────────────┬──────────────────────┬───────────┬────────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │    telefono    │      fax       │     linea_direccion1     │ linea_direccion2 │        ciudad        │  region   │  pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼────────────────┼────────────────┼──────────────────────────┼──────────────────┼──────────────────────┼───────────┼────────┼───────────────┼────────────────────────────┼────────────────┤
│ 6              │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid    │ Spain  │ 28945         │ 8                          │ 154310         │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810       │ 919535678      │ C/sinesio delgado        │ Madrid           │ Madrid               │ Madrid    │ Spain  │ 28930         │ 11                         │ 40000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001      │ 916421756      │ C/azores                 │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain  │ 28946         │ 11                         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045      │ 916689215      │ C/Lagañas                │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain  │ 28943         │ 11                         │ 20000          │
│ 12             │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145    │ 34914851312    │ C/Leganes 15             │                  │ Fuenlabrada          │ Madrid    │ Spain  │ 28945         │ 8                          │ 154310         │
│ 17             │ Flowers, S.A                │ Beatriz         │ Fernandez         │ 698754159      │ 978453216      │ C/Luis Salquillo4        │                  │ Montornes del valles │ Barcelona │ Spain  │ 24586         │ 5                          │ 3500           │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529      │ 916548735      │ Plaza Magallón 15        │                  │ Madrid               │ Madrid    │ Spain  │ 28011         │ 30                         │ 5050           │
│ 20             │ Americh Golf Management SL  │ Mario           │ Suarez            │ 964493072      │ 964493063      │ C/Letardo                │                  │ Barcelona            │ Cataluña  │ Spain  │ 12320         │ 12                         │ 20000          │
│ 21             │ Aloha                       │ Cristian        │ Rodrigez          │ 916485852      │ 914489898      │ C/Roman 3                │                  │ Canarias             │ Canarias  │ Spain  │ 35488         │ 12                         │ 50000          │
│ 22             │ El Prat                     │ Francisco       │ Camacho           │ 916882323      │ 916493211      │ Avenida Tibidabo         │                  │ Barcelona            │ Cataluña  │ Spain  │ 12320         │ 12                         │ 30000          │
│ 24             │ Vivero Humanes              │ Federico        │ Gomez             │ 654987690      │ 916040875      │ C/Miguel Echegaray 54    │                  │ Humanes              │ Madrid    │ Spain  │ 28970         │ 30                         │ 7430           │
│ 25             │ Fuenla City                 │ Tony            │ Muñoz Mena        │ 675842139      │ 915483754      │ C/Callo 52               │                  │ Fuenlabrada          │ Madrid    │ Spain  │ 28574         │ 5                          │ 4500           │
│ 29             │ Top Campo                   │ Joseluis        │ Sanchez           │ 685746512      │ 974315924      │ C/Ibiza 32               │                  │ Humanes              │ Madrid    │ Spain  │ 28574         │ 5                          │ 5500           │
│ 31             │ Campohermoso                │ Luis            │ Jimenez           │ 645925376      │ 916159116      │ C/Peru 78                │                  │ Fuenlabrada          │ Madrid    │ Spain  │ 28945         │ 30                         │ 3250           │
│ 32             │ france telecom              │ FraÃ§ois        │ Toulou            │ (33)5120578961 │ (33)5120578961 │ 6 place d Alleray 15Ã¨me │                  │ Paris                │           │ France │ 75010         │ 16                         │ 10000          │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴────────────────┴────────────────┴──────────────────────────┴──────────────────┴──────────────────────┴───────────┴────────┴───────────────┴────────────────────────────┴────────────────┘

```

* Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
```sql

```
* Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
```sql

```
* Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
```sql
select * from empleado 
where codigo_empleado not in (
    select codigo_empleado_rep_ventas from cliente
) limit 15;
┌─────────────────┬─────────────┬────────────┬───────────┬───────────┬───────────────────────────┬────────────────┬─────────────┬───────────────────────┐
│ codigo_empleado │   nombre    │ apellido1  │ apellido2 │ extension │           email           │ codigo_oficina │ codigo_jefe │        puesto         │
├─────────────────┼─────────────┼────────────┼───────────┼───────────┼───────────────────────────┼────────────────┼─────────────┼───────────────────────┤
│ 1               │ Marcos      │ Magaña     │ Perez     │ 3897      │ marcos@jardineria.es      │ TAL-ES         │             │ Director General      │
│ 2               │ Ruben       │ López      │ Martinez  │ 2899      │ rlopez@jardineria.es      │ TAL-ES         │ 1           │ Subdirector Marketing │
│ 3               │ Alberto     │ Soria      │ Carrasco  │ 2837      │ asoria@jardineria.es      │ TAL-ES         │ 2           │ Subdirector Ventas    │
│ 4               │ Maria       │ Solís      │ Jerez     │ 2847      │ msolis@jardineria.es      │ TAL-ES         │ 2           │ Secretaria            │
│ 6               │ Juan Carlos │ Ortiz      │ Serrano   │ 2845      │ cortiz@jardineria.es      │ TAL-ES         │ 3           │ Representante Ventas  │
│ 7               │ Carlos      │ Soria      │ Jimenez   │ 2444      │ csoria@jardineria.es      │ MAD-ES         │ 3           │ Director Oficina      │
│ 10              │ Hilario     │ Rodriguez  │ Huertas   │ 2444      │ hrodriguez@jardineria.es  │ MAD-ES         │ 7           │ Representante Ventas  │
│ 13              │ David       │ Palma      │ Aceituno  │ 2519      │ dpalma@jardineria.es      │ BCN-ES         │ 11          │ Representante Ventas  │
│ 14              │ Oscar       │ Palma      │ Aceituno  │ 2519      │ opalma@jardineria.es      │ BCN-ES         │ 11          │ Representante Ventas  │
│ 15              │ Francois    │ Fignon     │           │ 9981      │ ffignon@gardening.com     │ PAR-FR         │ 3           │ Director Oficina      │
│ 17              │ Laurent     │ Serra      │           │ 9982      │ lserra@gardening.com      │ PAR-FR         │ 15          │ Representante Ventas  │
│ 20              │ Hilary      │ Washington │           │ 7565      │ hwashington@gardening.com │ BOS-USA        │ 3           │ Director Oficina      │
│ 21              │ Marcus      │ Paxton     │           │ 7565      │ mpaxton@gardening.com     │ BOS-USA        │ 20          │ Representante Ventas  │
│ 23              │ Nei         │ Nishikori  │           │ 8734      │ nnishikori@gardening.com  │ TOK-JP         │ 3           │ Director Oficina      │
│ 24              │ Narumi      │ Riko       │           │ 8734      │ nriko@gardening.com       │ TOK-JP         │ 23          │ Representante Ventas  │
└─────────────────┴─────────────┴────────────┴───────────┴───────────┴───────────────────────────┴────────────────┴─────────────┴───────────────────────┘
```
* Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
```sql

```
* Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
```sql

```
    Devuelve un listado de los productos que nunca han aparecido en un pedido.
    Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.
    Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
    Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
    Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

Consultas resumen (count,avg,...)

* ¿Cuántos empleados hay en la compañía?
```sql
select count(*) from empleado;
┌──────────┐
│ count(*) │
├──────────┤
│ 31       │
└──────────┘
```
* ¿Cuántos clientes tiene cada país?
```sql
select count(*) as num, pais from cliente
group by pais;
┌─────┬────────────────┐
│ num │      pais      │
├─────┼────────────────┤
│ 2   │ Australia      │
│ 2   │ France         │
│ 27  │ Spain          │
│ 4   │ USA            │
│ 1   │ United Kingdom │
└─────┴────────────────┘
```
* ¿Cuál fue el pago medio en 2009?
```sql
select avg(total) as medio from pago
where fecha_pago regexp '^2009';
┌──────────────────┐
│      medio       │
├──────────────────┤
│ 4504.07692307692 │
└──────────────────┘
```
* ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
```sql
select count(*) as num, estado from pedido
group by estado
order by num desc;
┌─────┬───────────┐
│ num │  estado   │
├─────┼───────────┤
│ 61  │ Entregado │
│ 30  │ Pendiente │
│ 24  │ Rechazado │
└─────┴───────────┘
```
* Calcula el precio de venta del producto más caro y más barato en una misma consulta.
```sql
select max(precio_venta)+min(precio_venta) as num from producto;
┌─────┐
│ num │
├─────┤
│ 463 │
└─────┘
```
* Calcula el número de clientes que tiene la empresa.
```sql
select count(*) as num from cliente;
┌─────┐
│ num │
├─────┤
│ 36  │
└─────┘
```
* ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
```sql
select count(*) as num from cliente
where ciudad='Madrid';
┌─────┐
│ num │
├─────┤
│ 11  │
└─────┘
```
* ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
```sql
select count(*) as num, ciudad from cliente
where ciudad regexp '^M'
group by ciudad;
┌─────┬──────────────────────┐
│ num │        ciudad        │
├─────┼──────────────────────┤
│ 11  │ Madrid               │
│ 2   │ Miami                │
│ 1   │ Montornes del valles │
└─────┴──────────────────────┘
```
* Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
```sql
select count(c.codigo_cliente) as num, e.nombre from cliente as c, empleado as e
where c.codigo_empleado_rep_ventas=e.codigo_empleado
group by c.codigo_empleado_rep_ventas;
┌─────┬─────────────────┐
│ num │     nombre      │
├─────┼─────────────────┤
│ 5   │ Felipe          │
│ 4   │ Mariano         │
│ 2   │ Lucio           │
│ 5   │ Emmanuel        │
│ 5   │ José Manuel     │
│ 2   │ Lionel          │
│ 2   │ Michael         │
│ 2   │ Walter Santiago │
│ 2   │ Lorena          │
│ 5   │ Julian          │
│ 2   │ Mariko          │
└─────┴─────────────────┘
```
* Calcula el número de clientes que no tiene asignado representante de ventas.
```sql
select count(*) as num from cliente
where codigo_empleado_rep_ventas is null;
┌─────┐
│ num │
├─────┤
│ 0   │
└─────┘
```
* Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
```sql
```
* Calcula el número de productos diferentes que hay en cada uno de los pedidos.
```sql
select count(*) as num, codigo_pedido from detalle_pedido
group by codigo_pedido limit 15;
┌─────┬───────────────┐
│ num │ codigo_pedido │
├─────┼───────────────┤
│ 5   │ 1             │
│ 7   │ 2             │
│ 6   │ 3             │
│ 8   │ 4             │
│ 3   │ 8             │
│ 4   │ 9             │
│ 3   │ 10            │
│ 2   │ 11            │
│ 1   │ 12            │
│ 3   │ 13            │
│ 2   │ 14            │
│ 4   │ 15            │
│ 2   │ 16            │
│ 5   │ 17            │
│ 3   │ 18            │
└─────┴───────────────┘
```
* Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
```sql
select sum(p.precio_venta) as can, dp.codigo_pedido from producto as p
join detalle_pedido as dp on p.codigo_producto=dp.codigo_producto
group by dp.codigo_pedido limit 15;
┌─────┬───────────────┐
│ can │ codigo_pedido │
├─────┼───────────────┤
│ 114 │ 1             │
│ 577 │ 2             │
│ 374 │ 3             │
│ 143 │ 4             │
│ 143 │ 8             │
│ 104 │ 9             │
│ 214 │ 10            │
│ 463 │ 11            │
│ 1   │ 12            │
│ 128 │ 13            │
│ 68  │ 14            │
│ 39  │ 15            │
│ 21  │ 16            │
│ 75  │ 17            │
│ 22  │ 18            │
└─────┴───────────────┘
```
* Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
```sql 
select p.nombre, sum(dp.cantidad) as num, sum (dp.cantidad)*p.precio_venta as total from producto as p
join detalle_pedido as dp on dp.codigo_producto=p.codigo_producto
group by dp.codigo_producto 
order by num desc
limit 20;
┌────────────────────────────────────────────┬─────┬────────┐
│                   nombre                   │ num │ total  │
├────────────────────────────────────────────┼─────┼────────┤
│ Thymus Vulgaris                            │ 961 │ 961    │
│ Thymus Citriodra (Tomillo limón)           │ 455 │ 455    │
│ Rosal bajo 1Âª -En maceta-inicio brotación │ 423 │ 846    │
│ Petrosilium Hortense (Peregil)             │ 291 │ 291    │
│ Cerezo                                     │ 285 │ 19950  │
│ Trachycarpus Fortunei                      │ 279 │ 128898 │
│ Acer Pseudoplatanus                        │ 262 │ 2620   │
│ Chamaerops Humilis                         │ 236 │ 15104  │
│ Tuja orientalis \"Aurea nana\"             │ 221 │ 884    │
│ Azadón                                     │ 220 │ 2640   │
│ Brahea Armata                              │ 212 │ 2120   │
│ Kaki Rojo Brillante                        │ 203 │ 1827   │
│ Robinia Pseudoacacia Casque Rouge          │ 150 │ 2250   │
│ Ajedrea                                    │ 135 │ 135    │
│ Limonero 30/40                             │ 131 │ 13100  │
│ Lavándula Dentata                          │ 128 │ 128    │
│ Nerium oleander ARBOL Calibre 8/10         │ 127 │ 2286   │
│ Nogal Común                                │ 120 │ 1080   │
│ Cerezo Napoleón                            │ 120 │ 960    │
│ Nectarina                                  │ 114 │ 1254   │
└────────────────────────────────────────────┴─────┴────────┘
```
* La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IGIC y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IGIC es el 7 % de la base imponible, y el total la suma de los dos campos anteriores.
```sql

```
    La misma información que en la pregunta anterior, pero agrupada por código de producto.
    La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
* Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (7% IGIC).
```sql
select p.nombre, sum(dp.cantidad) as num, sum(dp.cantidad)*p.precio_venta as total, sum(dp.cantidad)*p.precio_venta*1.07 as total_imp from producto as p
join detalle_pedido as dp on dp.codigo_producto=p.codigo_producto
group by dp.codigo_producto 
having total>3000
order by total desc
limit 20;
┌───────────────────────┬─────┬────────┬───────────┐
│        nombre         │ num │ total  │ total_imp │
├───────────────────────┼─────┼────────┼───────────┤
│ Trachycarpus Fortunei │ 279 │ 128898 │ 137920.86 │
│ Cerezo                │ 285 │ 19950  │ 21346.5   │
│ Chamaerops Humilis    │ 236 │ 15104  │ 16161.28  │
│ Limonero 30/40        │ 131 │ 13100  │ 14017.0   │
│ Bismarckia Nobilis    │ 35  │ 9310   │ 9961.7    │
│ Kaki                  │ 76  │ 5320   │ 5692.4    │
│ Beucarnea Recurvata   │ 70  │ 4130   │ 4419.1    │
│ Melocotonero          │ 111 │ 3552   │ 3800.64   │
│ Dracaena Drago        │ 55  │ 3520   │ 3766.4    │
│ Beucarnea Recurvata   │ 80  │ 3120   │ 3338.4    │
└───────────────────────┴─────┴────────┴───────────┘
```
* Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
```sql
select substr(fecha_pago, 0, 5) as año, sum(total) as total
from pago
group by año;
┌──────┬───────┐
│ año  │ total │
├──────┼───────┤
│ 2006 │ 24965 │
│ 2007 │ 85170 │
│ 2008 │ 29252 │
│ 2009 │ 58553 │
└──────┴───────┘
```

## Subconsultas en SQL

* Devuelve el nombre del cliente con mayor límite de crédito.
```sql
select nombre_cliente from cliente
where limite_credito=(
    select max(limite_credito) from cliente
);
┌────────────────┐
│ nombre_cliente │
├────────────────┤
│ Tendo Garden   │
└────────────────┘
```
* Devuelve el nombre del producto que tenga el precio de venta más caro.
```sql
select nombre from producto 
where precio_venta=(
    select max(precio_venta) from producto
);
┌───────────────────────┐
│        nombre         │
├───────────────────────┤
│ Trachycarpus Fortunei │
└───────────────────────┘
```
* Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
```sql
```
    Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
    Devuelve el producto que más unidades tiene en stock.
    Devuelve el producto que menos unidades tiene en stock.
    Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
    Devuelve el nombre del cliente con mayor límite de crédito.
    Devuelve el nombre del producto que tenga el precio de venta más caro.
    Devuelve el producto que menos unidades tiene en stock.
    Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
    Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
    Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
    Devuelve un listado de los productos que nunca han aparecido en un pedido.
    Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
    Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
    Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
    Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
    Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
    Devuelve un listado de los productos que nunca han aparecido en un pedido.
    Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

Consultas variadas en SQL

    Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
    Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
    Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
    Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
    Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
    Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
    Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
