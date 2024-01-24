--Carga el fichero .sql que se adjunta.
.read base-datos-pokemon.sql
.table 
.mode box
-- Actualizar el nivel de Bulbasaur.
update Pokemon 
set nivel=11
where nombre='Bulbasaur';
/**
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 11    ││
└────┴────────────┴─────────┴───────┘
**/

-- Cambiar el tipo de Pikachu a "Eléctrico/Rojo"
insert into tipo (nombre)
values('Electrico/Rojo');

update Pokemon
set id_tipo=6
where nombre='Pikachu';

/**
┌─────────┬─────────┬───────┬────────────────┐
│ nombre  │ id_tipo │ nivel │     tipo       │
├─────────┼─────────┼───────┼────────────────┤
│ Pikachu │ 6       │ 15    │ Electrico/Rojo │
└─────────┴─────────┴───────┴────────────────┘
**/

-- Incrementar el nivel de todos los Pokémon de tipo Agua.
update Pokemon
set nivel=nivel+1
where id_tipo=1;

/**
┌────┬───────────┬─────────┬───────┐
│ id │  nombre   │ id_tipo │ nivel │
├────┼───────────┼─────────┼───────┤
│ 3  │ Squirtle  │ 1       │ 9     │
│ 6  │ Vaporeon  │ 1       │ 26    │
│ 11 │ Gyarados  │ 1       │ 31    │
│ 18 │ Blastoise │ 1       │ 56    │
└────┴───────────┴─────────┴───────┘
**/
-- Eliminar a Jynx de la lista de Pokémon.
/**
sqlite> select count(*) from Pokemon;
┌──────────┐
│ count(*) │
├──────────┤
│ 25       │
└──────────┘
**/
delete from Pokemon
where nombre='Jynx';
/**
sqlite> select count(*) from Pokemon;
┌──────────┐
│ count(*) │
├──────────┤
│ 25       │
└──────────┘
**/
-- Eliminar el tipo "Hielo" de la lista de tipos de Pokémon.
/**
sqlite> select count(*) from Tipo;
┌──────────┐
│ count(*) │
├──────────┤
│ 6        │
└──────────┘ **/
delete from Tipo
where nombre='Hielo';
/**
sqlite> select count(*) from Tipo;
┌──────────┐
│ count(*) │
├──────────┤
│ 6        │
└──────────┘
**/
-- Obtener todos los Pokémon.
select * from Pokemon;
/**
┌────┬────────────┬─────────┬───────┐
│ id │   nombre   │ id_tipo │ nivel │
├────┼────────────┼─────────┼───────┤
│ 1  │ Bulbasaur  │ 3       │ 11    │
│ 2  │ Charmander │ 2       │ 12    │
│ 3  │ Squirtle   │ 1       │ 9     │
│ 4  │ Pikachu    │ 6       │ 15    │
│ 5  │ Geodude    │ 5       │ 11    │
│ 6  │ Vaporeon   │ 1       │ 26    │
│ 7  │ Flareon    │ 2       │ 27    │
│ 8  │ Ivysaur    │ 3       │ 18    │
│ 9  │ Jolteon    │ 4       │ 22    │
│ 10 │ Cubone     │ 5       │ 14    │
│ 11 │ Gyarados   │ 1       │ 31    │
│ 12 │ Arcanine   │ 2       │ 35    │
│ 13 │ Exeggutor  │ 3       │ 40    │
│ 14 │ Raichu     │ 4       │ 38    │
│ 15 │ Sandslash  │ 5       │ 33    │
│ 16 │ Venusaur   │ 3       │ 45    │
│ 17 │ Charizard  │ 2       │ 50    │
│ 18 │ Blastoise  │ 1       │ 56    │
│ 19 │ Electabuzz │ 4       │ 48    │
│ 20 │ Rhydon     │ 5       │ 52    │
│ 21 │ Dragonite  │ 2       │ 60    │
│ 22 │ Flareon    │ 2       │ 65    │
│ 23 │ Venusaur   │ 3       │ 70    │
│ 24 │ Zapdos     │ 4       │ 75    │
│ 25 │ Rhydon     │ 5       │ 80    │
└────┴────────────┴─────────┴───────┘
**/

--Obtener el nombre y nivel de los Pokémon de tipo Fuego.

select nombre, nivel from Pokemon 
where id_tipo=2;
/**
┌────────────┬───────┐
│   nombre   │ nivel │
├────────────┼───────┤
│ Charmander │ 12    │
│ Flareon    │ 27    │
│ Arcanine   │ 35    │
│ Charizard  │ 50    │
│ Dragonite  │ 60    │
│ Flareon    │ 65    │
└────────────┴───────┘
**/

--Obtener el nombre de los Pokémon que tienen un nivel superior a 30.
select nombre from Pokemon 
where nivel>30;
/**
┌────────────┐
│   nombre   │
├────────────┤
│ Gyarados   │
│ Arcanine   │
│ Exeggutor  │
│ Raichu     │
│ Sandslash  │
│ Venusaur   │
│ Charizard  │
│ Blastoise  │
│ Electabuzz │
│ Rhydon     │
│ Dragonite  │
│ Flareon    │
│ Venusaur   │
│ Zapdos     │
│ Rhydon     │
└────────────┘
**/
-- Obtener el nombre de los Pokémon ordenados por nivel de forma descendente.
select nombre from Pokemon 
order by nivel desc;
/**
┌────────────┐
│   nombre   │
├────────────┤
│ Rhydon     │
│ Zapdos     │
│ Venusaur   │
│ Flareon    │
│ Dragonite  │
│ Blastoise  │
│ Rhydon     │
│ Charizard  │
│ Electabuzz │
│ Venusaur   │
│ Exeggutor  │
│ Raichu     │
│ Arcanine   │
│ Sandslash  │
│ Gyarados   │
│ Flareon    │
│ Vaporeon   │
│ Jolteon    │
│ Ivysaur    │
│ Pikachu    │
│ Cubone     │
│ Charmander │
│ Bulbasaur  │
│ Geodude    │
│ Squirtle   │
└────────────┘
**/
--Obtener la cantidad de Pokémon por tipo.
select count(p.nombre) as cantidad, t.nombre 
from Pokemon as p, Tipo as t 
where t.id=p.id_tipo 
group by id_tipo;
/**
┌──────────┬────────────────┐
│ cantidad │     nombre     │
├──────────┼────────────────┤
│ 4        │ Agua           │
│ 6        │ Fuego          │
│ 5        │ Planta         │
│ 4        │ Eléctrico      │
│ 5        │ Tierra         │
│ 1        │ Electrico/Rojo │
└──────────┴────────────────┘
**/
