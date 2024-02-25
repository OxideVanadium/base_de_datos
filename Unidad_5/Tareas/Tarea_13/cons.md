## Consultas multitabla (Join)

* Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
```sql
select apellido1, apellido2, nombre from persona
where tipo='alumno'
order by apellido1, apellido2, nombre;
┌───────────┬───────────┬──────────┐
│ apellido1 │ apellido2 │  nombre  │
├───────────┼───────────┼──────────┤
│ Domínguez │ Guerrero  │ Antonio  │
│ Gea       │ Ruiz      │ Sonia    │
│ Gutiérrez │ López     │ Juan     │
│ Heller    │ Pagac     │ Pedro    │
│ Herman    │ Pacocha   │ Daniel   │
│ Hernández │ Martínez  │ Irene    │
│ Herzog    │ Tremblay  │ Ramón    │
│ Koss      │ Bayer     │ José     │
│ Lakin     │ Yundt     │ Inma     │
│ Saez      │ Vega      │ Juan     │
│ Strosin   │ Turcotte  │ Ismael   │
│ Sánchez   │ Pérez     │ Salvador │
└───────────┴───────────┴──────────┘
```

* Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
```sql
select nombre, apellido1, apellido2 from persona
where telefono is null and tipo='alumno';
┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Pedro  │ Heller    │ Pagac     │
│ Ismael │ Strosin   │ Turcotte  │
└────────┴───────────┴───────────┘
```

* Devuelve el listado de los alumnos que nacieron en 1999.
```sql
select * from persona
where fecha_nacimiento regexp '^1999'
and tipo='alumno';
┌────┬───────────┬─────────┬───────────┬───────────┬─────────┬─────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre  │ apellido1 │ apellido2 │ ciudad  │    direccion    │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼─────────┼───────────┼───────────┼─────────┼─────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 7  │ 97258166K │ Ismael  │ Strosin   │ Turcotte  │ Almería │ C/ Neptuno      │           │ 1999/05/24       │ H    │ alumno │
│ 22 │ 41491230N │ Antonio │ Domínguez │ Guerrero  │ Almería │ C/ Cabo de Gata │ 626652498 │ 1999/02/11       │ H    │ alumno │
└────┴───────────┴─────────┴───────────┴───────────┴─────────┴─────────────────┴───────────┴──────────────────┴──────┴────────┘
```

* Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
```sql
select * from persona
where tipo='profesor' and telefono is null and nif regexp 'K$';
┌────┬───────────┬───────────┬───────────┬───────────┬─────────┬───────────────────────────┬──────────┬──────────────────┬──────┬──────────┐
│ id │    nif    │  nombre   │ apellido1 │ apellido2 │ ciudad  │         direccion         │ telefono │ fecha_nacimiento │ sexo │   tipo   │
├────┼───────────┼───────────┼───────────┼───────────┼─────────┼───────────────────────────┼──────────┼──────────────────┼──────┼──────────┤
│ 16 │ 10485008K │ Antonio   │ Fahey     │ Considine │ Almería │ C/ Sierra de los Filabres │          │ 1982/03/18       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker   │ Upton     │ Almería │ C/ Sierra de Gádor        │          │ 1973/05/05       │ H    │ profesor │
└────┴───────────┴───────────┴───────────┴───────────┴─────────┴───────────────────────────┴──────────┴──────────────────┴──────┴──────────┘
```

* Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
```sql
select * from asignatura
where cuatrimestre=1 and curso=3 and id_grado=7;
┌────┬───────────────────────────────────────────┬──────────┬─────────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                  nombre                   │ creditos │    tipo     │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼───────────────────────────────────────────┼──────────┼─────────────┼───────┼──────────────┼─────────────┼──────────┤
│ 72 │ Bases moleculares del desarrollo vegetal  │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 73 │ Fisiología animal                         │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 74 │ Metabolismo y biosíntesis de biomoléculas │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 75 │ Operaciones de separación                 │ 6.0      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 76 │ Patología molecular de plantas            │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
│ 77 │ Técnicas instrumentales básicas           │ 4.5      │ obligatoria │ 3     │ 1            │             │ 7        │
└────┴───────────────────────────────────────────┴──────────┴─────────────┴───────┴──────────────┴─────────────┴──────────┘
```

## Consultas multitabla (Join)

* Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
```sql
select distinct p.* from persona as p
join alumno_se_matricula_asignatura as am, grado as g, asignatura as a
on am.id_alumno=p.id and am.id_asignatura=a.id and a.id_grado=g.id
where p.tipo='alumno' and p.sexo='M' and g.nombre='Grado en Ingeniería Informática (Plan 2015)';
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬────────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion      │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼────────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴────────────────────┴───────────┴──────────────────┴──────┴────────┘
```

* Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
```sql
select a.* from asignatura as a
join grado as g on a.id_grado=g.id
where g.nombre='Grado en Ingeniería Informática (Plan 2015)'
limit 10;
┌────┬─────────────────────────────────────────┬──────────┬────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                 nombre                  │ creditos │  tipo  │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼─────────────────────────────────────────┼──────────┼────────┼───────┼──────────────┼─────────────┼──────────┤
│ 1  │ Álgegra lineal y matemática discreta    │ 6.0      │ básica │ 1     │ 1            │ 3           │ 4        │
│ 2  │ Cálculo                                 │ 6.0      │ básica │ 1     │ 1            │ 14          │ 4        │
│ 3  │ Física para informática                 │ 6.0      │ básica │ 1     │ 1            │ 3           │ 4        │
│ 4  │ Introducción a la programación          │ 6.0      │ básica │ 1     │ 1            │ 14          │ 4        │
│ 5  │ Organización y gestión de empresas      │ 6.0      │ básica │ 1     │ 1            │ 3           │ 4        │
│ 6  │ Estadística                             │ 6.0      │ básica │ 1     │ 2            │ 14          │ 4        │
│ 7  │ Estructura y tecnología de computadores │ 6.0      │ básica │ 1     │ 2            │ 3           │ 4        │
│ 8  │ Fundamentos de electrónica              │ 6.0      │ básica │ 1     │ 2            │ 14          │ 4        │
│ 9  │ Lógica y algorítmica                    │ 6.0      │ básica │ 1     │ 2            │ 3           │ 4        │
│ 10 │ Metodología de la programación          │ 6.0      │ básica │ 1     │ 2            │ 14          │ 4        │
└────┴─────────────────────────────────────────┴──────────┴────────┴───────┴──────────────┴─────────────┴──────────┘
```

* Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
```sql
select p.apellido1, p.apellido2, p.nombre, d.nombre from persona as p
join profesor as pr, departamento as d on p.id=pr.id_profesor and pr.id_departamento=d.id
order by p.apellido1, p.apellido2, p.nombre;
┌────────────┬────────────┬───────────┬────────────────────┐
│ apellido1  │ apellido2  │  nombre   │       nombre       │
├────────────┼────────────┼───────────┼────────────────────┤
│ Fahey      │ Considine  │ Antonio   │ Economía y Empresa │
│ Hamill     │ Kozey      │ Manolo    │ Informática        │
│ Kohler     │ Schoen     │ Alejandro │ Matemáticas        │
│ Lemke      │ Rutherford │ Cristina  │ Economía y Empresa │
│ Monahan    │ Murray     │ Micaela   │ Agronomía          │
│ Ramirez    │ Gea        │ Zoe       │ Informática        │
│ Ruecker    │ Upton      │ Guillermo │ Educación          │
│ Schmidt    │ Fisher     │ David     │ Matemáticas        │
│ Schowalter │ Muller     │ Francesca │ Química y Física   │
│ Spencer    │ Lakin      │ Esther    │ Educación          │
│ Stiedemann │ Morissette │ Alfredo   │ Química y Física   │
│ Streich    │ Hirthe     │ Carmen    │ Educación          │
└────────────┴────────────┴───────────┴────────────────────┘
```

* Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
```sql
select a.nombre, ce.anyo_inicio, ce.anyo_fin from asignatura as a
join curso_escolar as ce, persona as p, alumno_se_matricula_asignatura as am
on a.curso=ce.id and am.id_alumno=p.id and am.id_asignatura=a.id
where p.tipo='alumno' and p.nif='26902806M';
┌──────────────────────────────────────┬─────────────┬──────────┐
│                nombre                │ anyo_inicio │ anyo_fin │
├──────────────────────────────────────┼─────────────┼──────────┤
│ Álgegra lineal y matemática discreta │ 2014        │ 2015     │
│ Cálculo                              │ 2014        │ 2015     │
│ Física para informática              │ 2014        │ 2015     │
└──────────────────────────────────────┴─────────────┴──────────┘
```

* Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
```sql
select distinct(d.nombre) from departamento as d
join profesor as pr, asignatura as a, grado as g
on d.id=pr.id_departamento and pr.id_profesor=a.id_profesor and a.id_grado=g.id
where g.nombre='Grado en Ingeniería Informática (Plan 2015)';
┌─────────────┐
│   nombre    │
├─────────────┤
│ Informática │
└─────────────┘
```

* Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
```sql
select distinct p.*from persona as p
join alumno_se_matricula_asignatura as am, curso_escolar as ce
on p.id=am.id_alumno and am.id_curso_escolar=ce.id
where anyo_inicio regexp ('^2018|2019');
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬────────────────────┬───────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion      │ telefono  │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼────────────────────┼───────────┼──────────────────┼──────┼────────┤
│ 24 │ 85135690V │ Sonia  │ Gea       │ Ruiz      │ Almería │ C/ Mercurio        │ 678812017 │ 1995/04/13       │ M    │ alumno │
│ 23 │ 64753215G │ Irene  │ Hernández │ Martínez  │ Almería │ C/ Zapillo         │ 628452384 │ 1996/03/12       │ M    │ alumno │
│ 19 │ 11578526G │ Inma   │ Lakin     │ Yundt     │ Almería │ C/ Picos de Europa │ 678652431 │ 1998/09/01       │ M    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴────────────────────┴───────────┴──────────────────┴──────┴────────┘
```

## Consultas multitabla (Where)

* Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
```sql
select d.nombre, p.apellido1, p.apellido2, p.nombre from departamento as d, persona as p, profesor as pr
where p.id=pr.id_profesor and pr.id_departamento=d.id
and p.tipo='profesor';
┌────────────────────┬────────────┬────────────┬───────────┐
│       nombre       │ apellido1  │ apellido2  │  nombre   │
├────────────────────┼────────────┼────────────┼───────────┤
│ Informática        │ Ramirez    │ Gea        │ Zoe       │
│ Matemáticas        │ Schmidt    │ Fisher     │ David     │
│ Economía y Empresa │ Lemke      │ Rutherford │ Cristina  │
│ Educación          │ Spencer    │ Lakin      │ Esther    │
│ Educación          │ Streich    │ Hirthe     │ Carmen    │
│ Química y Física   │ Stiedemann │ Morissette │ Alfredo   │
│ Informática        │ Hamill     │ Kozey      │ Manolo    │
│ Matemáticas        │ Kohler     │ Schoen     │ Alejandro │
│ Economía y Empresa │ Fahey      │ Considine  │ Antonio   │
│ Educación          │ Ruecker    │ Upton      │ Guillermo │
│ Agronomía          │ Monahan    │ Murray     │ Micaela   │
│ Química y Física   │ Schowalter │ Muller     │ Francesca │
└────────────────────┴────────────┴────────────┴───────────┘
```

* Devuelve un listado con los profesores que no están asociados a un departamento.
```sql
select p.* from persona as p, profesor as pr
where p.id=pr.id_profesor and pr.id_departamento is null;
sqlite> 
```

* Devuelve un listado con los departamentos que no tienen profesores asociados.
```sql
select d.* from departamento as d, profesor as p
where d.id=p.id_departamento and p.id_profesor is null;
sqlite> 
```

* Devuelve un listado con los profesores que no imparten ninguna asignatura.
```sql

```

* Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql
select * from asignatura 
where id_profesor is null 
limit 10;
┌────┬────────────────────────────────────────────────────────────────────────┬──────────┬──────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                                 nombre                                 │ creditos │   tipo   │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼────────────────────────────────────────────────────────────────────────┼──────────┼──────────┼───────┼──────────────┼─────────────┼──────────┤
│ 22 │ Ingeniería de Requisitos                                               │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
│ 23 │ Integración de las Tecnologías de la Información en las Organizaciones │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
│ 24 │ Modelado y Diseño del Software 1                                       │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
│ 25 │ Multiprocesadores                                                      │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
│ 26 │ Seguridad y cumplimiento normativo                                     │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
│ 27 │ Sistema de Información para las Organizaciones                         │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
│ 28 │ Tecnologías web                                                        │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
│ 29 │ Teoría de códigos y criptografía                                       │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
│ 30 │ Administración de bases de datos                                       │ 6.0      │ optativa │ 3     │ 2            │             │ 4        │
│ 31 │ Herramientas y Métodos de Ingeniería del Software                      │ 6.0      │ optativa │ 3     │ 2            │             │ 4        │
└────┴────────────────────────────────────────────────────────────────────────┴──────────┴──────────┴───────┴──────────────┴─────────────┴──────────┘
```

* Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
```sql
select d.nombre, a.nombre from departamento as d, asignatura as a, profesor as p
where d.id=p.id_departamento and p.id_profesor=a.id_profesor and a.curso is null;
sqlite>
```

## Consultas resúmen (Funciones)

* Devuelve el número total de alumnas que hay.
```sql
select count(*) as numero from persona
where tipo='alumno';
┌────────┐
│ numero │
├────────┤
│ 12     │
└────────┘
```

* Calcula cuántos alumnos nacieron en 1999.
```sql
select count(*) as numero from persona
where tipo='alumno' and fecha_nacimiento regexp '^1999';
┌────────┐
│ numero │
├────────┤
│ 2      │
└────────┘
```

* Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
```sql
select d.nombre, count(p.id_profesor) as numero from departamento as d
join profesor as p on d.id=p.id_departamento
group by p.id_departamento
order by numero desc;
┌────────────────────┬────────┐
│       nombre       │ numero │
├────────────────────┼────────┤
│ Educación          │ 3      │
│ Química y Física   │ 2      │
│ Economía y Empresa │ 2      │
│ Matemáticas        │ 2      │
│ Informática        │ 2      │
│ Agronomía          │ 1      │
└────────────────────┴────────┘
```

* Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
```sql
select d.nombre, ifnull(count(p.id_profesor), 0) as numero from departamento as d
join profesor as p on d.id=p.id_departamento
group by p.id_departamento
order by numero desc;
┌────────────────────┬────────┐
│       nombre       │ numero │
├────────────────────┼────────┤
│ Educación          │ 3      │
│ Química y Física   │ 2      │
│ Economía y Empresa │ 2      │
│ Matemáticas        │ 2      │
│ Informática        │ 2      │
│ Agronomía          │ 1      │
└────────────────────┴────────┘
```

* Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
```sql
select g.nombre, count(a.id) as asignaturas from asignatura as a
right join grado as g on a.id_grado=g.id
group by g.id
order by asignaturas desc;
┌────────────────────────────────────────────────────────┬─────────────┐
│                         nombre                         │ asignaturas │
├────────────────────────────────────────────────────────┼─────────────┤
│ Grado en Ingeniería Informática (Plan 2015)            │ 51          │
│ Grado en Biotecnología (Plan 2015)                     │ 32          │
│ Grado en Química (Plan 2009)                           │ 0           │
│ Grado en Matemáticas (Plan 2010)                       │ 0           │
│ Grado en Ciencias Ambientales (Plan 2009)              │ 0           │
│ Grado en Ingeniería Química Industrial (Plan 2010)     │ 0           │
│ Grado en Ingeniería Mecánica (Plan 2010)               │ 0           │
│ Grado en Ingeniería Electrónica Industrial (Plan 2010) │ 0           │
│ Grado en Ingeniería Eléctrica (Plan 2014)              │ 0           │
│ Grado en Ingeniería Agrícola (Plan 2015)               │ 0           │
└────────────────────────────────────────────────────────┴─────────────┘
```

* Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
```sql
select g.nombre, count(a.id) as asignaturas from asignatura as a
right join grado as g on a.id_grado=g.id
group by g.id
having asignaturas>40
order by asignaturas desc;

┌─────────────────────────────────────────────┬─────────────┐
│                   nombre                    │ asignaturas │
├─────────────────────────────────────────────┼─────────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ 51          │
└─────────────────────────────────────────────┴─────────────┘
```

* Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
```sql
select g.nombre, a.tipo, sum(a.creditos) as creditos from grado as g
join asignatura as a on g.id=a.id_grado
group by a.tipo 
order by creditos desc;
┌─────────────────────────────────────────────┬─────────────┬──────────┐
│                   nombre                    │    tipo     │ creditos │
├─────────────────────────────────────────────┼─────────────┼──────────┤
│ Grado en Ingeniería Informática (Plan 2015) │ optativa    │ 180.0    │
│ Grado en Ingeniería Informática (Plan 2015) │ obligatoria │ 174.0    │
│ Grado en Ingeniería Informática (Plan 2015) │ básica      │ 132.0    │
└─────────────────────────────────────────────┴─────────────┴──────────┘
```

* Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
```sql
select ce.anyo_inicio, count(am.id_alumno) as numero from curso_escolar as ce
join alumno_se_matricula_asignatura as am 
on ce.id=am.id_curso_escolar
group by id_curso_escolar, id_asignatura
having id_asignatura=1;
┌─────────────┬────────┐
│ anyo_inicio │ numero │
├─────────────┼────────┤
│ 2014        │ 3      │
│ 2018        │ 3      │
└─────────────┴────────┘
```

* Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
```sql
select a.id, a.nombre, p.apellido1, p.apellido2, count(a.id) as num_asig from asignatura as a
join persona as p on p.id=a.id_profesor
group by a.id_profesor
order by num_asig desc;
┌────┬──────────────────────────────────────┬───────────┬───────────┬──────────┐
│ id │                nombre                │ apellido1 │ apellido2 │ num_asig │
├────┼──────────────────────────────────────┼───────────┼───────────┼──────────┤
│ 2  │ Cálculo                              │ Hamill    │ Kozey     │ 11       │
│ 1  │ Álgegra lineal y matemática discreta │ Ramirez   │ Gea       │ 10       │
└────┴──────────────────────────────────────┴───────────┴───────────┴──────────┘
```

## Subconsultas

* Devuelve todos los datos del alumno más joven.
```sql
select * from persona
where tipo='alumno' and id=(
    select id from persona
    order by fecha_nacimiento desc
    limit 1
);
┌────┬───────────┬────────┬───────────┬───────────┬─────────┬───────────────────┬──────────┬──────────────────┬──────┬────────┐
│ id │    nif    │ nombre │ apellido1 │ apellido2 │ ciudad  │     direccion     │ telefono │ fecha_nacimiento │ sexo │  tipo  │
├────┼───────────┼────────┼───────────┼───────────┼─────────┼───────────────────┼──────────┼──────────────────┼──────┼────────┤
│ 4  │ 17105885A │ Pedro  │ Heller    │ Pagac     │ Almería │ C/ Estrella fugaz │          │ 2000/10/05       │ H    │ alumno │
└────┴───────────┴────────┴───────────┴───────────┴─────────┴───────────────────┴──────────┴──────────────────┴──────┴────────┘
```

* Devuelve un listado con los profesores que no están asociados a un departamento.
```sql
select * from persona 
where tipo='profesor' and id in(
    select id_profesor from profesor
    where id_departamento is null
);
sqlite> 
```

* Devuelve un listado con los departamentos que no tienen profesores asociados.
```sql
select * from departamento
where id in(
    select id_departamento from profesor
    where id_profesor is null
    );
sqlite> 
```

* Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
```sql
select * from persona 
where not exists(
    select distinct id_profesor from asignatura
    where persona.id=asignatura.id_profesor)
and id in(
    select id_profesor from profesor
);
┌────┬───────────┬───────────┬────────────┬────────────┬─────────┬───────────────────────────┬───────────┬──────────────────┬──────┬──────────┐
│ id │    nif    │  nombre   │ apellido1  │ apellido2  │ ciudad  │         direccion         │ telefono  │ fecha_nacimiento │ sexo │   tipo   │
├────┼───────────┼───────────┼────────────┼────────────┼─────────┼───────────────────────────┼───────────┼──────────────────┼──────┼──────────┤
│ 5  │ 38223286T │ David     │ Schmidt    │ Fisher     │ Almería │ C/ Venus                  │ 678516294 │ 1978/01/19       │ H    │ profesor │
│ 8  │ 79503962T │ Cristina  │ Lemke      │ Rutherford │ Almería │ C/ Saturno                │ 669162534 │ 1977/08/21       │ M    │ profesor │
│ 10 │ 61142000L │ Esther    │ Spencer    │ Lakin      │ Almería │ C/ Plutón                 │           │ 1977/05/19       │ M    │ profesor │
│ 12 │ 85366986W │ Carmen    │ Streich    │ Hirthe     │ Almería │ C/ Almanzora              │           │ 1971-04-29       │ M    │ profesor │
│ 13 │ 73571384L │ Alfredo   │ Stiedemann │ Morissette │ Almería │ C/ Guadalquivir           │ 950896725 │ 1980/02/01       │ H    │ profesor │
│ 15 │ 80502866Z │ Alejandro │ Kohler     │ Schoen     │ Almería │ C/ Tajo                   │ 668726354 │ 1980/03/14       │ H    │ profesor │
│ 16 │ 10485008K │ Antonio   │ Fahey      │ Considine  │ Almería │ C/ Sierra de los Filabres │           │ 1982/03/18       │ H    │ profesor │
│ 17 │ 85869555K │ Guillermo │ Ruecker    │ Upton      │ Almería │ C/ Sierra de Gádor        │           │ 1973/05/05       │ H    │ profesor │
│ 18 │ 04326833G │ Micaela   │ Monahan    │ Murray     │ Almería │ C/ Veleta                 │ 662765413 │ 1976/02/25       │ H    │ profesor │
│ 20 │ 79221403L │ Francesca │ Schowalter │ Muller     │ Almería │ C/ Quinto pino            │           │ 1980/10/31       │ H    │ profesor │
└────┴───────────┴───────────┴────────────┴────────────┴─────────┴───────────────────────────┴───────────┴──────────────────┴──────┴──────────┘
```

* Devuelve un listado con las asignaturas que no tienen un profesor asignado.
```sql
select * from asignatura
where id in(
    select id from asignatura
    where id_profesor is null
)
limit 10;
┌────┬──────────────────────────────────────────────────────────────┬──────────┬──────────┬───────┬──────────────┬─────────────┬──────────┐
│ id │                            nombre                            │ creditos │   tipo   │ curso │ cuatrimestre │ id_profesor │ id_grado │
├────┼──────────────────────────────────────────────────────────────┼──────────┼──────────┼───────┼──────────────┼─────────────┼──────────┤
│ 22 │ Ingeniería de Requisitos                                     │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼──────────┼───────┼──────────────┼─────────────┼──────────┤
│ 23 │ Integración de las Tecnologías de la Información en las Orga │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
│    │ nizaciones                                                   │          │          │       │              │             │          │
├────┼──────────────────────────────────────────────────────────────┼──────────┼──────────┼───────┼──────────────┼─────────────┼──────────┤
│ 24 │ Modelado y Diseño del Software 1                             │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼──────────┼───────┼──────────────┼─────────────┼──────────┤
│ 25 │ Multiprocesadores                                            │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼──────────┼───────┼──────────────┼─────────────┼──────────┤
│ 26 │ Seguridad y cumplimiento normativo                           │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼──────────┼───────┼──────────────┼─────────────┼──────────┤
│ 27 │ Sistema de Información para las Organizaciones               │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼──────────┼───────┼──────────────┼─────────────┼──────────┤
│ 28 │ Tecnologías web                                              │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼──────────┼───────┼──────────────┼─────────────┼──────────┤
│ 29 │ Teoría de códigos y criptografía                             │ 6.0      │ optativa │ 3     │ 1            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼──────────┼───────┼──────────────┼─────────────┼──────────┤
│ 30 │ Administración de bases de datos                             │ 6.0      │ optativa │ 3     │ 2            │             │ 4        │
├────┼──────────────────────────────────────────────────────────────┼──────────┼──────────┼───────┼──────────────┼─────────────┼──────────┤
│ 31 │ Herramientas y Métodos de Ingeniería del Software            │ 6.0      │ optativa │ 3     │ 2            │             │ 4        │
└────┴──────────────────────────────────────────────────────────────┴──────────┴──────────┴───────┴──────────────┴─────────────┴──────────┘
```

* Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
```sql
select * from departamento
where exists(
    select id_departamento from profesor
    where profesor.id_departamento=departamento.id
    and id_profesor in(
        select id_profesor from asignatura
        where curso is null
    )
);
sqlite> 
```
