# Procedimientos
```sql
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
```

# Funciones
```sql
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
```

# Cursores

```sql
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
```

# Trigers

```sql
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
```

# MySQL funciones

FLOOR(RAND() * (max - min + 1)) + min
SUBSTRING_INDEX(UUID(), '-', -1)
date_add(DATE, interval DAY/MONTH/YEAR)
datediff(DATE, DATE) -> days

