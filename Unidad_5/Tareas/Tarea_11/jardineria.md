# Consultas a Realizar
## Consultas SQL sobre una tabla

* Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
```sql
select codigo_oficina, ciudad from oficina;
┌────────────────┬──────────────────────┐
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
where pais='Spain'
limit 10;
┌─────────────────────────────┐
│       nombre_cliente        │
├─────────────────────────────┤
│ Lasas S.A.                  │
│ Beragua                     │
│ Club Golf Puerta del hierro │
│ Naturagua                   │
│ DaraDistribuciones          │
│ Madrileña de riegos         │
│ Lasas S.A.                  │
│ Camunas Jardines S.L.       │
│ Dardena S.A.                │
│ Jardin de Flores            │
└─────────────────────────────┘
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
where fecha_entrega!=fecha_esperada limit 10;
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
└───────────────┴────────────────┴────────────────┴───────────────┘
```
* Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
```sql
select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega, (strftime('%d', fecha_entrega) - strftime('%d', fecha_esperada)) as diff from pedido
where diff < -2;
┌───────────────┬────────────────┬────────────────┬───────────────┬──────┐
│ codigo_pedido │ codigo_cliente │ fecha_esperada │ fecha_entrega │ diff │
├───────────────┼────────────────┼────────────────┼───────────────┼──────┤
│ 24            │ 14             │ 2008-07-31     │ 2008-07-25    │ -6   │
│ 31            │ 13             │ 2008-09-30     │ 2008-10-04    │ -26  │
│ 36            │ 14             │ 2008-12-15     │ 2008-12-10    │ -5   │
│ 53            │ 13             │ 2008-11-15     │ 2008-11-09    │ -6   │
│ 89            │ 35             │ 2007-12-13     │ 2007-12-10    │ -3   │
│ 92            │ 27             │ 2009-04-30     │ 2009-05-03    │ -27  │
│ 93            │ 27             │ 2009-05-30     │ 2009-05-17    │ -13  │
└───────────────┴────────────────┴────────────────┴───────────────┴──────┘
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
where gama='Ornamentales' and cantidad_en_stock>100 
order by precio_venta desc
limit 10;
┌─────────────────┬──────────────────────────────────────────────┬──────────────┬─────────────┬──────────────────┬──────────────────────────────────────────────────────────────┬───────────────────┬──────────────┬──────────────────┐│ codigo_producto │                    nombre                    │     gama     │ dimensiones │    proveedor     │                         descripcion                          │ cantidad_en_stock │ precio_venta │ precio_proveedor │├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤│ OR-115          │ Forsytia Intermedia \"Lynwood\"              │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 7            │ 5                │├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤│ OR-116          │ Hibiscus Syriacus  \"Diana\" -Blanco Puro    │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente mo │ 120               │ 7            │ 5                ││                 │                                              │              │             │                  │ ldeadas como bonsái en el transcurso de pocos años. Flores d │                   │              │                  ││                 │                                              │              │             │                  │ e muchos colores según la variedad, desde el blanco puro al  │                   │              │                  ││                 │                                              │              │             │                  │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │                   │              │                  ││                 │                                              │              │             │                  │ a 1 día, pero continuamente aparecen nuevas y la floración s │                   │              │                  ││                 │                                              │              │             │                  │ e prolonga durante todo el periodo de crecimiento vegetativo │                   │              │                  ││                 │                                              │              │             │                  │ .                                                            │                   │              │                  │├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤│ OR-117          │ Hibiscus Syriacus  \"Helene\" -Blanco-C.rojo │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente mo │ 120               │ 7            │ 5                ││                 │                                              │              │             │                  │ ldeadas como bonsái en el transcurso de pocos años. Flores d │                   │              │                  ││                 │                                              │              │             │                  │ e muchos colores según la variedad, desde el blanco puro al  │                   │              │                  ││                 │                                              │              │             │                  │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │                   │              │                  ││                 │                                              │              │             │                  │ a 1 día, pero continuamente aparecen nuevas y la floración s │                   │              │                  ││                 │                                              │              │             │                  │ e prolonga durante todo el periodo de crecimiento vegetativo │                   │              │                  ││                 │                                              │              │             │                  │ .                                                            │                   │              │                  │├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤│ OR-118          │ Hibiscus Syriacus \"Pink Giant\" Rosa        │ Ornamentales │ 35-45       │ Viveros EL OASIS │ Por su capacidad de soportar podas, pueden ser fácilmente mo │ 120               │ 7            │ 5                ││                 │                                              │              │             │                  │ ldeadas como bonsái en el transcurso de pocos años. Flores d │                   │              │                  ││                 │                                              │              │             │                  │ e muchos colores según la variedad, desde el blanco puro al  │                   │              │                  ││                 │                                              │              │             │                  │ rojo intenso, del amarillo al anaranjado. La flor apenas dur │                   │              │                  ││                 │                                              │              │             │                  │ a 1 día, pero continuamente aparecen nuevas y la floración s │                   │              │                  ││                 │                                              │              │             │                  │ e prolonga durante todo el periodo de crecimiento vegetativo │                   │              │                  ││                 │                                              │              │             │                  │ .                                                            │                   │              │                  │├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤│ OR-112          │ Escallonia (Mix)                             │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤│ OR-113          │ Evonimus Emerald Gayeti                      │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤│ OR-114          │ Evonimus Pulchellus                          │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤│ OR-119          │ Laurus Nobilis Arbusto - Ramificado Bajo     │ Ornamentales │ 40-50       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤│ OR-120          │ Lonicera Nitida                              │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │├─────────────────┼──────────────────────────────────────────────┼──────────────┼─────────────┼──────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤│ OR-121          │ Lonicera Nitida \"Maigrum\"                  │ Ornamentales │ 35-45       │ Viveros EL OASIS │                                                              │ 120               │ 5            │ 4                │└─────────────────┴──────────────────────────────────────────────┴──────────────┴─────────────┴──────────────────┴──────────────────────────────────────────────────────────────┴───────────────────┴──────────────┴──────────────────┘
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
where e.codigo_empleado=c.codigo_empleado_rep_ventas 
limit 10;
┌─────────────────────────────┬─────────────────┬───────────┬───────────┐
│       nombre_cliente        │     nombre      │ apellido1 │ apellido2 │
├─────────────────────────────┼─────────────────┼───────────┼───────────┤
│ GoldFish Garden             │ Walter Santiago │ Sanchez   │ Lopez     │
│ Gardening Associates        │ Walter Santiago │ Sanchez   │ Lopez     │
│ Gerudo Valley               │ Lorena          │ Paxton    │           │
│ Tendo Garden                │ Lorena          │ Paxton    │           │
│ Lasas S.A.                  │ Mariano         │ López     │ Murcia    │
│ Beragua                     │ Emmanuel        │ Magaña    │ Perez     │
│ Club Golf Puerta del hierro │ Emmanuel        │ Magaña    │ Perez     │
│ Naturagua                   │ Emmanuel        │ Magaña    │ Perez     │
│ DaraDistribuciones          │ Emmanuel        │ Magaña    │ Perez     │
│ Madrileña de riegos         │ Emmanuel        │ Magaña    │ Perez     │
└─────────────────────────────┴─────────────────┴───────────┴───────────┘
```
* Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
```sql
select distinct(c.nombre_cliente), e.nombre, e.apellido1, e.apellido2 from cliente as c, empleado as e, pago as p
where e.codigo_empleado=c.codigo_empleado_rep_ventas
and p.codigo_cliente=c.codigo_cliente
limit 10;
┌───────────────────────┬─────────────────┬────────────┬───────────┐
│    nombre_cliente     │     nombre      │ apellido1  │ apellido2 │
├───────────────────────┼─────────────────┼────────────┼───────────┤
│ GoldFish Garden       │ Walter Santiago │ Sanchez    │ Lopez     │
│ Gardening Associates  │ Walter Santiago │ Sanchez    │ Lopez     │
│ Gerudo Valley         │ Lorena          │ Paxton     │           │
│ Tendo Garden          │ Lorena          │ Paxton     │           │
│ Beragua               │ Emmanuel        │ Magaña     │ Perez     │
│ Naturagua             │ Emmanuel        │ Magaña     │ Perez     │
│ Camunas Jardines S.L. │ Mariano         │ López      │ Murcia    │
│ Dardena S.A.          │ Mariano         │ López      │ Murcia    │
│ Jardin de Flores      │ Julian          │ Bellinelli │           │
│ Flores Marivi         │ Felipe          │ Rosas      │ Marquez   │
└───────────────────────┴─────────────────┴────────────┴───────────┘
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
select distinct(c.nombre_cliente), e.nombre, e.apellido1, e.apellido2, o.ciudad from cliente as c, empleado as e, pago as p, oficina as o
where e.codigo_empleado=c.codigo_empleado_rep_ventas
and c.codigo_cliente=p.codigo_cliente
and o.codigo_oficina=e.codigo_oficina 
limit 10;
┌───────────────────────┬─────────────────┬────────────┬───────────┬──────────────────────┐
│    nombre_cliente     │     nombre      │ apellido1  │ apellido2 │        ciudad        │
├───────────────────────┼─────────────────┼────────────┼───────────┼──────────────────────┤
│ GoldFish Garden       │ Walter Santiago │ Sanchez    │ Lopez     │ San Francisco        │
│ Gardening Associates  │ Walter Santiago │ Sanchez    │ Lopez     │ San Francisco        │
│ Gerudo Valley         │ Lorena          │ Paxton     │           │ Boston               │
│ Tendo Garden          │ Lorena          │ Paxton     │           │ Boston               │
│ Beragua               │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
│ Naturagua             │ Emmanuel        │ Magaña     │ Perez     │ Barcelona            │
│ Camunas Jardines S.L. │ Mariano         │ López      │ Murcia    │ Madrid               │
│ Dardena S.A.          │ Mariano         │ López      │ Murcia    │ Madrid               │
│ Jardin de Flores      │ Julian          │ Bellinelli │           │ Sydney               │
│ Flores Marivi         │ Felipe          │ Rosas      │ Marquez   │ Talavera de la Reina │
└───────────────────────┴─────────────────┴────────────┴───────────┴──────────────────────┘
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
and o.codigo_oficina=e.codigo_oficina limit 10;
┌─────────────────────────────┬─────────────────┬───────────────┐
│       nombre_cliente        │     nombre      │    ciudad     │
├─────────────────────────────┼─────────────────┼───────────────┤
│ GoldFish Garden             │ Walter Santiago │ San Francisco │
│ Gardening Associates        │ Walter Santiago │ San Francisco │
│ Gerudo Valley               │ Lorena          │ Boston        │
│ Tendo Garden                │ Lorena          │ Boston        │
│ Lasas S.A.                  │ Mariano         │ Madrid        │
│ Beragua                     │ Emmanuel        │ Barcelona     │
│ Club Golf Puerta del hierro │ Emmanuel        │ Barcelona     │
│ Naturagua                   │ Emmanuel        │ Barcelona     │
│ DaraDistribuciones          │ Emmanuel        │ Barcelona     │
│ Madrileña de riegos         │ Emmanuel        │ Barcelona     │
└─────────────────────────────┴─────────────────┴───────────────┘
```
* Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
```sql
select e.nombre, j.nombre from empleado as e, empleado as j
where e.codigo_jefe=j.codigo_empleado
limit 10;
┌─────────────┬─────────┐
│   nombre    │ nombre  │
├─────────────┼─────────┤
│ Ruben       │ Marcos  │
│ Alberto     │ Ruben   │
│ Maria       │ Ruben   │
│ Felipe      │ Alberto │
│ Juan Carlos │ Alberto │
│ Carlos      │ Alberto │
│ Mariano     │ Carlos  │
│ Lucio       │ Carlos  │
│ Hilario     │ Carlos  │
│ Emmanuel    │ Alberto │
└─────────────┴─────────┘
```
* Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
```sql
select e.nombre, j.nombre, jj.nombre from empleado as e, empleado as j, empleado as jj
where e.codigo_jefe=j.codigo_empleado and j.codigo_jefe=jj.codigo_empleado
limit 10;
┌─────────────┬──────────┬─────────┐
│   nombre    │  nombre  │ nombre  │
├─────────────┼──────────┼─────────┤
│ Alberto     │ Ruben    │ Marcos  │
│ Maria       │ Ruben    │ Marcos  │
│ Felipe      │ Alberto  │ Ruben   │
│ Juan Carlos │ Alberto  │ Ruben   │
│ Carlos      │ Alberto  │ Ruben   │
│ Mariano     │ Carlos   │ Alberto │
│ Lucio       │ Carlos   │ Alberto │
│ Hilario     │ Carlos   │ Alberto │
│ Emmanuel    │ Alberto  │ Ruben   │
│ José Manuel │ Emmanuel │ Alberto │
└─────────────┴──────────┴─────────┘
```
* Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
```sql
select distinct(c.nombre_cliente) from cliente as c, pedido as p
where c.codigo_cliente=p.codigo_cliente 
and p.fecha_esperada!=fecha_entrega 
limit 10;
┌───────────────────────┐
│    nombre_cliente     │
├───────────────────────┤
│ Tendo Garden          │
│ GoldFish Garden       │
│ Beragua               │
│ Naturagua             │
│ Dardena S.A.          │
│ Gardening Associates  │
│ Camunas Jardines S.L. │
│ Gerudo Valley         │
│ Golf S.A.             │
│ Sotogrande            │
└───────────────────────┘
```
* Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
```sql
select distinct(g.gama), c.nombre_cliente from cliente as c, gama_producto as g, pedido as p, detalle_pedido as dp, producto as pr
where c.codigo_cliente=p.codigo_cliente and p.codigo_pedido=dp.codigo_pedido
and dp.codigo_producto=pr.codigo_producto and pr.gama=g.gama
limit 10;
┌──────────────┬──────────────────────┐
│     gama     │    nombre_cliente    │
├──────────────┼──────────────────────┤
│ Frutales     │ Tendo Garden         │
│ Ornamentales │ Tendo Garden         │
│ Frutales     │ GoldFish Garden      │
│ Aromáticas   │ GoldFish Garden      │
│ Frutales     │ Gardening Associates │
│ Ornamentales │ Gardening Associates │
│ Ornamentales │ GoldFish Garden      │
│ Herramientas │ Beragua              │
│ Frutales     │ Beragua              │
│ Ornamentales │ Beragua              │
└──────────────┴──────────────────────┘
```

## Consultas multitabla (inner join)

* Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql
select c.* from cliente as c
left join pago as p on c.codigo_cliente=p.codigo_cliente
where p.codigo_cliente is null
limit 10;
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬─────────────┬─────────────┬───────────────────┬──────────────────┬──────────────────────┬───────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │  telefono   │     fax     │ linea_direccion1  │ linea_direccion2 │        ciudad        │  region   │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼─────────────┼─────────────┼───────────────────┼──────────────────┼──────────────────────┼───────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 6              │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145 │ 34914851312 │ C/Leganes 15      │                  │ Fuenlabrada          │ Madrid    │ Spain │ 28945         │ 8
         │ 154310         │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810    │ 919535678   │ C/sinesio delgado │ Madrid           │ Madrid               │ Madrid    │ Spain │ 28930         │ 11
         │ 40000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001   │ 916421756   │ C/azores          │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain │ 28946         │ 11
         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045   │ 916689215   │ C/Lagañas         │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain │ 28943         │ 11
         │ 20000          │
│ 12             │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145 │ 34914851312 │ C/Leganes 15      │                  │ Fuenlabrada          │ Madrid    │ Spain │ 28945         │ 8
         │ 154310         │
│ 17             │ Flowers, S.A                │ Beatriz         │ Fernandez         │ 698754159   │ 978453216   │ C/Luis Salquillo4 │                  │ Montornes del valles │ Barcelona │ Spain │ 24586         │ 5
         │ 3500           │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529   │ 916548735   │ Plaza Magallón 15 │                  │ Madrid               │ Madrid    │ Spain │ 28011         │ 30
         │ 5050           │
│ 20             │ Americh Golf Management SL  │ Mario           │ Suarez            │ 964493072   │ 964493063   │ C/Letardo         │                  │ Barcelona            │ Cataluña  │ Spain │ 12320         │ 12
         │ 20000          │
│ 21             │ Aloha                       │ Cristian        │ Rodrigez          │ 916485852   │ 914489898   │ C/Roman 3         │                  │ Canarias             │ Canarias  │ Spain │ 35488         │ 12
         │ 50000          │
│ 22             │ El Prat                     │ Francisco       │ Camacho           │ 916882323   │ 916493211   │ Avenida Tibidabo  │                  │ Barcelona            │ Cataluña  │ Spain │ 12320         │ 12
         │ 30000          │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴─────────────┴─────────────┴───────────────────┴──────────────────┴──────────────────────┴───────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```
* Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
```sql
select c.* from cliente as c
left join pedido as p on c.codigo_cliente=p.codigo_cliente
where p.codigo_cliente is null
limit 10;
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬─────────────┬─────────────┬───────────────────┬──────────────────┬──────────────────────┬───────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │  telefono   │     fax     │ linea_direccion1  │ linea_direccion2 │        ciudad        │  region   │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼─────────────┼─────────────┼───────────────────┼──────────────────┼──────────────────────┼───────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 6              │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145 │ 34914851312 │ C/Leganes 15      │                  │ Fuenlabrada          │ Madrid    │ Spain │ 28945         │ 8
         │ 154310         │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810    │ 919535678   │ C/sinesio delgado │ Madrid           │ Madrid               │ Madrid    │ Spain │ 28930         │ 11
         │ 40000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001   │ 916421756   │ C/azores          │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain │ 28946         │ 11
         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045   │ 916689215   │ C/Lagañas         │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain │ 28943         │ 11
         │ 20000          │
│ 12             │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145 │ 34914851312 │ C/Leganes 15      │                  │ Fuenlabrada          │ Madrid    │ Spain │ 28945         │ 8
         │ 154310         │
│ 17             │ Flowers, S.A                │ Beatriz         │ Fernandez         │ 698754159   │ 978453216   │ C/Luis Salquillo4 │                  │ Montornes del valles │ Barcelona │ Spain │ 24586         │ 5
         │ 3500           │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529   │ 916548735   │ Plaza Magallón 15 │                  │ Madrid               │ Madrid    │ Spain │ 28011         │ 30
         │ 5050           │
│ 20             │ Americh Golf Management SL  │ Mario           │ Suarez            │ 964493072   │ 964493063   │ C/Letardo         │                  │ Barcelona            │ Cataluña  │ Spain │ 12320         │ 12
         │ 20000          │
│ 21             │ Aloha                       │ Cristian        │ Rodrigez          │ 916485852   │ 914489898   │ C/Roman 3         │                  │ Canarias             │ Canarias  │ Spain │ 35488         │ 12
         │ 50000          │
│ 22             │ El Prat                     │ Francisco       │ Camacho           │ 916882323   │ 916493211   │ Avenida Tibidabo  │                  │ Barcelona            │ Cataluña  │ Spain │ 12320         │ 12
         │ 30000          │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴─────────────┴─────────────┴───────────────────┴──────────────────┴──────────────────────┴───────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```

* Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
```sql
select c.* from cliente as c
left join pedido as p, pago as pa
on c.codigo_cliente=p.codigo_cliente and c.codigo_cliente=pa.codigo_cliente
where pa.codigo_cliente is null and p.codigo_cliente is null; 
```
* Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
```sql
select e.* from empleado as e
left join oficina as o on e.codigo_oficina=o.codigo_oficina
where e.codigo_oficina is null; 
```
* Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
```sql
select e.* from empleado as e
left join cliente as c on e.codigo_empleado=c.codigo_empleado_rep_ventas
where c.codigo_cliente is null
limit 10;
┌─────────────────┬─────────────┬───────────┬───────────┬───────────┬──────────────────────────┬────────────────┬─────────────┬───────────────────────┐
│ codigo_empleado │   nombre    │ apellido1 │ apellido2 │ extension │          email           │ codigo_oficina │ codigo_jefe │        puesto         │
├─────────────────┼─────────────┼───────────┼───────────┼───────────┼──────────────────────────┼────────────────┼─────────────┼───────────────────────┤
│ 1               │ Marcos      │ Magaña    │ Perez     │ 3897      │ marcos@jardineria.es     │ TAL-ES         │             │ Director General      │
│ 2               │ Ruben       │ López     │ Martinez  │ 2899      │ rlopez@jardineria.es     │ TAL-ES         │ 1           │ Subdirector Marketing │
│ 3               │ Alberto     │ Soria     │ Carrasco  │ 2837      │ asoria@jardineria.es     │ TAL-ES         │ 2           │ Subdirector Ventas    │
│ 4               │ Maria       │ Solís     │ Jerez     │ 2847      │ msolis@jardineria.es     │ TAL-ES         │ 2           │ Secretaria            │
│ 6               │ Juan Carlos │ Ortiz     │ Serrano   │ 2845      │ cortiz@jardineria.es     │ TAL-ES         │ 3           │ Representante Ventas  │
│ 7               │ Carlos      │ Soria     │ Jimenez   │ 2444      │ csoria@jardineria.es     │ MAD-ES         │ 3           │ Director Oficina      │
│ 10              │ Hilario     │ Rodriguez │ Huertas   │ 2444      │ hrodriguez@jardineria.es │ MAD-ES         │ 7           │ Representante Ventas  │
│ 13              │ David       │ Palma     │ Aceituno  │ 2519      │ dpalma@jardineria.es     │ BCN-ES         │ 11          │ Representante Ventas  │
│ 14              │ Oscar       │ Palma     │ Aceituno  │ 2519      │ opalma@jardineria.es     │ BCN-ES         │ 11          │ Representante Ventas  │
│ 15              │ Francois    │ Fignon    │           │ 9981      │ ffignon@gardening.com    │ PAR-FR         │ 3           │ Director Oficina      │
└─────────────────┴─────────────┴───────────┴───────────┴───────────┴──────────────────────────┴────────────────┴─────────────┴───────────────────────┘
```
* Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
```sql
select e.*, o.* from empleado as e
join oficina as o on e.codigo_oficina=o.codigo_oficina
left join cliente as c 
on e.codigo_empleado=c.codigo_empleado_rep_ventas 
where c.codigo_cliente is null
limit 10;
┌─────────────────┬─────────────┬───────────┬───────────┬───────────┬──────────────────────────┬────────────────┬─────────────┬───────────────────────┬────────────────┬──────────────────────┬─────────┬───────────────────┬───────────────┬─────────────────┬──────────────────────────────┬─────────────────────┐
│ codigo_empleado │   nombre    │ apellido1 │ apellido2 │ extension │          email           │ codigo_oficina │ codigo_jefe │        puesto         │ codigo_oficina │        ciudad        │  pais   │      region       │ codigo_postal │    telefono     │       linea_direccion1       │  linea_direccion2   │
├─────────────────┼─────────────┼───────────┼───────────┼───────────┼──────────────────────────┼────────────────┼─────────────┼───────────────────────┼────────────────┼──────────────────────┼─────────┼───────────────────┼───────────────┼─────────────────┼──────────────────────────────┼─────────────────────┤
│ 1               │ Marcos      │ Magaña    │ Perez     │ 3897      │ marcos@jardineria.es     │ TAL-ES         │             │ Director General      │ TAL-ES         │ Talavera de la Reina │ España  │ Castilla-LaMancha │ 45632    
     │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
│ 2               │ Ruben       │ López     │ Martinez  │ 2899      │ rlopez@jardineria.es     │ TAL-ES         │ 1           │ Subdirector Marketing │ TAL-ES         │ Talavera de la Reina │ España  │ Castilla-LaMancha │ 45632    
     │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
│ 3               │ Alberto     │ Soria     │ Carrasco  │ 2837      │ asoria@jardineria.es     │ TAL-ES         │ 2           │ Subdirector Ventas    │ TAL-ES         │ Talavera de la Reina │ España  │ Castilla-LaMancha │ 45632    
     │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
│ 4               │ Maria       │ Solís     │ Jerez     │ 2847      │ msolis@jardineria.es     │ TAL-ES         │ 2           │ Secretaria            │ TAL-ES         │ Talavera de la Reina │ España  │ Castilla-LaMancha │ 45632    
     │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
│ 6               │ Juan Carlos │ Ortiz     │ Serrano   │ 2845      │ cortiz@jardineria.es     │ TAL-ES         │ 3           │ Representante Ventas  │ TAL-ES         │ Talavera de la Reina │ España  │ Castilla-LaMancha │ 45632    
     │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
│ 7               │ Carlos      │ Soria     │ Jimenez   │ 2444      │ csoria@jardineria.es     │ MAD-ES         │ 3           │ Director Oficina      │ MAD-ES         │ Madrid               │ España  │ Madrid            │ 28032    
     │ +34 91 7514487  │ Bulevar Indalecio Prieto, 32 │                     │
│ 10              │ Hilario     │ Rodriguez │ Huertas   │ 2444      │ hrodriguez@jardineria.es │ MAD-ES         │ 7           │ Representante Ventas  │ MAD-ES         │ Madrid               │ España  │ Madrid            │ 28032    
     │ +34 91 7514487  │ Bulevar Indalecio Prieto, 32 │                     │
│ 13              │ David       │ Palma     │ Aceituno  │ 2519      │ dpalma@jardineria.es     │ BCN-ES         │ 11          │ Representante Ventas  │ BCN-ES         │ Barcelona            │ España  │ Barcelona         │ 08019    
     │ +34 93 3561182  │ Avenida Diagonal, 38         │ 3A escalera Derecha │
│ 14              │ Oscar       │ Palma     │ Aceituno  │ 2519      │ opalma@jardineria.es     │ BCN-ES         │ 11          │ Representante Ventas  │ BCN-ES         │ Barcelona            │ España  │ Barcelona         │ 08019    
     │ +34 93 3561182  │ Avenida Diagonal, 38         │ 3A escalera Derecha │
│ 15              │ Francois    │ Fignon    │           │ 9981      │ ffignon@gardening.com    │ PAR-FR         │ 3           │ Director Oficina      │ PAR-FR         │ Paris                │ Francia │ EMEA              │ 75017    
     │ +33 14 723 4404 │ 29 Rue Jouffroy d'abbans     │                     │
└─────────────────┴─────────────┴───────────┴───────────┴───────────┴──────────────────────────┴────────────────┴─────────────┴───────────────────────┴────────────────┴──────────────────────┴─────────┴───────────────────┴───────────────┴─────────────────┴──────────────────────────────┴─────────────────────┘
```
* Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
```sql
select e.*, o.codigo_oficina, c.codigo_cliente from empleado as e
left join cliente as c on e.codigo_empleado=c.codigo_empleado_rep_ventas
left join oficina as o on e.codigo_oficina=o.codigo_oficina
where o.codigo_oficina is null and c.codigo_cliente is null;
```
* Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql
select p.* from producto as p
left join detalle_pedido as dp on p.codigo_producto=dp.codigo_producto
where dp.codigo_pedido is null
limit 10;
┌─────────────────┬─────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────────────────────────┬──────────────────────────────────────────────────────────────┬───────────────────┬──────────────┬──────────────────┐
│ codigo_producto │                           nombre                            │   gama   │ dimensiones │         proveedor         │                         descripcion                          │ cantidad_en_stock │ precio_venta 
│ precio_proveedor │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-104          │ Olea-Olivos                                                 │ Frutales │ 12/4        │ Frutales Talavera S.A     │ Existen dos hipótesis sobre el origen del olivo, una que pos │ 50                │ 49
│ 39               │
│                 │                                                             │          │             │                           │ tula que proviene de las costas de Siria, Líbano e Israel y  │                   │
│                  │
│                 │                                                             │          │             │                           │ otra que considera que lo considera originario de Asia menor │                   │
│                  │
│                 │                                                             │          │             │                           │ . La llegada a Europa probablemente tuvo lugar de mano de lo │                   │
│                  │
│                 │                                                             │          │             │                           │ s Fenicios, en transito por Chipre, Creta, e Islas del Mar E │                   │
│                  │
│                 │                                                             │          │             │                           │ geo, pasando a Grecia y más tarde a Italia. Los primeros ind │                   │
│                  │
│                 │                                                             │          │             │                           │ icios de la presencia del olivo en las costas mediterráneas  │                   │
│                  │
│                 │                                                             │          │             │                           │ españolas coinciden con el dominio romano, aunque fueron pos │                   │
│                  │
│                 │                                                             │          │             │                           │ teriormente los árabes los que impulsaron su cultivo en Anda │                   │
│                  │
│                 │                                                             │          │             │                           │ lucía, convirtiendo a España en el primer país productor de  │                   │
│                  │
│                 │                                                             │          │             │                           │ aceite de oliva a nivel mundial.                             │                   │
│                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-14           │ Calamondin Mini                                             │ Frutales │             │ Frutales Talavera S.A     │ Se trata de un pequeño arbolito de copa densa, con tendencia │ 15                │ 10
│ 8                │
│                 │                                                             │          │             │                           │  a la verticalidad, inerme o con cortas espinas. Sus hojas s │                   │
│                  │
│                 │                                                             │          │             │                           │ on pequeñas, elípticas de 5-10 cm de longitud, con los pecío │                   │
│                  │
│                 │                                                             │          │             │                           │ los estrechamente alados.Posee 1 o 2 flores en situación axi │                   │
│                  │
│                 │                                                             │          │             │                           │ lar, al final de las ramillas.Sus frutos son muy pequeños (3 │                   │
│                  │
│                 │                                                             │          │             │                           │ -3,5 cm de diámetro), con pocas semillas, esféricos u ovales │                   │
│                  │
│                 │                                                             │          │             │                           │ , con la zona apical aplanada; corteza de color naranja-roji │                   │
│                  │
│                 │                                                             │          │             │                           │ zo, muy fina y fácilmente separable de la pulpa, que es dulc │                   │
│                  │
│                 │                                                             │          │             │                           │ e, ácida y comestible..                                      │                   │
│                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-19           │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │ Frutales │             │ NaranjasValencianas.com   │                                                              │ 350               │ 4
│ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-20           │ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │ Frutales │             │ Frutales Talavera S.A     │                                                              │ 350               │ 4
│ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-21           │ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │ Frutales │             │ Frutales Talavera S.A     │                                                              │ 350               │ 4
│ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-24           │ Albaricoquero Corbato                                       │ Frutales │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8
│ 6                │
│                 │                                                             │          │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │
│                  │
│                 │                                                             │          │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │
│                  │
│                 │                                                             │          │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │
│                  │
│                 │                                                             │          │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │
│                  │
│                 │                                                             │          │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │
│                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-25           │ Albaricoquero Moniqui                                       │ Frutales │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8
│ 6                │
│                 │                                                             │          │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │
│                  │
│                 │                                                             │          │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │
│                  │
│                 │                                                             │          │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │
│                  │
│                 │                                                             │          │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │
│                  │
│                 │                                                             │          │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │
│                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-26           │ Albaricoquero Kurrot                                        │ Frutales │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8
│ 6                │
│                 │                                                             │          │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │
│                  │
│                 │                                                             │          │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │
│                  │
│                 │                                                             │          │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │
│                  │
│                 │                                                             │          │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │
│                  │
│                 │                                                             │          │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │
│                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-27           │ Cerezo Burlat                                               │ Frutales │             │ Jerte Distribuciones S.L. │ Las principales especies de cerezo cultivadas en el mundo so │ 400               │ 8
│ 6                │
│                 │                                                             │          │             │                           │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │                   │
│                  │
│                 │                                                             │          │             │                           │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │                   │
│                  │
│                 │                                                             │          │             │                           │  son naturales del sureste de Europa y oeste de Asia. El cer │                   │
│                  │
│                 │                                                             │          │             │                           │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │                   │
│                  │
│                 │                                                             │          │             │                           │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │                   │
│                  │
│                 │                                                             │          │             │                           │ evado por los pájaros y las migraciones humanas. Fue uno de  │                   │
│                  │
│                 │                                                             │          │             │                           │ los frutales más apreciados por los griegos y con el Imperio │                   │
│                  │
│                 │                                                             │          │             │                           │  Romano se extendió a regiones muy diversas. En la actualida │                   │
│                  │
│                 │                                                             │          │             │                           │ d, el cerezo se encuentra difundido por numerosas regiones y │                   │
│                  │
│                 │                                                             │          │             │                           │  países del mundo con clima templado                         │                   │
│                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-28           │ Cerezo Picota                                               │ Frutales │             │ Jerte Distribuciones S.L. │ Las principales especies de cerezo cultivadas en el mundo so │ 400               │ 8
│ 6                │
│                 │                                                             │          │             │                           │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │                   │
│                  │
│                 │                                                             │          │             │                           │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │                   │
│                  │
│                 │                                                             │          │             │                           │  son naturales del sureste de Europa y oeste de Asia. El cer │                   │
│                  │
│                 │                                                             │          │             │                           │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │                   │
│                  │
│                 │                                                             │          │             │                           │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │                   │
│                  │
│                 │                                                             │          │             │                           │ evado por los pájaros y las migraciones humanas. Fue uno de  │                   │
│                  │
│                 │                                                             │          │             │                           │ los frutales más apreciados por los griegos y con el Imperio │                   │
│                  │
│                 │                                                             │          │             │                           │  Romano se extendió a regiones muy diversas. En la actualida │                   │
│                  │
│                 │                                                             │          │             │                           │ d, el cerezo se encuentra difundido por numerosas regiones y │                   │
│                  │
│                 │                                                             │          │             │                           │  países del mundo con clima templado                         │                   │
│                  │
└─────────────────┴─────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────────────────────────┴──────────────────────────────────────────────────────────────┴───────────────────┴──────────────┴──────────────────┘
```
* Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.
```sql
select p.nombre, p.descripcion, g.imagen from producto as p, gama_producto as g
left join detalle_pedido as dp on p.codigo_producto=dp.codigo_producto
where p.gama=g.gama and dp.codigo_pedido is null
limit 10;
┌─────────────────────────────────────────────────────────────┬──────────────────────────────────────────────────────────────┬────────┐
│                           nombre                            │                         descripcion                          │ imagen │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Olea-Olivos                                                 │ Existen dos hipótesis sobre el origen del olivo, una que pos │        │
│                                                             │ tula que proviene de las costas de Siria, Líbano e Israel y  │        │
│                                                             │ otra que considera que lo considera originario de Asia menor │        │
│                                                             │ . La llegada a Europa probablemente tuvo lugar de mano de lo │        │
│                                                             │ s Fenicios, en transito por Chipre, Creta, e Islas del Mar E │        │
│                                                             │ geo, pasando a Grecia y más tarde a Italia. Los primeros ind │        │
│                                                             │ icios de la presencia del olivo en las costas mediterráneas  │        │
│                                                             │ españolas coinciden con el dominio romano, aunque fueron pos │        │
│                                                             │ teriormente los árabes los que impulsaron su cultivo en Anda │        │
│                                                             │ lucía, convirtiendo a España en el primer país productor de  │        │
│                                                             │ aceite de oliva a nivel mundial.                             │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Calamondin Mini                                             │ Se trata de un pequeño arbolito de copa densa, con tendencia │        │
│                                                             │  a la verticalidad, inerme o con cortas espinas. Sus hojas s │        │
│                                                             │ on pequeñas, elípticas de 5-10 cm de longitud, con los pecío │        │
│                                                             │ los estrechamente alados.Posee 1 o 2 flores en situación axi │        │
│                                                             │ lar, al final de las ramillas.Sus frutos son muy pequeños (3 │        │
│                                                             │ -3,5 cm de diámetro), con pocas semillas, esféricos u ovales │        │
│                                                             │ , con la zona apical aplanada; corteza de color naranja-roji │        │
│                                                             │ zo, muy fina y fácilmente separable de la pulpa, que es dulc │        │
│                                                             │ e, ácida y comestible..                                      │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │                                                              │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Albaricoquero Corbato                                       │ árbol que puede pasar de los 6 m de altura, en la región med │        │
│                                                             │ iterránea con ramas formando una copa redondeada. La corteza │        │
│                                                             │  del tronco es pardo-violácea, agrietada; las ramas son roji │        │
│                                                             │ zas y extendidas cuando jóvenes y las ramas secundarias son  │        │
│                                                             │ cortas, divergentes y escasas. Las yemas latentes son frecue │        │
│                                                             │ ntes especialmente sobre las ramas viejas.                   │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Albaricoquero Moniqui                                       │ árbol que puede pasar de los 6 m de altura, en la región med │        │
│                                                             │ iterránea con ramas formando una copa redondeada. La corteza │        │
│                                                             │  del tronco es pardo-violácea, agrietada; las ramas son roji │        │
│                                                             │ zas y extendidas cuando jóvenes y las ramas secundarias son  │        │
│                                                             │ cortas, divergentes y escasas. Las yemas latentes son frecue │        │
│                                                             │ ntes especialmente sobre las ramas viejas.                   │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Albaricoquero Kurrot                                        │ árbol que puede pasar de los 6 m de altura, en la región med │        │
│                                                             │ iterránea con ramas formando una copa redondeada. La corteza │        │
│                                                             │  del tronco es pardo-violácea, agrietada; las ramas son roji │        │
│                                                             │ zas y extendidas cuando jóvenes y las ramas secundarias son  │        │
│                                                             │ cortas, divergentes y escasas. Las yemas latentes son frecue │        │
│                                                             │ ntes especialmente sobre las ramas viejas.                   │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Cerezo Burlat                                               │ Las principales especies de cerezo cultivadas en el mundo so │        │
│                                                             │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │        │
│                                                             │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │        │
│                                                             │  son naturales del sureste de Europa y oeste de Asia. El cer │        │
│                                                             │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │        │
│                                                             │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │        │
│                                                             │ evado por los pájaros y las migraciones humanas. Fue uno de  │        │
│                                                             │ los frutales más apreciados por los griegos y con el Imperio │        │
│                                                             │  Romano se extendió a regiones muy diversas. En la actualida │        │
│                                                             │ d, el cerezo se encuentra difundido por numerosas regiones y │        │
│                                                             │  países del mundo con clima templado                         │        │
├─────────────────────────────────────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Cerezo Picota                                               │ Las principales especies de cerezo cultivadas en el mundo so │        │
│                                                             │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │        │
│                                                             │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │        │
│                                                             │  son naturales del sureste de Europa y oeste de Asia. El cer │        │
│                                                             │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │        │
│                                                             │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │        │
│                                                             │ evado por los pájaros y las migraciones humanas. Fue uno de  │        │
│                                                             │ los frutales más apreciados por los griegos y con el Imperio │        │
│                                                             │  Romano se extendió a regiones muy diversas. En la actualida │        │
│                                                             │ d, el cerezo se encuentra difundido por numerosas regiones y │        │
│                                                             │  países del mundo con clima templado                         │        │
└─────────────────────────────────────────────────────────────┴──────────────────────────────────────────────────────────────┴────────┘
```
* Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
```sql
select o.* from oficina as o
left join empleado as e on o.codigo_oficina=e.codigo_oficina
join cliente as c, pedido as p, detalle_pedido as dp, producto as pr
on c.codigo_empleado_rep_ventas=e.codigo_empleado and c.codigo_cliente=p.codigo_cliente
and p.codigo_pedido=dp.codigo_pedido and dp.codigo_producto=pr.codigo_producto
and pr.gama='Frutales' and e.codigo_oficina is null;
```
* Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
```sql
select c.* from cliente as c
join pedido as p on c.codigo_cliente=p.codigo_cliente
left join pago as pa on c.codigo_cliente=pa.codigo_cliente
where pa.codigo_cliente is null
group by c.codigo_cliente;
┌────────────────┬────────────────┬─────────────────┬───────────────────┬───────────┬───────────┬──────────────────┬──────────────────┬────────┬─────────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │ nombre_cliente │ nombre_contacto │ apellido_contacto │ telefono  │    fax    │ linea_direccion1 │ linea_direccion2 │ ciudad │   region    │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │   
├────────────────┼────────────────┼─────────────────┼───────────────────┼───────────┼───────────┼──────────────────┼──────────────────┼────────┼─────────────┼───────┼───────────────┼────────────────────────────┼────────────────┤   
│ 36             │ Flores S.L.    │ Antonio         │ Romero            │ 654352981 │ 685249700 │ Avenida España   │                  │ Madrid │ Fuenlabrada │ Spain │ 29643         │ 18                         │ 6000           │   
└────────────────┴────────────────┴─────────────────┴───────────────────┴───────────┴───────────┴──────────────────┴──────────────────┴────────┴─────────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```
* Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
```sql
select e.*, j.nombre as jefe from empleado as e
join empleado as j on e.codigo_jefe=j.codigo_empleado
left join cliente as c on e.codigo_empleado=c.codigo_empleado_rep_ventas
where c.codigo_cliente is null
limit 10;
┌─────────────────┬─────────────┬───────────┬───────────┬───────────┬──────────────────────────┬────────────────┬─────────────┬───────────────────────┬──────────┐
│ codigo_empleado │   nombre    │ apellido1 │ apellido2 │ extension │          email           │ codigo_oficina │ codigo_jefe │        puesto         │   jefe   │
├─────────────────┼─────────────┼───────────┼───────────┼───────────┼──────────────────────────┼────────────────┼─────────────┼───────────────────────┼──────────┤
│ 2               │ Ruben       │ López     │ Martinez  │ 2899      │ rlopez@jardineria.es     │ TAL-ES         │ 1           │ Subdirector Marketing │ Marcos   │
│ 3               │ Alberto     │ Soria     │ Carrasco  │ 2837      │ asoria@jardineria.es     │ TAL-ES         │ 2           │ Subdirector Ventas    │ Ruben    │
│ 4               │ Maria       │ Solís     │ Jerez     │ 2847      │ msolis@jardineria.es     │ TAL-ES         │ 2           │ Secretaria            │ Ruben    │
│ 6               │ Juan Carlos │ Ortiz     │ Serrano   │ 2845      │ cortiz@jardineria.es     │ TAL-ES         │ 3           │ Representante Ventas  │ Alberto  │
│ 7               │ Carlos      │ Soria     │ Jimenez   │ 2444      │ csoria@jardineria.es     │ MAD-ES         │ 3           │ Director Oficina      │ Alberto  │
│ 10              │ Hilario     │ Rodriguez │ Huertas   │ 2444      │ hrodriguez@jardineria.es │ MAD-ES         │ 7           │ Representante Ventas  │ Carlos   │
│ 13              │ David       │ Palma     │ Aceituno  │ 2519      │ dpalma@jardineria.es     │ BCN-ES         │ 11          │ Representante Ventas  │ Emmanuel │
│ 14              │ Oscar       │ Palma     │ Aceituno  │ 2519      │ opalma@jardineria.es     │ BCN-ES         │ 11          │ Representante Ventas  │ Emmanuel │
│ 15              │ Francois    │ Fignon    │           │ 9981      │ ffignon@gardening.com    │ PAR-FR         │ 3           │ Director Oficina      │ Alberto  │
│ 17              │ Laurent     │ Serra     │           │ 9982      │ lserra@gardening.com     │ PAR-FR         │ 15          │ Representante Ventas  │ Francois │
└─────────────────┴─────────────┴───────────┴───────────┴───────────┴──────────────────────────┴────────────────┴─────────────┴───────────────────────┴──────────┘
```

## Consultas resumen (count,avg,...)

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
select c.nombre_cliente, c.apellido_contacto, max(strftime(p.fecha_pago)) as ultimo, 
min(strftime(p.fecha_pago)) as primero from cliente as c
join pago as p on c.codigo_cliente=p.codigo_cliente
group by p.codigo_cliente
limit 10;
┌───────────────────────┬───────────────────┬────────────┬────────────┐
│    nombre_cliente     │ apellido_contacto │   ultimo   │  primero   │
├───────────────────────┼───────────────────┼────────────┼────────────┤
│ GoldFish Garden       │ GoldFish          │ 2008-12-10 │ 2008-11-10 │
│ Gardening Associates  │ Wright            │ 2009-02-19 │ 2009-01-16 │
│ Gerudo Valley         │ Flaute            │ 2007-01-08 │ 2007-01-08 │
│ Tendo Garden          │ Tendo             │ 2006-01-18 │ 2006-01-18 │
│ Beragua               │ Bermejo           │ 2009-01-13 │ 2009-01-13 │
│ Naturagua             │ Rengifo           │ 2009-01-06 │ 2009-01-06 │
│ Camunas Jardines S.L. │ Camunas           │ 2008-08-04 │ 2008-08-04 │
│ Dardena S.A.          │ Rodriguez         │ 2008-07-15 │ 2008-07-15 │
│ Jardin de Flores      │ Villar            │ 2009-02-15 │ 2009-01-15 │
│ Flores Marivi         │ Rodriguez         │ 2009-02-16 │ 2009-02-16 │
└───────────────────────┴───────────────────┴────────────┴────────────┘
```
* Calcula el número de productos diferentes que hay en cada uno de los pedidos.
```sql
select count(*) as num, codigo_pedido from detalle_pedido
group by codigo_pedido limit 10;
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
└─────┴───────────────┘
```
* Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
```sql
select sum(p.precio_venta) as can, dp.codigo_pedido from producto as p
join detalle_pedido as dp on p.codigo_producto=dp.codigo_producto
group by dp.codigo_pedido limit 10;
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
└─────┴───────────────┘
```
* Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
```sql 
select p.nombre, sum(dp.cantidad) as num, sum(dp.cantidad)*p.precio_venta as total from producto as p
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
select sum(precio_unidad*cantidad) as base, sum(precio_unidad*cantidad)*0.07 as IGIC, sum(precio_unidad*cantidad)*1.07 as total from detalle_pedido;
┌────────┬──────────┬───────────┐
│  base  │   IGIC   │   total   │
├────────┼──────────┼───────────┤
│ 217738 │ 15241.66 │ 232979.66 │
└────────┴──────────┴───────────┘
```
La misma información que en la pregunta anterior, pero agrupada por código de producto.
```sql
select codigo_producto, sum(precio_unidad*cantidad) as base, sum(precio_unidad*cantidad)*0.07 as IGIC, sum(precio_unidad*cantidad)*1.07 as total from detalle_pedido
group by codigo_producto
limit 10;
┌─────────────────┬──────┬───────┬─────────┐
│ codigo_producto │ base │ IGIC  │  total  │
├─────────────────┼──────┼───────┼─────────┤
│ 11679           │ 630  │ 44.1  │ 674.1   │
│ 21636           │ 564  │ 39.48 │ 603.48  │
│ 22225           │ 996  │ 69.72 │ 1065.72 │
│ 30310           │ 2640 │ 184.8 │ 2824.8  │
│ AR-001          │ 135  │ 9.45  │ 144.45  │
│ AR-002          │ 128  │ 8.96  │ 136.96  │
│ AR-003          │ 17   │ 1.19  │ 18.19   │
│ AR-004          │ 30   │ 2.1   │ 32.1    │
│ AR-005          │ 21   │ 1.47  │ 22.47   │
│ AR-006          │ 291  │ 20.37 │ 311.37  │
│ AR-007          │ 9    │ 0.63  │ 9.63    │
│ AR-008          │ 455  │ 31.85 │ 486.85  │
│ AR-009          │ 986  │ 69.02 │ 1055.02 │
│ AR-010          │ 10   │ 0.7   │ 10.7    │
│ FR-1            │ 168  │ 11.76 │ 179.76  │
└─────────────────┴──────┴───────┴─────────┘
```
La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
```sql
select codigo_producto, sum(precio_unidad*cantidad) as base, sum(precio_unidad*cantidad)*0.07 as IGIC, sum(precio_unidad*cantidad)*1.07 as total from detalle_pedido
group by codigo_producto
having codigo_producto regexp '^OR'
limit 10;
┌─────────────────┬──────┬───────┬─────────┐
│ codigo_producto │ base │ IGIC  │  total  │
├─────────────────┼──────┼───────┼─────────┤
│ OR-101          │ 144  │ 10.08 │ 154.08  │
│ OR-102          │ 1302 │ 91.14 │ 1393.14 │
│ OR-104          │ 200  │ 14.0  │ 214.0   │
│ OR-115          │ 63   │ 4.41  │ 67.41   │
│ OR-116          │ 98   │ 6.86  │ 104.86  │
│ OR-119          │ 50   │ 3.5   │ 53.5    │
│ OR-120          │ 25   │ 1.75  │ 26.75   │
│ OR-122          │ 160  │ 11.2  │ 171.2   │
│ OR-123          │ 70   │ 4.9   │ 74.9    │
│ OR-125          │ 15   │ 1.05  │ 16.05   │
└─────────────────┴──────┴───────┴─────────┘
```
* Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (7% IGIC).
```sql
select p.nombre, sum(dp.cantidad) as num, sum(dp.cantidad)*p.precio_venta as total, sum(dp.cantidad)*p.precio_venta*1.07 as total_imp from producto as p
join detalle_pedido as dp on dp.codigo_producto=p.codigo_producto
group by dp.codigo_producto 
having total>3000
limit 10;
┌───────────────────────┬─────┬────────┬───────────┐
│        nombre         │ num │ total  │ total_imp │
├───────────────────────┼─────┼────────┼───────────┤
│ Limonero 30/40        │ 131 │ 13100  │ 14017.0   │
│ Cerezo                │ 285 │ 19950  │ 21346.5   │
│ Kaki                  │ 76  │ 5320   │ 5692.4    │
│ Melocotonero          │ 111 │ 3552   │ 3800.64   │
│ Beucarnea Recurvata   │ 80  │ 3120   │ 3338.4    │
│ Beucarnea Recurvata   │ 70  │ 4130   │ 4419.1    │
│ Bismarckia Nobilis    │ 35  │ 9310   │ 9961.7    │
│ Chamaerops Humilis    │ 236 │ 15104  │ 16161.28  │
│ Dracaena Drago        │ 55  │ 3520   │ 3766.4    │
│ Trachycarpus Fortunei │ 279 │ 128898 │ 137920.86 │
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
select nombre from producto
where codigo_producto=(
    select codigo_producto from detalle_pedido
    group by codigo_producto
    order by sum(cantidad) desc
    limit 1
);
┌─────────────────┐
│     nombre      │
├─────────────────┤
│ Thymus Vulgaris │
└─────────────────┘
```
* Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
```sql
select * from cliente
where limite_credito>(
    select sum(total) from pago
    group by codigo_cliente
    having pago.codigo_cliente=cliente.codigo_cliente
) limit 10;
┌────────────────┬────────────────────────────────┬─────────────────┬───────────────────┬─────────────┬─────────────┬──────────────────────────────────────┬───────────────────┬──────────────────────────┬────────────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │         nombre_cliente         │ nombre_contacto │ apellido_contacto │  telefono   │     fax     │           linea_direccion1           │ linea_direccion2  │          ciudad          │     region     │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼────────────────────────────────┼─────────────────┼───────────────────┼─────────────┼─────────────┼──────────────────────────────────────┼───────────────────┼──────────────────────────┼────────────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 5              │ Tendo Garden                   │ Akane           │ Tendo             │ 55591233210 │ 55591233211 │ Null Street nº69                     │                   │ Miami                    │                │ USA   │ 696969        │ 22                         │ 600000         │
│ 7              │ Beragua                        │ Jose            │ Bermejo           │ 654987321   │ 916549872   │ C/pintor segundo                     │ Getafe            │ Madrid                   │ Madrid         │ Spain │ 28942         │ 11                         │ 20000          │
│ 9              │ Naturagua                      │ Guillermo       │ Rengifo           │ 689234750   │ 916428956   │ C/majadahonda                        │ Boadilla          │ Madrid                   │ Madrid         │ Spain │ 28947         │ 11                         │ 32000          │
│ 13             │ Camunas Jardines S.L.          │ Pedro           │ Camunas           │ 34914873241 │ 34914871541 │ C/Virgenes 45                        │ C/Princesas 2 1ºB │ San Lorenzo del Escorial │ Madrid         │ Spain │ 28145         │ 8                          │ 16481          │
│ 14             │ Dardena S.A.                   │ Juan            │ Rodriguez         │ 34912453217 │ 34912484764 │ C/Nueva York 74                      │                   │ Madrid                   │ Madrid         │ Spain │ 28003         │ 8                          │ 321000         │
│ 15             │ Jardin de Flores               │ Javier          │ Villar            │ 654865643   │ 914538776   │ C/ Oña 34                            │                   │ Madrid                   │ Madrid         │ Spain │ 28950         │ 30                         │ 40000          │
│ 19             │ Golf S.A.                      │ Luis            │ Martinez          │ 916458762   │ 912354475   │ C/Estancado                          │                   │ Santa cruz de Tenerife   │ Islas Canarias │ Spain │ 38297         │ 12                         │ 30000          │
│ 23             │ Sotogrande                     │ Maria           │ Santillana        │ 915576622   │ 914825645   │ C/Paseo del Parque                   │                   │ Sotogrande               │ Cadiz          │ Spain │ 11310         │ 12                         │ 60000          │
│ 26             │ Jardines y Mansiones Cactus SL │ Eva María       │ Sánchez           │ 916877445   │ 914477777   │ Polígono Industrial Maspalomas, Nº52 │ Móstoles          │ Madrid                   │ Madrid         │ Spain │ 29874         │ 9                          │ 76000          │
│ 27             │ Jardinerías Matías SL          │ Matías          │ San Martín        │ 916544147   │ 917897474   │ C/Francisco Arce, Nº44               │ Bustarviejo       │ Madrid                   │ Madrid         │ Spain │ 37845         │ 9                          │ 100500         │
└────────────────┴────────────────────────────────┴─────────────────┴───────────────────┴─────────────┴─────────────┴──────────────────────────────────────┴───────────────────┴──────────────────────────┴────────────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```
* Devuelve el producto que más unidades tiene en stock.
```sql
select nombre, cantidad_en_stock from producto 
where cantidad_en_stock=(
    select max(cantidad_en_stock) from producto
) limit 10;
┌─────────────────────────────┬───────────────────┐
│           nombre            │ cantidad_en_stock │
├─────────────────────────────┼───────────────────┤
│ Rosal copa                  │ 400               │
│ Albaricoquero Corbato       │ 400               │
│ Albaricoquero Moniqui       │ 400               │
│ Albaricoquero Kurrot        │ 400               │
│ Cerezo Burlat               │ 400               │
│ Cerezo Picota               │ 400               │
│ Cerezo Napoleón             │ 400               │
│ Ciruelo R. Claudia Verde    │ 400               │
│ Ciruelo Santa Rosa          │ 400               │
│ Ciruelo Golden Japan        │ 400               │
└─────────────────────────────┴───────────────────┘
```
* Devuelve el producto que menos unidades tiene en stock.
```sql
select nombre, cantidad_en_stock from producto 
where cantidad_en_stock=(
    select min(cantidad_en_stock) from producto
);
┌───────────────┬───────────────────┐
│    nombre     │ cantidad_en_stock │
├───────────────┼───────────────────┤
│ Brahea Armata │ 0                 │
└───────────────┴───────────────────┘
```
* Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
```sql
select nombre, apellido1, apellido2 from empleado
where codigo_jefe=(
    select codigo_empleado from empleado
    where nombre='Alberto' and apellido1='Soria'
);
┌─────────────┬────────────┬───────────┐
│   nombre    │ apellido1  │ apellido2 │
├─────────────┼────────────┼───────────┤
│ Felipe      │ Rosas      │ Marquez   │
│ Juan Carlos │ Ortiz      │ Serrano   │
│ Carlos      │ Soria      │ Jimenez   │
│ Emmanuel    │ Magaña     │ Perez     │
│ Francois    │ Fignon     │           │
│ Michael     │ Bolton     │           │
│ Hilary      │ Washington │           │
│ Nei         │ Nishikori  │           │
│ Amy         │ Johnson    │           │
│ Kevin       │ Fallmer    │           │
└─────────────┴────────────┴───────────┘
```
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
* Devuelve el producto que menos unidades tiene en stock.
```sql
select nombre, cantidad_en_stock from producto 
where cantidad_en_stock=(
    select min(cantidad_en_stock) from producto
);
┌───────────────┬───────────────────┐
│    nombre     │ cantidad_en_stock │
├───────────────┼───────────────────┤
│ Brahea Armata │ 0                 │
└───────────────┴───────────────────┘
```
* Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
```sql
select nombre, apellido1, puesto from empleado
where codigo_empleado not in(
    select codigo_empleado_rep_ventas from cliente
);
┌─────────────┬────────────┬───────────────────────┐
│   nombre    │ apellido1  │        puesto         │
├─────────────┼────────────┼───────────────────────┤
│ Marcos      │ Magaña     │ Director General      │
│ Ruben       │ López      │ Subdirector Marketing │
│ Alberto     │ Soria      │ Subdirector Ventas    │
│ Maria       │ Solís      │ Secretaria            │
│ Juan Carlos │ Ortiz      │ Representante Ventas  │
│ Carlos      │ Soria      │ Director Oficina      │
│ Hilario     │ Rodriguez  │ Representante Ventas  │
│ David       │ Palma      │ Representante Ventas  │
│ Oscar       │ Palma      │ Representante Ventas  │
│ Francois    │ Fignon     │ Director Oficina      │
│ Laurent     │ Serra      │ Representante Ventas  │
│ Hilary      │ Washington │ Director Oficina      │
│ Marcus      │ Paxton     │ Representante Ventas  │
│ Nei         │ Nishikori  │ Director Oficina      │
│ Narumi      │ Riko       │ Representante Ventas  │
│ Takuma      │ Nomura     │ Representante Ventas  │
│ Amy         │ Johnson    │ Director Oficina      │
│ Larry       │ Westfalls  │ Representante Ventas  │
│ John        │ Walton     │ Representante Ventas  │
│ Kevin       │ Fallmer    │ Director Oficina      │
└─────────────┴────────────┴───────────────────────┘
```
* Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql
select * from cliente
where codigo_cliente not in(
    select codigo_cliente from pago
) limit 10;
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬─────────────┬─────────────┬───────────────────┬──────────────────┬──────────────────────┬───────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │  telefono   │     fax     │ linea_direccion1  │ linea_direccion2 │        ciudad        │  region   │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼─────────────┼─────────────┼───────────────────┼──────────────────┼──────────────────────┼───────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 6              │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145 │ 34914851312 │ C/Leganes 15      │                  │ Fuenlabrada          │ Madrid    │ Spain │ 28945         │ 8
         │ 154310         │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810    │ 919535678   │ C/sinesio delgado │ Madrid           │ Madrid               │ Madrid    │ Spain │ 28930         │ 11
         │ 40000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001   │ 916421756   │ C/azores          │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain │ 28946         │ 11
         │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045   │ 916689215   │ C/Lagañas         │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain │ 28943         │ 11
         │ 20000          │
│ 12             │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145 │ 34914851312 │ C/Leganes 15      │                  │ Fuenlabrada          │ Madrid    │ Spain │ 28945         │ 8
         │ 154310         │
│ 17             │ Flowers, S.A                │ Beatriz         │ Fernandez         │ 698754159   │ 978453216   │ C/Luis Salquillo4 │                  │ Montornes del valles │ Barcelona │ Spain │ 24586         │ 5
         │ 3500           │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529   │ 916548735   │ Plaza Magallón 15 │                  │ Madrid               │ Madrid    │ Spain │ 28011         │ 30
         │ 5050           │
│ 20             │ Americh Golf Management SL  │ Mario           │ Suarez            │ 964493072   │ 964493063   │ C/Letardo         │                  │ Barcelona            │ Cataluña  │ Spain │ 12320         │ 12
         │ 20000          │
│ 21             │ Aloha                       │ Cristian        │ Rodrigez          │ 916485852   │ 914489898   │ C/Roman 3         │                  │ Canarias             │ Canarias  │ Spain │ 35488         │ 12
         │ 50000          │
│ 22             │ El Prat                     │ Francisco       │ Camacho           │ 916882323   │ 916493211   │ Avenida Tibidabo  │                  │ Barcelona            │ Cataluña  │ Spain │ 12320         │ 12
         │ 30000          │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴─────────────┴─────────────┴───────────────────┴──────────────────┴──────────────────────┴───────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```
* Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
```sql
select * from cliente
where codigo_cliente in(
    select codigo_cliente from pago
) limit 10;
┌────────────────┬───────────────────────┬─────────────────┬───────────────────┬─────────────┬─────────────┬─────────────────────┬───────────────────┬──────────────────────────┬────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │    nombre_cliente     │ nombre_contacto │ apellido_contacto │  telefono   │     fax     │  linea_direccion1   │ linea_direccion2  │          ciudad          │ region │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼───────────────────────┼─────────────────┼───────────────────┼─────────────┼─────────────┼─────────────────────┼───────────────────┼──────────────────────────┼────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 1              │ GoldFish Garden       │ Daniel G        │ GoldFish          │ 5556901745  │ 5556901746  │ False Street 52 2 A │                   │ San Francisco            │        │ USA   │ 24006         │ 19
       │ 3000           │
│ 3              │ Gardening Associates  │ Anne            │ Wright            │ 5557410345  │ 5557410346  │ Wall-e Avenue       │                   │ Miami                    │ Miami  │ USA   │ 24010         │ 19
       │ 6000           │
│ 4              │ Gerudo Valley         │ Link            │ Flaute            │ 5552323129  │ 5552323128  │ Oaks Avenue nº22    │                   │ New York                 │        │ USA   │ 85495         │ 22
       │ 12000          │
│ 5              │ Tendo Garden          │ Akane           │ Tendo             │ 55591233210 │ 55591233211 │ Null Street nº69    │                   │ Miami                    │        │ USA   │ 696969        │ 22
       │ 600000         │
│ 7              │ Beragua               │ Jose            │ Bermejo           │ 654987321   │ 916549872   │ C/pintor segundo    │ Getafe            │ Madrid                   │ Madrid │ Spain │ 28942         │ 11
       │ 20000          │
│ 9              │ Naturagua             │ Guillermo       │ Rengifo           │ 689234750   │ 916428956   │ C/majadahonda       │ Boadilla          │ Madrid                   │ Madrid │ Spain │ 28947         │ 11
       │ 32000          │
│ 13             │ Camunas Jardines S.L. │ Pedro           │ Camunas           │ 34914873241 │ 34914871541 │ C/Virgenes 45       │ C/Princesas 2 1ºB │ San Lorenzo del Escorial │ Madrid │ Spain │ 28145         │ 8
       │ 16481          │
│ 14             │ Dardena S.A.          │ Juan            │ Rodriguez         │ 34912453217 │ 34912484764 │ C/Nueva York 74     │                   │ Madrid                   │ Madrid │ Spain │ 28003         │ 8
       │ 321000         │
│ 15             │ Jardin de Flores      │ Javier          │ Villar            │ 654865643   │ 914538776   │ C/ Oña 34           │                   │ Madrid                   │ Madrid │ Spain │ 28950         │ 30
       │ 40000          │
│ 16             │ Flores Marivi         │ Maria           │ Rodriguez         │ 666555444   │ 912458657   │ C/Leganes24         │                   │ Fuenlabrada              │ Madrid │ Spain │ 28945         │ 5
       │ 1500           │
└────────────────┴───────────────────────┴─────────────────┴───────────────────┴─────────────┴─────────────┴─────────────────────┴───────────────────┴──────────────────────────┴────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```
* Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql
select * from producto
where codigo_producto not in(
    select codigo_producto from detalle_pedido
) limit 10;
┌─────────────────┬─────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────────────────────────┬──────────────────────────────────────────────────────────────┬───────────────────┬──────────────┬──────────────────┐
│ codigo_producto │                           nombre                            │   gama   │ dimensiones │         proveedor         │                         descripcion                          │ cantidad_en_stock │ precio_venta │ precio_proveedor │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-104          │ Olea-Olivos                                                 │ Frutales │ 12/4        │ Frutales Talavera S.A     │ Existen dos hipótesis sobre el origen del olivo, una que pos │ 50                │ 49       
    │ 39               │
│                 │                                                             │          │             │                           │ tula que proviene de las costas de Siria, Líbano e Israel y  │                   │
    │                  │
│                 │                                                             │          │             │                           │ otra que considera que lo considera originario de Asia menor │                   │
    │                  │
│                 │                                                             │          │             │                           │ . La llegada a Europa probablemente tuvo lugar de mano de lo │                   │
    │                  │
│                 │                                                             │          │             │                           │ s Fenicios, en transito por Chipre, Creta, e Islas del Mar E │                   │
    │                  │
│                 │                                                             │          │             │                           │ geo, pasando a Grecia y más tarde a Italia. Los primeros ind │                   │
    │                  │
│                 │                                                             │          │             │                           │ icios de la presencia del olivo en las costas mediterráneas  │                   │
    │                  │
│                 │                                                             │          │             │                           │ españolas coinciden con el dominio romano, aunque fueron pos │                   │
    │                  │
│                 │                                                             │          │             │                           │ teriormente los árabes los que impulsaron su cultivo en Anda │                   │
    │                  │
│                 │                                                             │          │             │                           │ lucía, convirtiendo a España en el primer país productor de  │                   │
    │                  │
│                 │                                                             │          │             │                           │ aceite de oliva a nivel mundial.                             │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-14           │ Calamondin Mini                                             │ Frutales │             │ Frutales Talavera S.A     │ Se trata de un pequeño arbolito de copa densa, con tendencia │ 15                │ 10       
    │ 8                │
│                 │                                                             │          │             │                           │  a la verticalidad, inerme o con cortas espinas. Sus hojas s │                   │
    │                  │
│                 │                                                             │          │             │                           │ on pequeñas, elípticas de 5-10 cm de longitud, con los pecío │                   │
    │                  │
│                 │                                                             │          │             │                           │ los estrechamente alados.Posee 1 o 2 flores en situación axi │                   │
    │                  │
│                 │                                                             │          │             │                           │ lar, al final de las ramillas.Sus frutos son muy pequeños (3 │                   │
    │                  │
│                 │                                                             │          │             │                           │ -3,5 cm de diámetro), con pocas semillas, esféricos u ovales │                   │
    │                  │
│                 │                                                             │          │             │                           │ , con la zona apical aplanada; corteza de color naranja-roji │                   │
    │                  │
│                 │                                                             │          │             │                           │ zo, muy fina y fácilmente separable de la pulpa, que es dulc │                   │
    │                  │
│                 │                                                             │          │             │                           │ e, ácida y comestible..                                      │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-19           │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │ Frutales │             │ NaranjasValencianas.com   │                                                              │ 350               │ 4        
    │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-20           │ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │ Frutales │             │ Frutales Talavera S.A     │                                                              │ 350               │ 4        
    │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-21           │ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │ Frutales │             │ Frutales Talavera S.A     │                                                              │ 350               │ 4        
    │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-24           │ Albaricoquero Corbato                                       │ Frutales │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8        
    │ 6                │
│                 │                                                             │          │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │
    │                  │
│                 │                                                             │          │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │
    │                  │
│                 │                                                             │          │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │
    │                  │
│                 │                                                             │          │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │
    │                  │
│                 │                                                             │          │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-25           │ Albaricoquero Moniqui                                       │ Frutales │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8        
    │ 6                │
│                 │                                                             │          │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │
    │                  │
│                 │                                                             │          │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │
    │                  │
│                 │                                                             │          │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │
    │                  │
│                 │                                                             │          │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │
    │                  │
│                 │                                                             │          │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-26           │ Albaricoquero Kurrot                                        │ Frutales │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8        
    │ 6                │
│                 │                                                             │          │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │
    │                  │
│                 │                                                             │          │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │
    │                  │
│                 │                                                             │          │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │
    │                  │
│                 │                                                             │          │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │
    │                  │
│                 │                                                             │          │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-27           │ Cerezo Burlat                                               │ Frutales │             │ Jerte Distribuciones S.L. │ Las principales especies de cerezo cultivadas en el mundo so │ 400               │ 8        
    │ 6                │
│                 │                                                             │          │             │                           │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │                   │
    │                  │
│                 │                                                             │          │             │                           │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │                   │
    │                  │
│                 │                                                             │          │             │                           │  son naturales del sureste de Europa y oeste de Asia. El cer │                   │
    │                  │
│                 │                                                             │          │             │                           │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │                   │
    │                  │
│                 │                                                             │          │             │                           │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │                   │
    │                  │
│                 │                                                             │          │             │                           │ evado por los pájaros y las migraciones humanas. Fue uno de  │                   │
    │                  │
│                 │                                                             │          │             │                           │ los frutales más apreciados por los griegos y con el Imperio │                   │
    │                  │
│                 │                                                             │          │             │                           │  Romano se extendió a regiones muy diversas. En la actualida │                   │
    │                  │
│                 │                                                             │          │             │                           │ d, el cerezo se encuentra difundido por numerosas regiones y │                   │
    │                  │
│                 │                                                             │          │             │                           │  países del mundo con clima templado                         │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-28           │ Cerezo Picota                                               │ Frutales │             │ Jerte Distribuciones S.L. │ Las principales especies de cerezo cultivadas en el mundo so │ 400               │ 8        
    │ 6                │
│                 │                                                             │          │             │                           │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │                   │
    │                  │
│                 │                                                             │          │             │                           │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │                   │
    │                  │
│                 │                                                             │          │             │                           │  son naturales del sureste de Europa y oeste de Asia. El cer │                   │
    │                  │
│                 │                                                             │          │             │                           │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │                   │
    │                  │
│                 │                                                             │          │             │                           │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │                   │
    │                  │
│                 │                                                             │          │             │                           │ evado por los pájaros y las migraciones humanas. Fue uno de  │                   │
    │                  │
│                 │                                                             │          │             │                           │ los frutales más apreciados por los griegos y con el Imperio │                   │
    │                  │
│                 │                                                             │          │             │                           │  Romano se extendió a regiones muy diversas. En la actualida │                   │
    │                  │
│                 │                                                             │          │             │                           │ d, el cerezo se encuentra difundido por numerosas regiones y │                   │
    │                  │
│                 │                                                             │          │             │                           │  países del mundo con clima templado                         │                   │
    │                  │
└─────────────────┴─────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────────────────────────┴──────────────────────────────────────────────────────────────┴───────────────────┴──────────────┴──────────────────┘
```
* Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
```sql
select e.nombre, e.apellido1, e.apellido2, e.puesto, o.telefono 
from empleado as e, oficina as o
where e.codigo_oficina=o.codigo_oficina 
and codigo_empleado not in(
    select codigo_empleado_rep_ventas from cliente
) limit 10;
┌─────────────┬───────────┬───────────┬───────────────────────┬─────────────────┐
│   nombre    │ apellido1 │ apellido2 │        puesto         │    telefono     │
├─────────────┼───────────┼───────────┼───────────────────────┼─────────────────┤
│ Marcos      │ Magaña    │ Perez     │ Director General      │ +34 925 867231  │
│ Ruben       │ López     │ Martinez  │ Subdirector Marketing │ +34 925 867231  │
│ Alberto     │ Soria     │ Carrasco  │ Subdirector Ventas    │ +34 925 867231  │
│ Maria       │ Solís     │ Jerez     │ Secretaria            │ +34 925 867231  │
│ Juan Carlos │ Ortiz     │ Serrano   │ Representante Ventas  │ +34 925 867231  │
│ Carlos      │ Soria     │ Jimenez   │ Director Oficina      │ +34 91 7514487  │
│ Hilario     │ Rodriguez │ Huertas   │ Representante Ventas  │ +34 91 7514487  │
│ David       │ Palma     │ Aceituno  │ Representante Ventas  │ +34 93 3561182  │
│ Oscar       │ Palma     │ Aceituno  │ Representante Ventas  │ +34 93 3561182  │
│ Francois    │ Fignon    │           │ Director Oficina      │ +33 14 723 4404 │
└─────────────┴───────────┴───────────┴───────────────────────┴─────────────────┘
```
* Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
```sql
select o.* from oficina as o, empleado as e
where o.codigo_oficina=e.codigo_oficina 
and e.codigo_empleado in(
    select c.codigo_empleado_rep_ventas from cliente as c, pedido as p, detalle_pedido as dp, producto as p
    where c.codigo_cliente=p.codigo_cliente and p.codigo_pedido=dp.codigo_pedido 
    and dp.codigo_producto=p.codigo_producto
    and p.gama='Frutales'
);
┌────────────────┬──────────────────────┬───────────┬───────────────────┬───────────────┬─────────────────┬──────────────────────────────┬─────────────────────┐
│ codigo_oficina │        ciudad        │   pais    │      region       │ codigo_postal │    telefono     │       linea_direccion1       │  linea_direccion2   │
├────────────────┼──────────────────────┼───────────┼───────────────────┼───────────────┼─────────────────┼──────────────────────────────┼─────────────────────┤
│ TAL-ES         │ Talavera de la Reina │ España    │ Castilla-LaMancha │ 45632         │ +34 925 867231  │ Francisco Aguirre, 32        │ 5º piso (exterior)  │
│ MAD-ES         │ Madrid               │ España    │ Madrid            │ 28032         │ +34 91 7514487  │ Bulevar Indalecio Prieto, 32 │                     │
│ MAD-ES         │ Madrid               │ España    │ Madrid            │ 28032         │ +34 91 7514487  │ Bulevar Indalecio Prieto, 32 │                     │
│ BCN-ES         │ Barcelona            │ España    │ Barcelona         │ 08019         │ +34 93 3561182  │ Avenida Diagonal, 38         │ 3A escalera Derecha │
│ BCN-ES         │ Barcelona            │ España    │ Barcelona         │ 08019         │ +34 93 3561182  │ Avenida Diagonal, 38         │ 3A escalera Derecha │
│ SFC-USA        │ San Francisco        │ EEUU      │ CA                │ 94080         │ +1 650 219 4782 │ 100 Market Street            │ Suite 300           │
│ SFC-USA        │ San Francisco        │ EEUU      │ CA                │ 94080         │ +1 650 219 4782 │ 100 Market Street            │ Suite 300           │
│ BOS-USA        │ Boston               │ EEUU      │ MA                │ 02108         │ +1 215 837 0825 │ 1550 Court Place             │ Suite 102           │
│ SYD-AU         │ Sydney               │ Australia │ APAC              │ NSW 2010      │ +61 2 9264 2451 │ 5-11 Wentworth Avenue        │ Floor #2            │
│ SYD-AU         │ Sydney               │ Australia │ APAC              │ NSW 2010      │ +61 2 9264 2451 │ 5-11 Wentworth Avenue        │ Floor #2            │
└────────────────┴──────────────────────┴───────────┴───────────────────┴───────────────┴─────────────────┴──────────────────────────────┴─────────────────────┘
```
* Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
```sql
select * from cliente 
where codigo_cliente in(
    select codigo_cliente from pedido
)
and codigo_cliente not in(
    select codigo_cliente from pago
);
┌────────────────┬────────────────┬─────────────────┬───────────────────┬───────────┬───────────┬──────────────────┬──────────────────┬────────┬─────────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │ nombre_cliente │ nombre_contacto │ apellido_contacto │ telefono  │    fax    │ linea_direccion1 │ linea_direccion2 │ ciudad │   region    │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito 
│
├────────────────┼────────────────┼─────────────────┼───────────────────┼───────────┼───────────┼──────────────────┼──────────────────┼────────┼─────────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 36             │ Flores S.L.    │ Antonio         │ Romero            │ 654352981 │ 685249700 │ Avenida España   │                  │ Madrid │ Fuenlabrada │ Spain │ 29643         │ 18                         │ 6000
│
└────────────────┴────────────────┴─────────────────┴───────────────────┴───────────┴───────────┴──────────────────┴──────────────────┴────────┴─────────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```
* Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
```sql
select * from cliente 
where codigo_cliente not in(
    select codigo_cliente from pago
) limit 10;
┌────────────────┬─────────────────────────────┬─────────────────┬───────────────────┬─────────────┬─────────────┬───────────────────┬──────────────────┬──────────────────────┬───────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │       nombre_cliente        │ nombre_contacto │ apellido_contacto │  telefono   │     fax     │ linea_direccion1  │ linea_direccion2 │        ciudad        │  region   │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼─────────────────────────────┼─────────────────┼───────────────────┼─────────────┼─────────────┼───────────────────┼──────────────────┼──────────────────────┼───────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 6              │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145 │ 34914851312 │ C/Leganes 15      │                  │ Fuenlabrada          │ Madrid    │ Spain │ 28945         │ 8
             │ 154310         │
│ 8              │ Club Golf Puerta del hierro │ Paco            │ Lopez             │ 62456810    │ 919535678   │ C/sinesio delgado │ Madrid           │ Madrid               │ Madrid    │ Spain │ 28930         │ 11
             │ 40000          │
│ 10             │ DaraDistribuciones          │ David           │ Serrano           │ 675598001   │ 916421756   │ C/azores          │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain │ 28946         │ 11
             │ 50000          │
│ 11             │ Madrileña de riegos         │ Jose            │ Tacaño            │ 655983045   │ 916689215   │ C/Lagañas         │ Fuenlabrada      │ Madrid               │ Madrid    │ Spain │ 28943         │ 11
             │ 20000          │
│ 12             │ Lasas S.A.                  │ Antonio         │ Lasas             │ 34916540145 │ 34914851312 │ C/Leganes 15      │                  │ Fuenlabrada          │ Madrid    │ Spain │ 28945         │ 8
             │ 154310         │
│ 17             │ Flowers, S.A                │ Beatriz         │ Fernandez         │ 698754159   │ 978453216   │ C/Luis Salquillo4 │                  │ Montornes del valles │ Barcelona │ Spain │ 24586         │ 5
             │ 3500           │
│ 18             │ Naturajardin                │ Victoria        │ Cruz              │ 612343529   │ 916548735   │ Plaza Magallón 15 │                  │ Madrid               │ Madrid    │ Spain │ 28011         │ 30
             │ 5050           │
│ 20             │ Americh Golf Management SL  │ Mario           │ Suarez            │ 964493072   │ 964493063   │ C/Letardo         │                  │ Barcelona            │ Cataluña  │ Spain │ 12320         │ 12
             │ 20000          │
│ 21             │ Aloha                       │ Cristian        │ Rodrigez          │ 916485852   │ 914489898   │ C/Roman 3         │                  │ Canarias             │ Canarias  │ Spain │ 35488         │ 12
             │ 50000          │
│ 22             │ El Prat                     │ Francisco       │ Camacho           │ 916882323   │ 916493211   │ Avenida Tibidabo  │                  │ Barcelona            │ Cataluña  │ Spain │ 12320         │ 12
             │ 30000          │
└────────────────┴─────────────────────────────┴─────────────────┴───────────────────┴─────────────┴─────────────┴───────────────────┴──────────────────┴──────────────────────┴───────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```
* Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
```sql
select * from cliente
where codigo_cliente in(
    select codigo_cliente from pago
) limit 10;
┌────────────────┬───────────────────────┬─────────────────┬───────────────────┬─────────────┬─────────────┬─────────────────────┬───────────────────┬──────────────────────────┬────────┬───────┬───────────────┬────────────────────────────┬────────────────┐
│ codigo_cliente │    nombre_cliente     │ nombre_contacto │ apellido_contacto │  telefono   │     fax     │  linea_direccion1   │ linea_direccion2  │          ciudad          │ region │ pais  │ codigo_postal │ codigo_empleado_rep_ventas │ limite_credito │
├────────────────┼───────────────────────┼─────────────────┼───────────────────┼─────────────┼─────────────┼─────────────────────┼───────────────────┼──────────────────────────┼────────┼───────┼───────────────┼────────────────────────────┼────────────────┤
│ 1              │ GoldFish Garden       │ Daniel G        │ GoldFish          │ 5556901745  │ 5556901746  │ False Street 52 2 A │                   │ San Francisco            │        │ USA   │ 24006         │ 19
       │ 3000           │
│ 3              │ Gardening Associates  │ Anne            │ Wright            │ 5557410345  │ 5557410346  │ Wall-e Avenue       │                   │ Miami                    │ Miami  │ USA   │ 24010         │ 19
       │ 6000           │
│ 4              │ Gerudo Valley         │ Link            │ Flaute            │ 5552323129  │ 5552323128  │ Oaks Avenue nº22    │                   │ New York                 │        │ USA   │ 85495         │ 22
       │ 12000          │
│ 5              │ Tendo Garden          │ Akane           │ Tendo             │ 55591233210 │ 55591233211 │ Null Street nº69    │                   │ Miami                    │        │ USA   │ 696969        │ 22
       │ 600000         │
│ 7              │ Beragua               │ Jose            │ Bermejo           │ 654987321   │ 916549872   │ C/pintor segundo    │ Getafe            │ Madrid                   │ Madrid │ Spain │ 28942         │ 11
       │ 20000          │
│ 9              │ Naturagua             │ Guillermo       │ Rengifo           │ 689234750   │ 916428956   │ C/majadahonda       │ Boadilla          │ Madrid                   │ Madrid │ Spain │ 28947         │ 11
       │ 32000          │
│ 13             │ Camunas Jardines S.L. │ Pedro           │ Camunas           │ 34914873241 │ 34914871541 │ C/Virgenes 45       │ C/Princesas 2 1ºB │ San Lorenzo del Escorial │ Madrid │ Spain │ 28145         │ 8
       │ 16481          │
│ 14             │ Dardena S.A.          │ Juan            │ Rodriguez         │ 34912453217 │ 34912484764 │ C/Nueva York 74     │                   │ Madrid                   │ Madrid │ Spain │ 28003         │ 8
       │ 321000         │
│ 15             │ Jardin de Flores      │ Javier          │ Villar            │ 654865643   │ 914538776   │ C/ Oña 34           │                   │ Madrid                   │ Madrid │ Spain │ 28950         │ 30
       │ 40000          │
│ 16             │ Flores Marivi         │ Maria           │ Rodriguez         │ 666555444   │ 912458657   │ C/Leganes24         │                   │ Fuenlabrada              │ Madrid │ Spain │ 28945         │ 5
       │ 1500           │
└────────────────┴───────────────────────┴─────────────────┴───────────────────┴─────────────┴─────────────┴─────────────────────┴───────────────────┴──────────────────────────┴────────┴───────┴───────────────┴────────────────────────────┴────────────────┘
```
* Devuelve un listado de los productos que nunca han aparecido en un pedido.
```sql
select * from producto 
where codigo_producto not in(
    select codigo_producto from detalle_pedido
) limit 10;
┌─────────────────┬─────────────────────────────────────────────────────────────┬──────────┬─────────────┬───────────────────────────┬──────────────────────────────────────────────────────────────┬───────────────────┬──────────────┬──────────────────┐
│ codigo_producto │                           nombre                            │   gama   │ dimensiones │         proveedor         │                         descripcion                          │ cantidad_en_stock │ precio_venta │ precio_proveedor │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-104          │ Olea-Olivos                                                 │ Frutales │ 12/4        │ Frutales Talavera S.A     │ Existen dos hipótesis sobre el origen del olivo, una que pos │ 50                │ 49       
    │ 39               │
│                 │                                                             │          │             │                           │ tula que proviene de las costas de Siria, Líbano e Israel y  │                   │
    │                  │
│                 │                                                             │          │             │                           │ otra que considera que lo considera originario de Asia menor │                   │
    │                  │
│                 │                                                             │          │             │                           │ . La llegada a Europa probablemente tuvo lugar de mano de lo │                   │
    │                  │
│                 │                                                             │          │             │                           │ s Fenicios, en transito por Chipre, Creta, e Islas del Mar E │                   │
    │                  │
│                 │                                                             │          │             │                           │ geo, pasando a Grecia y más tarde a Italia. Los primeros ind │                   │
    │                  │
│                 │                                                             │          │             │                           │ icios de la presencia del olivo en las costas mediterráneas  │                   │
    │                  │
│                 │                                                             │          │             │                           │ españolas coinciden con el dominio romano, aunque fueron pos │                   │
    │                  │
│                 │                                                             │          │             │                           │ teriormente los árabes los que impulsaron su cultivo en Anda │                   │
    │                  │
│                 │                                                             │          │             │                           │ lucía, convirtiendo a España en el primer país productor de  │                   │
    │                  │
│                 │                                                             │          │             │                           │ aceite de oliva a nivel mundial.                             │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-14           │ Calamondin Mini                                             │ Frutales │             │ Frutales Talavera S.A     │ Se trata de un pequeño arbolito de copa densa, con tendencia │ 15                │ 10       
    │ 8                │
│                 │                                                             │          │             │                           │  a la verticalidad, inerme o con cortas espinas. Sus hojas s │                   │
    │                  │
│                 │                                                             │          │             │                           │ on pequeñas, elípticas de 5-10 cm de longitud, con los pecío │                   │
    │                  │
│                 │                                                             │          │             │                           │ los estrechamente alados.Posee 1 o 2 flores en situación axi │                   │
    │                  │
│                 │                                                             │          │             │                           │ lar, al final de las ramillas.Sus frutos son muy pequeños (3 │                   │
    │                  │
│                 │                                                             │          │             │                           │ -3,5 cm de diámetro), con pocas semillas, esféricos u ovales │                   │
    │                  │
│                 │                                                             │          │             │                           │ , con la zona apical aplanada; corteza de color naranja-roji │                   │
    │                  │
│                 │                                                             │          │             │                           │ zo, muy fina y fácilmente separable de la pulpa, que es dulc │                   │
    │                  │
│                 │                                                             │          │             │                           │ e, ácida y comestible..                                      │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-19           │ Camelia Blanco, Chrysler Rojo, Soraya Naranja,              │ Frutales │             │ NaranjasValencianas.com   │                                                              │ 350               │ 4        
    │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-20           │ Landora Amarillo, Rose Gaujard bicolor blanco-rojo          │ Frutales │             │ Frutales Talavera S.A     │                                                              │ 350               │ 4        
    │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-21           │ Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte │ Frutales │             │ Frutales Talavera S.A     │                                                              │ 350               │ 4        
    │ 3                │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-24           │ Albaricoquero Corbato                                       │ Frutales │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8        
    │ 6                │
│                 │                                                             │          │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │
    │                  │
│                 │                                                             │          │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │
    │                  │
│                 │                                                             │          │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │
    │                  │
│                 │                                                             │          │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │
    │                  │
│                 │                                                             │          │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-25           │ Albaricoquero Moniqui                                       │ Frutales │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8        
    │ 6                │
│                 │                                                             │          │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │
    │                  │
│                 │                                                             │          │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │
    │                  │
│                 │                                                             │          │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │
    │                  │
│                 │                                                             │          │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │
    │                  │
│                 │                                                             │          │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-26           │ Albaricoquero Kurrot                                        │ Frutales │             │ Melocotones de Cieza S.A. │ árbol que puede pasar de los 6 m de altura, en la región med │ 400               │ 8        
    │ 6                │
│                 │                                                             │          │             │                           │ iterránea con ramas formando una copa redondeada. La corteza │                   │
    │                  │
│                 │                                                             │          │             │                           │  del tronco es pardo-violácea, agrietada; las ramas son roji │                   │
    │                  │
│                 │                                                             │          │             │                           │ zas y extendidas cuando jóvenes y las ramas secundarias son  │                   │
    │                  │
│                 │                                                             │          │             │                           │ cortas, divergentes y escasas. Las yemas latentes son frecue │                   │
    │                  │
│                 │                                                             │          │             │                           │ ntes especialmente sobre las ramas viejas.                   │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-27           │ Cerezo Burlat                                               │ Frutales │             │ Jerte Distribuciones S.L. │ Las principales especies de cerezo cultivadas en el mundo so │ 400               │ 8        
    │ 6                │
│                 │                                                             │          │             │                           │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │                   │
    │                  │
│                 │                                                             │          │             │                           │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │                   │
    │                  │
│                 │                                                             │          │             │                           │  son naturales del sureste de Europa y oeste de Asia. El cer │                   │
    │                  │
│                 │                                                             │          │             │                           │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │                   │
    │                  │
│                 │                                                             │          │             │                           │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │                   │
    │                  │
│                 │                                                             │          │             │                           │ evado por los pájaros y las migraciones humanas. Fue uno de  │                   │
    │                  │
│                 │                                                             │          │             │                           │ los frutales más apreciados por los griegos y con el Imperio │                   │
    │                  │
│                 │                                                             │          │             │                           │  Romano se extendió a regiones muy diversas. En la actualida │                   │
    │                  │
│                 │                                                             │          │             │                           │ d, el cerezo se encuentra difundido por numerosas regiones y │                   │
    │                  │
│                 │                                                             │          │             │                           │  países del mundo con clima templado                         │                   │
    │                  │
├─────────────────┼─────────────────────────────────────────────────────────────┼──────────┼─────────────┼───────────────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ FR-28           │ Cerezo Picota                                               │ Frutales │             │ Jerte Distribuciones S.L. │ Las principales especies de cerezo cultivadas en el mundo so │ 400               │ 8        
    │ 6                │
│                 │                                                             │          │             │                           │ n el cerezo dulce (Prunus avium), el guindo (P. cerasus) y e │                   │
    │                  │
│                 │                                                             │          │             │                           │ l cerezo \"Duke\", híbrido de los anteriores. Ambas especies │                   │
    │                  │
│                 │                                                             │          │             │                           │  son naturales del sureste de Europa y oeste de Asia. El cer │                   │
    │                  │
│                 │                                                             │          │             │                           │ ezo dulce tuvo su origen probablemente en el mar Negro y en  │                   │
    │                  │
│                 │                                                             │          │             │                           │ el mar Caspio, difundiéndose después hacia Europa y Asia, ll │                   │
    │                  │
│                 │                                                             │          │             │                           │ evado por los pájaros y las migraciones humanas. Fue uno de  │                   │
    │                  │
│                 │                                                             │          │             │                           │ los frutales más apreciados por los griegos y con el Imperio │                   │
    │                  │
│                 │                                                             │          │             │                           │  Romano se extendió a regiones muy diversas. En la actualida │                   │
    │                  │
│                 │                                                             │          │             │                           │ d, el cerezo se encuentra difundido por numerosas regiones y │                   │
    │                  │
│                 │                                                             │          │             │                           │  países del mundo con clima templado                         │                   │
    │                  │
└─────────────────┴─────────────────────────────────────────────────────────────┴──────────┴─────────────┴───────────────────────────┴──────────────────────────────────────────────────────────────┴───────────────────┴──────────────┴──────────────────┘
```
* Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
```sql
select * from producto 
where codigo_producto in(
    select codigo_producto from detalle_pedido
) limit 10;
┌─────────────────┬────────────────────────────────┬──────────────┬─────────────┬───────────────────┬──────────────────────────────────────────────────────────────┬───────────────────┬──────────────┬──────────────────┐
│ codigo_producto │             nombre             │     gama     │ dimensiones │     proveedor     │                         descripcion                          │ cantidad_en_stock │ precio_venta │ precio_proveedor │
├─────────────────┼────────────────────────────────┼──────────────┼─────────────┼───────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ 11679           │ Sierra de Poda 400MM           │ Herramientas │ 0,258       │ HiperGarden Tools │ Gracias a la poda se consigue manipular un poco la naturalez │ 15                │ 14           │ 11               │
│                 │                                │              │             │                   │ a, dándole la forma que más nos guste. Este trabajo básico d │                   │              │                  │
│                 │                                │              │             │                   │ e jardinería también facilita que las plantas crezcan de un  │                   │              │                  │
│                 │                                │              │             │                   │ modo más equilibrado, y que las flores y los frutos vuelvan  │                   │              │                  │
│                 │                                │              │             │                   │ cada año con regularidad. Lo mejor es dar forma cuando los e │                   │              │                  │
│                 │                                │              │             │                   │ jemplares son jóvenes, de modo que exijan pocos cuidados cua │                   │              │                  │
│                 │                                │              │             │                   │ ndo sean adultos. Además de saber cuándo y cómo hay que poda │                   │              │                  │
│                 │                                │              │             │                   │ r, tener unas herramientas adecuadas para esta labor es tamb │                   │              │                  │
│                 │                                │              │             │                   │ ién de vital importancia.                                    │                   │              │                  │
├─────────────────┼────────────────────────────────┼──────────────┼─────────────┼───────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ 21636           │ Pala                           │ Herramientas │ 0,156       │ HiperGarden Tools │ Palas de acero con cresta de corte en la punta para cortar b │ 15                │ 14           │ 13               │
│                 │                                │              │             │                   │ ien el terreno. Buena penetración en tierras muy compactas.  │                   │              │                  │
├─────────────────┼────────────────────────────────┼──────────────┼─────────────┼───────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ 22225           │ Rastrillo de Jardín            │ Herramientas │ 1,064       │ HiperGarden Tools │ Fabuloso rastillo que le ayudará a eliminar piedras, hojas,  │ 15                │ 12           │ 11               │
│                 │                                │              │             │                   │ ramas y otros elementos incómodos en su jardín.              │                   │              │                  │
├─────────────────┼────────────────────────────────┼──────────────┼─────────────┼───────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ 30310           │ Azadón                         │ Herramientas │ 0,168       │ HiperGarden Tools │ Longitud:24cm. Herramienta fabricada en acero y pintura epox │ 15                │ 12           │ 11               │
│                 │                                │              │             │                   │ i,alargando su durabilidad y preveniendo la corrosión.Diseño │                   │              │                  │
│                 │                                │              │             │                   │  pensado para el ahorro de trabajo.                          │                   │              │                  │
├─────────────────┼────────────────────────────────┼──────────────┼─────────────┼───────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ AR-001          │ Ajedrea                        │ Aromáticas   │ 15-20       │ Murcia Seasons    │ Planta aromática que fresca se utiliza para condimentar carn │ 140               │ 1            │ 0                │
│                 │                                │              │             │                   │ es y ensaladas, y seca, para pastas, sopas y guisantes       │                   │              │                  │
├─────────────────┼────────────────────────────────┼──────────────┼─────────────┼───────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ AR-002          │ Lavándula Dentata              │ Aromáticas   │ 15-20       │ Murcia Seasons    │ Espliego de jardín, Alhucema rizada, Alhucema dentada, Cantu │ 140               │ 1            │ 0                │
│                 │                                │              │             │                   │ eso rizado. Familia: Lamiaceae.Origen: España y Portugal. Ma │                   │              │                  │
│                 │                                │              │             │                   │ ta de unos 60 cm de alto. Las hojas son aromáticas, dentadas │                   │              │                  │
│                 │                                │              │             │                   │  y de color verde grisáceas.  Produce compactas espigas de f │                   │              │                  │
│                 │                                │              │             │                   │ lores pequeñas, ligeramente aromáticas, tubulares,de color a │                   │              │                  │
│                 │                                │              │             │                   │ zulado y con brácteas púrpuras.  Frutos: nuececillas alargad │                   │              │                  │
│                 │                                │              │             │                   │ as encerradas en el tubo del cáliz.  Se utiliza en jardineri │                   │              │                  │
│                 │                                │              │             │                   │ a y no en perfumeria como otros cantuesos, espliegos y lavan │                   │              │                  │
│                 │                                │              │             │                   │ das.  Tiene propiedades aromatizantes y calmantes. Adecuadas │                   │              │                  │
│                 │                                │              │             │                   │  para la formación de setos bajos. Se dice que su aroma ahuy │                   │              │                  │
│                 │                                │              │             │                   │ enta pulgones y otros insectos perjudiciales para las planta │                   │              │                  │
│                 │                                │              │             │                   │ s vecinas.                                                   │                   │              │                  │
├─────────────────┼────────────────────────────────┼──────────────┼─────────────┼───────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ AR-003          │ Mejorana                       │ Aromáticas   │ 15-20       │ Murcia Seasons    │ Origanum majorana. No hay que confundirlo con el orégano. Su │ 140               │ 1            │ 0                │
│                 │                                │              │             │                   │  sabor se parece más al tomillo, pero es más dulce y aromáti │                   │              │                  │
│                 │                                │              │             │                   │ co.Se usan las hojas frescas o secas, picadas, machacadas o  │                   │              │                  │
│                 │                                │              │             │                   │ en polvo, en sopas, rellenos, quiches y tartas, tortillas, p │                   │              │                  │
│                 │                                │              │             │                   │ latos con papas y, como aderezo, en ramilletes de hierbas.El │                   │              │                  │
│                 │                                │              │             │                   │  sabor delicado de la mejorana se elimina durante la cocción │                   │              │                  │
│                 │                                │              │             │                   │ , de manera que es mejor agregarla cuando el plato esté en s │                   │              │                  │
│                 │                                │              │             │                   │ u punto o en aquéllos que apenas necesitan cocción.          │                   │              │                  │
├─────────────────┼────────────────────────────────┼──────────────┼─────────────┼───────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ AR-004          │ Melissa                        │ Aromáticas   │ 15-20       │ Murcia Seasons    │ Es una planta perenne (dura varios años) conocida por el agr │ 140               │ 1            │ 0                │
│                 │                                │              │             │                   │ adable y característico olor a limón que desprenden en veran │                   │              │                  │
│                 │                                │              │             │                   │ o. Nunca debe faltar en la huerta o jardín por su agradable  │                   │              │                  │
│                 │                                │              │             │                   │ aroma y por los variados usos que tiene: planta olorosa, con │                   │              │                  │
│                 │                                │              │             │                   │ dimentaria y medicinal. Su cultivo es muy fácil. Le va bien  │                   │              │                  │
│                 │                                │              │             │                   │ un suelo ligero, con buen drenaje y riego sin exceso. A plen │                   │              │                  │
│                 │                                │              │             │                   │ o sol o por lo menos 5 horas de sol por día. Cada año, su ab │                   │              │                  │
│                 │                                │              │             │                   │ onado mineral correspondiente.En otoño, la melisa pierde el  │                   │              │                  │
│                 │                                │              │             │                   │ agradable olor a limón que desprende en verano sus flores az │                   │              │                  │
│                 │                                │              │             │                   │ ules y blancas. En este momento se debe cortar a unos 20 cm. │                   │              │                  │
│                 │                                │              │             │                   │  del suelo. Brotará de forma densa en primavera.             │                   │              │                  │
├─────────────────┼────────────────────────────────┼──────────────┼─────────────┼───────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ AR-005          │ Mentha Sativa                  │ Aromáticas   │ 15-20       │ Murcia Seasons    │ ¿Quién no conoce la Hierbabuena? Se trata de una plantita mu │ 140               │ 1            │ 0                │
│                 │                                │              │             │                   │ y aromática, agradable y cultivada extensamente por toda Esp │                   │              │                  │
│                 │                                │              │             │                   │ aña. Es hierba perenne (por tanto vive varios años, no es an │                   │              │                  │
│                 │                                │              │             │                   │ ual). Puedes cultivarla en maceta o plantarla en la tierra d │                   │              │                  │
│                 │                                │              │             │                   │ el jardín o en un rincón del huerto. Lo más importante es qu │                   │              │                  │
│                 │                                │              │             │                   │ e cuente con bastante agua. En primavera debes aportar ferti │                   │              │                  │
│                 │                                │              │             │                   │ lizantes minerales. Vive mejor en semisombra que a pleno sol │                   │              │                  │
│                 │                                │              │             │                   │ .Si ves orugas o los agujeros en hojas consecuencia de su at │                   │              │                  │
│                 │                                │              │             │                   │ aque, retíralas una a una a mano; no uses insecticidas quími │                   │              │                  │
│                 │                                │              │             │                   │ cos.                                                         │                   │              │                  │
├─────────────────┼────────────────────────────────┼──────────────┼─────────────┼───────────────────┼──────────────────────────────────────────────────────────────┼───────────────────┼──────────────┼──────────────────┤
│ AR-006          │ Petrosilium Hortense (Peregil) │ Aromáticas   │ 15-20       │ Murcia Seasons    │ Nombre científico o latino: Petroselinum hortense, Petroseli │ 140               │ 1            │ 0                │
│                 │                                │              │             │                   │ num crispum. Nombre común o vulgar: Perejil, Perejil rizado  │                   │              │                  │
│                 │                                │              │             │                   │ Familia: Umbelliferae (Umbelíferas). Origen: el origen del p │                   │              │                  │
│                 │                                │              │             │                   │ erejil se encuentra en el Mediterraneo. Esta naturalizada en │                   │              │                  │
│                 │                                │              │             │                   │  casi toda Europa. Se utiliza como condimento y para adorno, │                   │              │                  │
│                 │                                │              │             │                   │  pero también en ensaladas. Se suele regalar en las frutería │                   │              │                  │
│                 │                                │              │             │                   │ s y verdulerías.El perejil lo hay de 2 tipos: de hojas plana │                   │              │                  │
│                 │                                │              │             │                   │ s y de hojas rizadas.                                        │                   │              │                  │
└─────────────────┴────────────────────────────────┴──────────────┴─────────────┴───────────────────┴──────────────────────────────────────────────────────────────┴───────────────────┴──────────────┴──────────────────┘
```

## Consultas variadas en SQL

* Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
```sql
select c.nombre_cliente, count(p.codigo_pedido) as num_p from cliente as c
join pedido as p on p.codigo_cliente=c.codigo_cliente
group by p.codigo_cliente
having num_p!=0;
┌────────────────────────────────┬───────┐
│         nombre_cliente         │ num_p │
├────────────────────────────────┼───────┤
│ GoldFish Garden                │ 11    │
│ Gardening Associates           │ 9     │
│ Gerudo Valley                  │ 5     │
│ Tendo Garden                   │ 5     │
│ Beragua                        │ 5     │
│ Naturagua                      │ 5     │
│ Camunas Jardines S.L.          │ 5     │
│ Dardena S.A.                   │ 5     │
│ Jardin de Flores               │ 5     │
│ Flores Marivi                  │ 10    │
│ Golf S.A.                      │ 5     │
│ Sotogrande                     │ 5     │
│ Jardines y Mansiones Cactus SL │ 5     │
│ Jardinerías Matías SL          │ 5     │
│ Agrojardin                     │ 5     │
│ Jardineria Sara                │ 10    │
│ Tutifruti S.A                  │ 5     │
│ Flores S.L.                    │ 5     │
│ El Jardin Viviente S.L         │ 5     │
└────────────────────────────────┴───────┘
```
* Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
```sql
select c.nombre_cliente, sum(p.total) as total from cliente as c
join pago as p on c.codigo_cliente=p.codigo_cliente
group by p.codigo_cliente
having total!=0;
┌────────────────────────────────┬───────┐
│         nombre_cliente         │ total │
├────────────────────────────────┼───────┤
│ GoldFish Garden                │ 4000  │
│ Gardening Associates           │ 10926 │
│ Gerudo Valley                  │ 81849 │
│ Tendo Garden                   │ 23794 │
│ Beragua                        │ 2390  │
│ Naturagua                      │ 929   │
│ Camunas Jardines S.L.          │ 2246  │
│ Dardena S.A.                   │ 4160  │
│ Jardin de Flores               │ 12081 │
│ Flores Marivi                  │ 4399  │
│ Golf S.A.                      │ 232   │
│ Sotogrande                     │ 272   │
│ Jardines y Mansiones Cactus SL │ 18846 │
│ Jardinerías Matías SL          │ 10972 │
│ Agrojardin                     │ 8489  │
│ Jardineria Sara                │ 7863  │
│ Tutifruti S.A                  │ 3321  │
│ El Jardin Viviente S.L         │ 1171  │
└────────────────────────────────┴───────┘
```
* Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
```sql
select distinct(c.nombre_cliente) from cliente as c
join pedido as p on p.codigo_cliente=c.codigo_cliente
where fecha_pedido regexp '^2008'
order by c.nombre_cliente;
┌────────────────────────────────┐
│         nombre_cliente         │
├────────────────────────────────┤
│ Camunas Jardines S.L.          │
│ Dardena S.A.                   │
│ El Jardin Viviente S.L         │
│ Flores Marivi                  │
│ Flores S.L.                    │
│ Gerudo Valley                  │
│ GoldFish Garden                │
│ Jardin de Flores               │
│ Jardines y Mansiones Cactus SL │
│ Tendo Garden                   │
│ Tutifruti S.A                  │
└────────────────────────────────┘
```
* Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
```sql
select c.nombre_cliente, e.nombre, e.apellido1, o.telefono from cliente as c
join empleado as e, oficina as o on e.codigo_empleado=c.codigo_empleado_rep_ventas
and o.codigo_oficina=e.codigo_oficina
where c.codigo_cliente not in(
    select codigo_cliente from pago
);
┌─────────────────────────────┬─────────────┬────────────┬─────────────────┐
│       nombre_cliente        │   nombre    │ apellido1  │    telefono     │
├─────────────────────────────┼─────────────┼────────────┼─────────────────┤
│ Lasas S.A.                  │ Mariano     │ López      │ +34 91 7514487  │
│ Club Golf Puerta del hierro │ Emmanuel    │ Magaña     │ +34 93 3561182  │
│ DaraDistribuciones          │ Emmanuel    │ Magaña     │ +34 93 3561182  │
│ Madrileña de riegos         │ Emmanuel    │ Magaña     │ +34 93 3561182  │
│ Lasas S.A.                  │ Mariano     │ López      │ +34 91 7514487  │
│ Flowers, S.A                │ Felipe      │ Rosas      │ +34 925 867231  │
│ Naturajardin                │ Julian      │ Bellinelli │ +61 2 9264 2451 │
│ Americh Golf Management SL  │ José Manuel │ Martinez   │ +34 93 3561182  │
│ Aloha                       │ José Manuel │ Martinez   │ +34 93 3561182  │
│ El Prat                     │ José Manuel │ Martinez   │ +34 93 3561182  │
│ Vivero Humanes              │ Julian      │ Bellinelli │ +61 2 9264 2451 │
│ Fuenla City                 │ Felipe      │ Rosas      │ +34 925 867231  │
│ Top Campo                   │ Felipe      │ Rosas      │ +34 925 867231  │
│ Campohermoso                │ Julian      │ Bellinelli │ +61 2 9264 2451 │
│ france telecom              │ Lionel      │ Narvaez    │ +33 14 723 4404 │
│ Musée du Louvre             │ Lionel      │ Narvaez    │ +33 14 723 4404 │
│ Flores S.L.                 │ Michael     │ Bolton     │ +1 650 219 4782 │
│ The Magic Garden            │ Michael     │ Bolton     │ +1 650 219 4782 │
└─────────────────────────────┴─────────────┴────────────┴─────────────────┘
```
* Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
```sql
select c.nombre_cliente, e.nombre, e.apellido1, o.ciudad from cliente as c 
join empleado as e, oficina as o
on c.codigo_empleado_rep_ventas=e.codigo_empleado and e.codigo_oficina=o.codigo_oficina
limit 10;
┌─────────────────────────────┬─────────────────┬───────────┬───────────────┐
│       nombre_cliente        │     nombre      │ apellido1 │    ciudad     │
├─────────────────────────────┼─────────────────┼───────────┼───────────────┤
│ GoldFish Garden             │ Walter Santiago │ Sanchez   │ San Francisco │
│ Gardening Associates        │ Walter Santiago │ Sanchez   │ San Francisco │
│ Gerudo Valley               │ Lorena          │ Paxton    │ Boston        │
│ Tendo Garden                │ Lorena          │ Paxton    │ Boston        │
│ Lasas S.A.                  │ Mariano         │ López     │ Madrid        │
│ Beragua                     │ Emmanuel        │ Magaña    │ Barcelona     │
│ Club Golf Puerta del hierro │ Emmanuel        │ Magaña    │ Barcelona     │
│ Naturagua                   │ Emmanuel        │ Magaña    │ Barcelona     │
│ DaraDistribuciones          │ Emmanuel        │ Magaña    │ Barcelona     │
│ Madrileña de riegos         │ Emmanuel        │ Magaña    │ Barcelona     │
└─────────────────────────────┴─────────────────┴───────────┴───────────────┘
```
* Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
```sql
select e.nombre, e.apellido1, e.apellido2, o.telefono from empleado as e
join oficina as o on e.codigo_oficina=o.codigo_oficina
where codigo_empleado not in(
    select codigo_empleado_rep_ventas from cliente
) limit 10;
┌─────────────┬───────────┬───────────┬─────────────────┐
│   nombre    │ apellido1 │ apellido2 │    telefono     │
├─────────────┼───────────┼───────────┼─────────────────┤
│ Marcos      │ Magaña    │ Perez     │ +34 925 867231  │
│ Ruben       │ López     │ Martinez  │ +34 925 867231  │
│ Alberto     │ Soria     │ Carrasco  │ +34 925 867231  │
│ Maria       │ Solís     │ Jerez     │ +34 925 867231  │
│ Juan Carlos │ Ortiz     │ Serrano   │ +34 925 867231  │
│ Carlos      │ Soria     │ Jimenez   │ +34 91 7514487  │
│ Hilario     │ Rodriguez │ Huertas   │ +34 91 7514487  │
│ David       │ Palma     │ Aceituno  │ +34 93 3561182  │
│ Oscar       │ Palma     │ Aceituno  │ +34 93 3561182  │
│ Francois    │ Fignon    │           │ +33 14 723 4404 │
└─────────────┴───────────┴───────────┴─────────────────┘
```
* Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
```sql
select o.ciudad, count(e.codigo_empleado) from oficina as o
join empleado as e on o.codigo_oficina=e.codigo_oficina
group by o.ciudad;
┌──────────────────────┬──────────────────────────┐
│        ciudad        │ count(e.codigo_empleado) │
├──────────────────────┼──────────────────────────┤
│ Barcelona            │ 4                        │
│ Boston               │ 3                        │
│ Londres              │ 3                        │
│ Madrid               │ 4                        │
│ Paris                │ 3                        │
│ San Francisco        │ 2                        │
│ Sydney               │ 3                        │
│ Talavera de la Reina │ 6                        │
│ Tokyo                │ 3                        │
└──────────────────────┴──────────────────────────┘
```