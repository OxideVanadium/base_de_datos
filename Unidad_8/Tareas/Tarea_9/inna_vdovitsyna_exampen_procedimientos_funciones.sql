/**¿Sabías que la mayoría de los adultos sanos pueden ser donantes? Aunque existen ciertas condiciones que debes cumplir para realizar con éxito una donación. Descubre los requisitos básicos para donar sangre.

Para la poder donar sangre se deben cumplir varias condiciones:

Tener un peso superior a 50Kg.
No haber donado en un periodo anterior a 90 días en caso de ser hombre y 120 días en caso de mujer.

Teniendo en cuenta esta información se pide:

Crea una base datos llamada donación. **/
create database donacion;
use donacion; 

/**

Crea una tabla llamada persona con los siguientes campos:
Identificador Auto Incremental (Integer) PK
Identificador (Texto) 
Peso. (Entero)
Admitido. Texto(Si/No).(Valores de dominio:Si/No)
Sexo. Texto (H/M).(Valores de dominio:H/M)
Fecha Última Donación. **/

create table persona(
    id int primary key auto_increment,
    id_persona varchar(20),
    peso int,
    admitido varchar(5),
    sexo varchar(5),
    fecha date
);
insert into persona(id_persona, fecha)
values('eiojuoiew', current_timestamp());
/**

Se pide:

- Realiza los siguientes procedimientos:

- (1) Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. El procedimiento debe de recibir como parámetro de entrada, al menos, el número de registros 
que se desea insertar y se debe de lanzar, al menos, en dos ocasiones, para verificar su correcto funcionamiento. Los datos deben de ser aleatorios, es decir, en cada inserción 
de debe de auto generar o seleccionar uno al azar, de los campos requeridos. **/
delimiter $$

create procedure insert_rand(in iter int, in min_peso int, in max_peso int)
begin
declare n_id varchar(20);
declare n_sexo varchar(5);
declare n_iter int default 0;
declare n_fecha date;

while n_iter < iter do
    if RAND()>0.5 then
        set n_sexo='M';
    else
        set n_sexo='H';
    end if;

    set n_id=substring_index(uuid(), '-', 1);
    set n_fecha=date_add(current_timestamp(), interval -floor(rand()*365) day);

    insert into persona(id_persona, peso, sexo, fecha)
    values(n_id, floor(min_peso + (RAND() * (max_peso - min_peso))), n_sexo, n_fecha);
    update persona
    set admitido=puede_realizar(n_id, n_fecha);

    set n_iter = n_iter + 1;

end while;

end $$

delimiter ;

call insert_rand(5, 20, 120);

select date_add(current_timestamp(), interval -floor(rand()*365) day);

select floor(rand()*365);

select puede_realizar('ae38d71e', current_timestamp());

select datediff(current_timestamp(), '2023-06-30');

/**
+----+------------+------+----------+------+------------+
| id | id_persona | peso | admitido | sexo | fecha      |
+----+------------+------+----------+------+------------+
|  1 | ae36c509   |  115 | No       | H    | 2024-05-28 |
|  2 | ae38d71e   |   52 | No       | M    | 2023-06-30 |
|  3 | ae39e6df   |  116 | No       | M    | 2024-02-08 |
|  4 | ae3aa7b8   |   36 | No       | M    | 2023-11-04 |
|  5 | ae3b7de9   |   64 | No       | H    | 2024-03-28 |
+----+------------+------+----------+------+------------+

+----+------------+------+----------+------+------------+
| id | id_persona | peso | admitido | sexo | fecha      |
+----+------------+------+----------+------+------------+
|  1 | b0e516a9   |  108 | No       | H    | 2024-05-29 |
|  2 | eab13081   |   40 | No       | H    | 2024-05-29 |
|  3 | eab25694   |  119 | No       | M    | 2024-05-29 |
|  4 | 06b25ee6   |  117 | No       | H    | 2024-05-29 |
|  5 | 06b3a75f   |   82 | No       | M    | 2024-05-29 |
|  6 | 06b49a56   |   34 | No       | H    | 2024-05-29 |
|  7 | 06b57d63   |   26 | No       | M    | 2024-05-29 |
|  8 | 06b6652e   |   22 | No       | H    | 2024-05-29 |
+----+------------+------+----------+------+------------+

- (2) Realiza un procedimiento que permita actualizar el la fecha de última donación, teniendo como parámetro de entrada el identificador de la persona, y una fecha. **/
delimiter $$

create procedure actualizar_fecha(in n_id varchar(20), in n_fecha date)
begin
update persona
set fecha=n_fecha
where id_persona=n_id;
end $$

delimiter ;

call actualizar_fecha('06b6652e', '2024-04-29');

/**
+----+------------+------+----------+------+------------+
| id | id_persona | peso | admitido | sexo | fecha      |
+----+------------+------+----------+------+------------+
|  8 | 06b6652e   |   22 | No       | H    | 2024-05-29 |
+----+------------+------+----------+------+------------+

+----+------------+------+----------+------+------------+
| id | id_persona | peso | admitido | sexo | fecha      |
+----+------------+------+----------+------+------------+
|  8 | 06b6652e   |   22 | No       | H    | 2024-04-29 |
+----+------------+------+----------+------+------------+


- (3) Crea un procedimiento llamado CalcularTotalDonaciones que calcule la cantidad total de donaciones realizadas por cada persona y la almacene en una tabla llamada total_donaciones. 
La tabla total_donaciones debe tener dos columnas: id_persona (texto) y cantidad_total (integer). **/
create table total_donaciones(
    id_persona varchar(20),
    cantidad_total int
);

delimiter $$

create procedure CalcularTotalDonaciones()
begin
declare sstop int default 0;
declare n_id varchar(20);
declare curs cursor for select n_id from persona;
declare continue handler for not found set sstop=1;

open curs;
n_loop: loop
fetch curs into n_id;
if sstop=1 then
    leave n_loop;
end if;
if n_id not in (select id_persona from total_donaciones) then
    insert into total_donaciones(id_persona, cantidad_total)
    values(n_id, 1);
else
    update total_donaciones
    set cantidad_total=cantidad_total+1
    where id_persona=n_id;
end if;

end loop;
close curs;

end$$

delimiter ;

/**

- (4) Crea un procedimiento que me permita eliminar una persona de la tabla total_donaciones. **/

delimiter $$

create procedure eliminar_persona(in n_id varchar(20))
begin
delete from total_donaciones
where id_persona=n_id;
end$$

delimiter;

call eliminar_persona('0b02ab9f');

/**
+------------+----------------+
| id_persona | cantidad_total |
+------------+----------------+
| 0afb3db8   |              1 |
| 0afd7801   |              1 |
| 0afe70fe   |              1 |
| 0aff0990   |              1 |
| 0afffb2a   |              1 |
| 0b00993b   |              1 |
| 0b013369   |              1 |
| 0b01d06b   |              1 |
| 0b035df4   |              2 |
+------------+----------------+
- Realizar cada una de las siguientes funciones:

- (1) Realiza una función que determine si una persona almacenada en la tabla persona puede realizar una donación. Para ello la función recibe como parámetro de entrada el identificador 
de esta persona, y una fecha de donación. Revisa las condiciones para que una persona pueda o no donar. Posteriormente actualice el valor de la última donación de la persona indicada con el parámetro de entrada.
**/
delimiter $$

create function puede_realizar(n_id varchar(20), n_fecha date) returns int deterministic

begin
declare n_peso int;
declare n_sexo varchar(5);
declare o_fecha date;
declare min_peso int default 50;
declare n_pause int;
declare apt varchar(5);
select peso, sexo, fecha from persona
where id_persona=n_id
into n_peso, n_sexo, o_fecha;

if n_sexo='H' then 
    set n_pause=90;
elseif n_sexo='M' then
    set n_pause=120;
end if;

if n_peso<min_peso then
    set apt='No';
elseif datediff(o_fecha, n_fecha) < n_pause then
    set apt='No';
else
    set apt='Si';
end if;


return n_pause;

end $$

delimiter ;

drop procedure puede_realizar;


/**
- (2) Realiza una función que determine que persona es la que más donaciones ha realizado.**/
delimiter $$

create function max_don() returns varchar(20) deterministic
begin
declare max_don varchar(20);
select id_persona from total_donaciones order by cantidad_total desc limit 1 into max_don;
return max_don;
end$$

delimiter ;

select max_don();

/**
- Triggers

- (1) Realiza un trigger que actualiza total_donaciones con cada una de las inserciones que se realicen en la tabla Persona. **/

delimiter $$

create trigger actualizar_don
after insert on persona
for each row
begin
if new.id_persona not in (select id_persona from total_donaciones) then 
    insert into total_donaciones(id_persona, cantidad_total)
    values(new.id_persona, 1);
else 
    update total_donaciones
    set cantidad_total = cantidad_total + 1
    where id_persona=new.id_persona;
end if;
end; $$

delimiter ;
/**
- (2) Realiza un trigger que elimine todos los registros en la tabla persona cuando se elimine un registro de la tabla total_donaciones. **/
delimiter $$

create trigger eliminar_don
after delete on total_donaciones
for each row
begin
call eliminar_persona(old.id_persona);
end; $$

delimiter ;

/**
Se debe de entregar un fichero .sql siguiendo el siguiente patrón: nombre_alumno_exampen_procedimientos_funciones.sql. **/