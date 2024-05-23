/**Trabajo con la BBDD Alumnos

Modifica el ejercicio anterior y añade un nuevo trigger que las siguientes características: Trigger: trigger_guardar_email_after_update:

Se ejecuta sobre la tabla alumnos.
Se ejecuta después de una operación de actualización.
Cada vez que un alumno modifique su dirección de email se deberá insertar un nuevo registro en una tabla llamada log_cambios_email.
La tabla log_cambios_email contiene los siguientes campos:
id: clave primaria (entero autonumérico)
id_alumno: id del alumno (entero)
fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
old_email: valor anterior del email (cadena de caracteres)
new_email: nuevo valor con el que se ha actualizado **/
create table log_cambios_email(
    id int auto_increment primary key,
    id_alumno int,
    fecha_hora date,
    old_email varchar(150),
    new_email varchar(150)
);

delimiter $$

create trigger trigger_guardar_email_after_update
after update on alumno
for each row
begin
    insert into log_cambios_email(id_alumno, fecha_hora, old_email, new_email)
    values(old.id, current_timestamp(), old.email, new.email);
end; $$

delimiter ;

update alumno
set email="pp@dominio.es"
where id=10;
/**
+----+-----------+------------+---------------------+---------------+
| id | id_alumno | fecha_hora | old_email           | new_email     |
+----+-----------+------------+---------------------+---------------+
|  1 |        10 | 2024-05-23 | nssuano@dominio.com | pp@dominio.es |
+----+-----------+------------+---------------------+---------------+


Añade un nuevo trigger que tenga las siguientes características:

Trigger: trigger_guardar_alumnos_eliminados:
Se ejecuta sobre la tabla alumnos.
Se ejecuta después de una operación de borrado.
Cada vez que se elimine un alumno de la tabla alumnos se deberá insertar un nuevo registro en una tabla llamada log_alumnos_eliminados.
La tabla log_alumnos_eliminados contiene los siguientes campos:
id: clave primaria (entero autonumérico)
id_alumno: id del alumno (entero)
fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
nombre: nombre del alumno eliminado (cadena de caracteres)
apellido1: primer apellido del alumno eliminado (cadena de caracteres)
apellido2: segundo apellido del alumno eliminado (cadena de caracteres)
email: email del alumno eliminado (cadena de caracteres). **/
create table log_alumnos_eliminados(
    id int auto_increment primary key,
    id_alumno int,
    fecha_hora date, 
    nombre varchar(50),
    apellido1 varchar(50),
    apellido2 varchar(50),
    email varchar(150)
);

delimiter $$

create trigger trigger_guardar_alumnos_eliminados
after delete on alumno
for each row
begin
    insert into log_alumnos_eliminados(id_alumno, fecha_hora, nombre, apellido1, apellido2, email)
    values(old.id, current_timestamp(), old.nombre, old.apellido1, old.apellido2, old.email);
end; $$

delimiter ;

delete from alumno
where id=1;

/**
+----+-----------+------------+----------------------------+--------------------------------------+---------------------------------------------------+---------------------+
| id | id_alumno | fecha_hora | nombre                     | apellido1                            | apellido2                                         | email               |
+----+-----------+------------+----------------------------+--------------------------------------+---------------------------------------------------+---------------------+
|  1 |         1 | 2024-05-23 | nnnaamef-9fa6-04d9f5096915 | ssurrrname8e3-11ef-9fa6-04d9f5096915 | anothersurname6b0b1df-18e3-11ef-9fa6-04d9f5096915 | nssuano@dominio.com |
+----+-----------+------------+----------------------------+--------------------------------------+---------------------------------------------------+---------------------+