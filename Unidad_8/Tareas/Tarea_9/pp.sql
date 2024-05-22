/**Trabajo con la BBDD Alumnos

Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas:

Tabla alumnos:
id (entero sin signo)
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
email (cadena de caracteres)
**/
create database alumnos;
use alumnos;
create table alumno(
    id int auto_increment primary key,
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50),
    email varchar(100)
);

/**

Escribe una función llamado crear_email que dados los parámetros de entrada: nombre, apellido1, apellido2 y dominio, cree una dirección de email y la devuelva como salida.

Función: crear_email
Entrada:
nombre (cadena de caracteres)
apellido1 (cadena de caracteres)
apellido2 (cadena de caracteres)
dominio (cadena de caracteres)
Salida:
email (cadena de caracteres)

El email devuelve una dirección de correo electrónico con el siguiente formato:

El primer carácter del parámetro nombre.
Los tres primeros caracteres del parámetro apellido1.
Los tres primeros caracteres del parámetro apellido2.
El carácter @.
El dominio pasado como parámetro.
La dirección de email debe estar en minúsculas.
**/
delimiter $$

create function crear_email(nombre varchar(50), apellido1 varchar(50), apellido2 varchar(50), dominio varchar(50)) returns varchar(150) DETERMINISTIC
begin
declare email varchar(150);
set email = eliminar_acentos(lower(concat(SUBSTRING(nombre, 1, 1), SUBSTRING(apellido1, 1, 3), SUBSTRING(apellido2, 1, 3), "@", dominio)));
return email;
end $$

delimiter ;

select crear_email('phhh', 'popkk', 'sfje<hfk', 'jsnjhuwjahsuihal');
/**
+--------------------------------------------------------------+
| crear_email('phhh', 'popkk', 'sfje<hfk', 'jsnjhuwjahsuihal') |
+--------------------------------------------------------------+
| ppopsfj@jsnjhuwjahsuihal                                     |
+--------------------------------------------------------------+


También crea una función llamada eliminar_acentos que reciba una cadena de caracteres y devuelva la misma cadena sin acentos. La función tendrá que reemplazar todas las vocales que tengan acento por la misma vocal pero sin acento. Por ejemplo, si la función recibe como parámetro de entrada la cadena María la función debe devolver la cadena Maria.

Función: eliminar_acentos
Entrada:
cadena (cadena de caracteres)
Salida:
(cadena de caracteres)

La función crear_email deberá hacer uso de la función eliminar_acentos. **/
delimiter $$

create function eliminar_acentos(cadena varchar(150)) returns varchar(150) DETERMINISTIC
begin 
declare n_cadena varchar(150);
set n_cadena = replace(cadena, 'á', 'a');
set n_cadena = replace(n_cadena, 'é', 'e');
set n_cadena = replace(n_cadena, 'ú', 'u');
set n_cadena = replace(n_cadena, 'í', 'i');
set n_cadena = replace(n_cadena, 'ó', 'o');
return n_cadena;
end$$

delimiter ;

select eliminar_acentos('áskjolfñó');
/**
+----------------------------------+
| eliminar_acentos('áskjolfñó')    |
+----------------------------------+
| askjolfño                        |
+----------------------------------+


Una vez creada la tabla escriba un trigger con las siguientes características:

Trigger:
trigger_crear_email_before_insert. Se ejecuta sobre la tabla alumnos. Se ejecuta antes de una operación de inserción.
Si el nuevo valor del email que se quiere insertar es NULL, entonces se le creará automáticamente una dirección de email y se insertará en la tabla. 
Si el nuevo valor del email no es NULL se guardará en la tabla el valor del email.


Nota: Para crear la nueva dirección de email se deberá hacer uso del procedimiento crear_email.

Verificación:
Realiza inserciones en la tabla y verifica el correcto funcionamiento de las funciones y triggers.
Realiza un procedimiento que realice la inserción de un número de elementos que se pasa como parámetro. Incluye la máxima aleatoridad posible. **/

delimiter $$

create trigger trigger_crear_email_before_insert
before insert on alumno
for each row
if new.email is NULL then
    set new.email=crear_email(new.nombre, new.apellido1, new.apellido2, 'dominio.com');
end if;
end; $$

delimiter ;

delimiter $$

create procedure insert_student(in iter int, in n_name varchar(50),in n_apellido1 varchar(50), in n_apellido2 varchar(50))
begin
declare n_iter int default 0;

while n_iter < iter do
    set n_iter = n_iter +1;
    insert into alumno(nombre, apellido1, apellido2)
    values(concat(n_name, SUBSTRING(UUID(), floor(RAND() * 32))), concat(n_apellido1, SUBSTRING(UUID(), floor(RAND() * 32))), concat(n_apellido2, SUBSTRING(UUID(), floor(RAND() * 32))));
end while;
end$$

delimiter ;

call insert_student(10, 'nnnaame', 'ssurrrname', 'anothersurname');
/**

+----+---------------------------------------------+-------------------------------------+---------------------------------------------------+---------------------+
| id | nombre                                      | apellido1                           | apellido2                                         | email               |
+----+---------------------------------------------+-------------------------------------+---------------------------------------------------+---------------------+
|  1 | nnnaamef0ee5a-1869-11ef-a449-080027d9a3b3   | ssurrrname080027d9a3b3              | anothersurname-a449-080027d9a3b3                  | nssuano@dominio.com |
|  2 | nnnaame9-080027d9a3b3                       | ssurrrname80027d9a3b3               | anothersurname027d9a3b3                           | nssuano@dominio.com |
|  3 | nnnaame4af4ca97-1869-11ef-a449-080027d9a3b3 | ssurrrname1ef-a449-080027d9a3b3     | anothersurname9-11ef-a449-080027d9a3b3            | nssuano@dominio.com |
|  4 | nnnaameef-a449-080027d9a3b3                 | ssurrrname-11ef-a449-080027d9a3b3   | anothersurnamea449-080027d9a3b3                   | nssuano@dominio.com |
|  5 | nnnaame0027d9a3b3                           | ssurrrname69-11ef-a449-080027d9a3b3 | anothersurname869-11ef-a449-080027d9a3b3          | nssuano@dominio.com |
|  6 | nnnaamef-a449-080027d9a3b3                  | ssurrrname080027d9a3b3              | anothersurnamea-1869-11ef-a449-080027d9a3b3       | nssuano@dominio.com |
|  7 | nnnaame27d9a3b3                             | ssurrrname0027d9a3b3                | anothersurnamef-a449-080027d9a3b3                 | nssuano@dominio.com |
|  8 | nnnaame1-1869-11ef-a449-080027d9a3b3        | ssurrrname-a449-080027d9a3b3        | anothersurnameb61-1869-11ef-a449-080027d9a3b3     | nssuano@dominio.com |
|  9 | nnnaame6-1869-11ef-a449-080027d9a3b3        | ssurrrnamea449-080027d9a3b3         | anothersurname9-11ef-a449-080027d9a3b3            | nssuano@dominio.com |
| 10 | nnnaame5-1869-11ef-a449-080027d9a3b3        | ssurrrnamed9a3b3                    | anothersurnameaf8a71d-1869-11ef-a449-080027d9a3b3 | nssuano@dominio.com |
+----+---------------------------------------------+-------------------------------------+---------------------------------------------------+---------------------+