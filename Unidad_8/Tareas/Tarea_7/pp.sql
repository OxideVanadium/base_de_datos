/**
Una de las preguntas más comunes que se hacen las personas cuando empiezan su vida laboral, suele ser qué es el salario base. 
Y es que es normal que la gente ande un poco confundida ya que, si no tienes conocimientos en este campo, es fácil hacerse un lío con términos como:

Salario base.
Base reguladora.
Salario bruto.
Salario neto.
Etc.

Teniendo en cuenta esta información se pide:

Crea una base datos llamada salario.
Crear BBDD en MySql.

Crea una tabla llamada persona con los siguientes campos:
Identificador. (Texto)(PK).
Nombre (Texto).
Salario_base. (Escoge el tipo de dato).
Subsidio(Escoge el tipo de dato).
Salud(Escoge el tipo de dato).
Pensión(Escoge el tipo de dato).
Bono(Escoge el tipo de dato).
Integral(Escoge el tipo de dato). **/
create database salario;
use salario;

create table persona(
    id varchar(15) not null primary key,
    nombre varchar(100),
    salario_base decimal(10, 5),
    subsidiio decimal(2, 2),
    salud decimal(2, 2),
    pension decimal(2, 2),
    bono decimal(2, 2),
    integral decimal(2, 2)
);

/**

Creación de un procedimiento de forma aleatoria con las siguientes características:
Parámetro de entrada el número de registros (Mínimo 10, y realiza la prueba varias veces). **/
delimiter $$

create procedure test_data(in iterations int, in r_name varchar(100), in salario_base decimal(10, 5), in factor decimal(2,2))
begin
declare n_iter int default 0; 
declare n_id varchar(15);

while n_iter < iterations do
    set n_iter = n_iter + 1;
    insert into persona(id, nombre, salario_base)
    values(SUBSTRING_INDEX(UUID(), '-', -1);, concat(r_name, SUBSTRING(UUID(), floor((rand() * 32)) )), salario_base * (factor + rand() * (1 - factor)));
    call update_person(n_id);
end while;
end $$

delimiter ;

call test_data(10, 'persona', 2000, 0.7);

/**
Cree una función para cada punto teniendo en cuenta que:
Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico. Actualiza el valor en la tabla. **/
delimiter $$

create function subsidio_transporte(salario_base decimal(10, 5)) returns decimal(10, 5) DETERMINISTIC
begin
declare subsidio decimal(10, 5);
set subsidio = salario_base * 0.07;
return subsidio;
end $$

delimiter ;

/**
Función salud: La salud que corresponde al 4% al salario básico. Actualiza el valor en la tabla. **/
delimiter $$

create function salud(salario_base decimal(10, 5)) returns decimal(10, 5) DETERMINISTIC
begin
declare result decimal(10, 5);
set result = salario_base * 0.04;
return result;
end $$

delimiter ;

/**
Función pension: La pensión que corresponde al 4% al salario básico. Actualiza el valor en la tabla. **/
delimiter $$

create function pension(salario_base decimal(10, 5)) returns decimal(10, 5) DETERMINISTIC
begin
declare result decimal(10, 5);
set result = salario_base * 0.04;
return result;
end $$

delimiter ;
/**
Función bono: Un bono que corresponde al 8% al salario básico. Actualiza el valor en la tabla. **/
delimiter $$

create function bono(salario_base decimal(10, 5)) returns decimal(10, 5) DETERMINISTIC
begin
declare result decimal(10, 5);
set result = salario_base * 0.08;
return result;
end $$

delimiter ;

/**
Función integral: El salario integral es la suma del salario básico - salud - pension + bono + sub de transporte. Actualiza el valor en la tabla. **/
delimiter $$

create function integral(salario_base decimal(10, 5), salud decimal(2, 2), bono decimal(2, 2), subsidio decimal(2, 2)) returns decimal(10, 5) DETERMINISTIC
begin
declare result decimal(10, 5);
set result = salario_base - salud - pension + bono + subsidio;
return result;
end $$

delimiter ;

/**
Crea cada uno de las funciones anteriores para una persona en específico.
El parámetro de entrada debe de ser un identificar de la persona.
**/
delimiter $$

create procedure update_person(in c_id varchar(15))
begin
update persona 
set subsidiio=subsidio_transporte(salario_base),
salud=salud(salario_base),
bono=bono(salario_base),
integral=integral(salario_base, salud, bono, subsidiio)
where id=c_id;
end $$

delimiter ;
