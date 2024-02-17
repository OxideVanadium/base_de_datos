pragma table_info(cliente);
┌─────┬────────────────────────────┬─────────┬─────────┬────────────┬────┐
│ cid │            name            │  type   │ notnull │ dflt_value │ pk │
├─────┼────────────────────────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ codigo_cliente             │ INTEGER │ 0       │            │ 1  │
│ 1   │ nombre_cliente             │ TEXT    │ 1       │            │ 0  │
│ 2   │ nombre_contacto            │ TEXT    │ 0       │            │ 0  │
│ 3   │ apellido_contacto          │ TEXT    │ 0       │            │ 0  │
│ 4   │ telefono                   │ TEXT    │ 1       │            │ 0  │
│ 5   │ fax                        │ TEXT    │ 1       │            │ 0  │
│ 6   │ linea_direccion1           │ TEXT    │ 1       │            │ 0  │
│ 7   │ linea_direccion2           │ TEXT    │ 0       │            │ 0  │
│ 8   │ ciudad                     │ TEXT    │ 1       │            │ 0  │
│ 9   │ region                     │ TEXT    │ 0       │            │ 0  │
│ 10  │ pais                       │ TEXT    │ 0       │            │ 0  │
│ 11  │ codigo_postal              │ TEXT    │ 0       │            │ 0  │
│ 12  │ codigo_empleado_rep_ventas │ INTEGER │ 0       │            │ 0  │
│ 13  │ limite_credito             │ NUMERIC │ 0       │            │ 0  │
└─────┴────────────────────────────┴─────────┴─────────┴────────────┴────┘
sqlite> pragma table_info(empleado);
┌─────┬─────────────────┬─────────┬─────────┬────────────┬────┐
│ cid │      name       │  type   │ notnull │ dflt_value │ pk │
├─────┼─────────────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ codigo_empleado │ INTEGER │ 0       │            │ 1  │
│ 1   │ nombre          │ TEXT    │ 1       │            │ 0  │
│ 2   │ apellido1       │ TEXT    │ 1       │            │ 0  │
│ 3   │ apellido2       │ TEXT    │ 0       │            │ 0  │
│ 4   │ extension       │ TEXT    │ 1       │            │ 0  │
│ 5   │ email           │ TEXT    │ 1       │            │ 0  │
│ 6   │ codigo_oficina  │ TEXT    │ 1       │            │ 0  │
│ 7   │ codigo_jefe     │ INTEGER │ 0       │            │ 0  │
│ 8   │ puesto          │ TEXT    │ 0       │            │ 0  │
└─────┴─────────────────┴─────────┴─────────┴────────────┴────┘
pragma table_info(oficina);
┌─────┬──────────────────┬──────┬─────────┬────────────┬────┐
│ cid │       name       │ type │ notnull │ dflt_value │ pk │
├─────┼──────────────────┼──────┼─────────┼────────────┼────┤
│ 0   │ codigo_oficina   │ TEXT │ 0       │            │ 1  │
│ 1   │ ciudad           │ TEXT │ 1       │            │ 0  │
│ 2   │ pais             │ TEXT │ 1       │            │ 0  │
│ 3   │ region           │ TEXT │ 0       │            │ 0  │
│ 4   │ codigo_postal    │ TEXT │ 1       │            │ 0  │
│ 5   │ telefono         │ TEXT │ 1       │            │ 0  │
│ 6   │ linea_direccion1 │ TEXT │ 1       │            │ 0  │
│ 7   │ linea_direccion2 │ TEXT │ 0       │            │ 0  │
└─────┴──────────────────┴──────┴─────────┴────────────┴────┘
sqlite> pragma table_info(pedido);
┌─────┬────────────────┬─────────┬─────────┬────────────┬────┐
│ cid │      name      │  type   │ notnull │ dflt_value │ pk │
├─────┼────────────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ codigo_pedido  │ INTEGER │ 0       │            │ 1  │
│ 1   │ fecha_pedido   │ TEXT    │ 1       │            │ 0  │
│ 2   │ fecha_esperada │ TEXT    │ 1       │            │ 0  │
│ 3   │ fecha_entrega  │ TEXT    │ 0       │            │ 0  │
│ 4   │ estado         │ TEXT    │ 1       │            │ 0  │
│ 5   │ comentarios    │ TEXT    │ 0       │            │ 0  │
│ 6   │ codigo_cliente │ INTEGER │ 1       │            │ 0  │
└─────┴────────────────┴─────────┴─────────┴────────────┴────┘
sqlite> pragma table_info(detalle_pedido);
┌─────┬─────────────────┬─────────┬─────────┬────────────┬────┐
│ cid │      name       │  type   │ notnull │ dflt_value │ pk │
├─────┼─────────────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ codigo_pedido   │ INTEGER │ 0       │            │ 1  │
│ 1   │ codigo_producto │ TEXT    │ 0       │            │ 2  │
│ 2   │ cantidad        │ INTEGER │ 1       │            │ 0  │
│ 3   │ precio_unidad   │ NUMERIC │ 1       │            │ 0  │
│ 4   │ numero_linea    │ INTEGER │ 1       │            │ 0  │
└─────┴─────────────────┴─────────┴─────────┴────────────┴────┘
sqlite> pragma table_info(gama_producto);
┌─────┬───────────────────┬──────┬─────────┬────────────┬────┐
│ cid │       name        │ type │ notnull │ dflt_value │ pk │
├─────┼───────────────────┼──────┼─────────┼────────────┼────┤
│ 0   │ gama              │ TEXT │ 0       │            │ 1  │
│ 1   │ descripcion_texto │ TEXT │ 0       │            │ 0  │
│ 2   │ descripcion_html  │ TEXT │ 0       │            │ 0  │
│ 3   │ imagen            │ TEXT │ 0       │            │ 0  │
└─────┴───────────────────┴──────┴─────────┴────────────┴────┘
sqlite> pragma table_info(pago);
┌─────┬────────────────┬─────────┬─────────┬────────────┬────┐
│ cid │      name      │  type   │ notnull │ dflt_value │ pk │
├─────┼────────────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ codigo_cliente │ INTEGER │ 0       │            │ 1  │
│ 1   │ forma_pago     │ TEXT    │ 1       │            │ 0  │
│ 2   │ id_transaccion │ TEXT    │ 1       │            │ 2  │
│ 3   │ fecha_pago     │ TEXT    │ 1       │            │ 0  │
│ 4   │ total          │ NUMERIC │ 1       │            │ 0  │
└─────┴────────────────┴─────────┴─────────┴────────────┴────┘
sqlite> pragma table_info(producto);
┌─────┬───────────────────┬─────────┬─────────┬────────────┬────┐
│ cid │       name        │  type   │ notnull │ dflt_value │ pk │
├─────┼───────────────────┼─────────┼─────────┼────────────┼────┤
│ 0   │ codigo_producto   │ TEXT    │ 0       │            │ 1  │
│ 1   │ nombre            │ TEXT    │ 1       │            │ 0  │
│ 2   │ gama              │ TEXT    │ 1       │            │ 0  │
│ 3   │ dimensiones       │ TEXT    │ 0       │            │ 0  │
│ 4   │ proveedor         │ TEXT    │ 0       │            │ 0  │
│ 5   │ descripcion       │ TEXT    │ 0       │            │ 0  │
│ 6   │ cantidad_en_stock │ INTEGER │ 1       │            │ 0  │
│ 7   │ precio_venta      │ NUMERIC │ 1       │            │ 0  │
│ 8   │ precio_proveedor  │ NUMERIC │ 0       │            │ 0  │
└─────┴───────────────────┴─────────┴─────────┴────────────┴────┘
