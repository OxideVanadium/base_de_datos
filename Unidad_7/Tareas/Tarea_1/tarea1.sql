/** 
Un instituto de enseñanza guarda los siguientes datos de sus alumnos:
número de inscripción, comienza desde 1 cada año,
año de inscripción,
nombre del alumno,
documento del alumno,
domicilio,
ciudad,
provincia,
clave primaria: número de inscripto y año de inscripción.
Se pide:
Elimine la tabla "alumno" si existe.
Nota:Muestra el comando y la salida. **/

create database instituto if not exists;
use instituto;

drop table alumno if exists;
create table alumno (
    inscripcion int auto_increment,
    año_insrp int,
    primary key(inscripcion,año_insrp),
    nombre varchar(50),
    documento varchar(10),
    domicilio varchar(150),
    ciudad varchar(50),
    provincia varchar(50)
);
/** 
Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).
Nota:Muestra el comando y la salida.
Define los siguientes indices:
Un índice único por el campo "documento" y un índice común por ciudad y provincia.
Nota:Muestra el comando y la salida. Justifica el tipo de indice en un comentario. **/

/**
Vea los índices de la tabla.
Nota:Muestra el comando y la salida "show index". **/

/** 
Intente ingresar un alumno con clave primaria repetida.
Nota:Muestra el comando y la salida. **/

/** 
Intente ingresar un alumno con documento repetido.
Nota:Muestra el comando y la salida. **/

/**
Ingrese varios alumnos de la misma ciudad y provincia.
Nota:Muestra el comando y la salida. **/

/**
Elimina los indices creados, y muestra que ya no se encuentran.
Nota:Muestra el comando y la salida.

**/