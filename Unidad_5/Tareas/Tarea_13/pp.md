pragma table_info(asignatura);
┌─────┬──────────────┬─────────┬─────────┬────────────┬────┐
│ cid │     name     │  type   │ notnull │ dflt_value │ pk │
├─────┼──────────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ id           │ INTEGER │ 0       │            │ 1  │
│ 1   │ nombre       │ TEXT    │ 1       │            │ 0  │
│ 2   │ creditos     │ REAL    │ 1       │            │ 0  │
│ 3   │ tipo         │ TEXT    │ 1       │            │ 0  │
│ 4   │ curso        │ INTEGER │ 1       │            │ 0  │
│ 5   │ cuatrimestre │ INTEGER │ 1       │            │ 0  │
│ 6   │ id_profesor  │ INTEGER │ 0       │            │ 0  │
│ 7   │ id_grado     │ INTEGER │ 1       │            │ 0  │
└─────┴──────────────┴─────────┴─────────┴────────────┴────┘
pragma tpragma table_info(alumno_se_matricula_asignatura);
┌─────┬──────────────────┬─────────┬─────────┬────────────┬────┐
│ cid │       name       │  type   │ notnull │ dflt_value │ pk │
├─────┼──────────────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ id_alumno        │ INTEGER │ 1       │            │ 1  │
│ 1   │ id_asignatura    │ INTEGER │ 1       │            │ 2  │
│ 2   │ id_curso_escolar │ INTEGER │ 1       │            │ 3  │
└─────┴──────────────────┴─────────┴─────────┴────────────┴────┘
sqlite> pragma table_info(grado);
┌─────┬────────┬─────────┬─────────┬────────────┬────┐
│ cid │  name  │  type   │ notnull │ dflt_value │ pk │
├─────┼────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ id     │ INTEGER │ 0       │            │ 1  │
│ 1   │ nombre │ TEXT    │ 1       │            │ 0  │
└─────┴────────┴─────────┴─────────┴────────────┴────┘
sqlite> pragma table_info(persona);
┌─────┬──────────────────┬─────────┬─────────┬────────────┬────┐
│ cid │       name       │  type   │ notnull │ dflt_value │ pk │
├─────┼──────────────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ id               │ INTEGER │ 0       │            │ 1  │
│ 1   │ nif              │ TEXT    │ 0       │            │ 0  │
│ 2   │ nombre           │ TEXT    │ 1       │            │ 0  │
│ 3   │ apellido1        │ TEXT    │ 1       │            │ 0  │
│ 4   │ apellido2        │ TEXT    │ 0       │            │ 0  │
│ 5   │ ciudad           │ TEXT    │ 1       │            │ 0  │
│ 6   │ direccion        │ TEXT    │ 1       │            │ 0  │
│ 7   │ telefono         │ TEXT    │ 0       │            │ 0  │
│ 8   │ fecha_nacimiento │ DATE    │ 1       │            │ 0  │
│ 9   │ sexo             │ TEXT    │ 1       │            │ 0  │
│ 10  │ tipo             │ TEXT    │ 1       │            │ 0  │
└─────┴──────────────────┴─────────┴─────────┴────────────┴────┘
sqlite> pragma table_info(curso_escolar);
┌─────┬─────────────┬─────────┬─────────┬────────────┬────┐
│ cid │    name     │  type   │ notnull │ dflt_value │ pk │
├─────┼─────────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ id          │ INTEGER │ 0       │            │ 1  │
│ 1   │ anyo_inicio │ INTEGER │ 1       │            │ 0  │
│ 2   │ anyo_fin    │ INTEGER │ 1       │            │ 0  │
└─────┴─────────────┴─────────┴─────────┴────────────┴────┘
pragma tpragma table_info(profesor);
┌─────┬─────────────────┬─────────┬─────────┬────────────┬────┐
│ cid │      name       │  type   │ notnull │ dflt_value │ pk │
├─────┼─────────────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ id_profesor     │ INTEGER │ 0       │            │ 1  │
│ 1   │ id_departamento │ INTEGER │ 1       │            │ 0  │
└─────┴─────────────────┴─────────┴─────────┴────────────┴────┘
sqlite> pragma table_info(departamento);
┌─────┬────────┬─────────┬─────────┬────────────┬────┐
│ cid │  name  │  type   │ notnull │ dflt_value │ pk │
├─────┼────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ id     │ INTEGER │ 0       │            │ 1  │
│ 1   │ nombre │ TEXT    │ 1       │            │ 0  │
└─────┴────────┴─────────┴─────────┴────────────┴────┘