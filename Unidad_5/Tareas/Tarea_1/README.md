create table Ejemplo (
   ...> id integer not null primary key autoincrement,
   ...> texto text,
   ...> entero integer,
   ...> decimal real,
   ...> fecha date,
   ...> booleano boolean);

insert into ejemplo ( texto, entero, decimal, fecha, booleano)
   ...> values ('Ejemplo1', 25, 10.5, '2022-05-15', 0);
