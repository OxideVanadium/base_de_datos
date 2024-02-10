    --Proporciona una consulta que muestre solo los clientes de Brasil.
select * from customers where Country='Brazil';
    /**
┌────────────┬───────────┬───────────┬──────────────────────────────────────────────────┬─────────────────────────────────┬─────────────────────┬───────┬─────────┬────────────┬────────────────────┬────────────────────┬───────────────────────────────┬──────────────┐
│ CustomerId │ FirstName │ LastName  │                     Company                      │             Address             │        City         │ State │ Country │ PostalCode │       Phone        │        Fax         │             Email             │ SupportRepId │
├────────────┼───────────┼───────────┼──────────────────────────────────────────────────┼─────────────────────────────────┼─────────────────────┼───────┼─────────┼────────────┼────────────────────┼────────────────────┼───────────────────────────────┼──────────────┤
│ 1          │ Luís      │ Gonçalves │ Embraer - Empresa Brasileira de Aeronáutica S.A. │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP    │ Brazil  │ 12227-000  │ +55 (12) 3923-5555 │ +55 (12) 3923-5566 │ luisg@embraer.com.br          │ 3            │
│ 10         │ Eduardo   │ Martins   │ Woodstock Discos                                 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP    │ Brazil  │ 01007-010  │ +55 (11) 3033-5446 │ +55 (11) 3033-4564 │ eduardo@woodstock.com.br      │ 4            │
│ 11         │ Alexandre │ Rocha     │ Banco do Brasil S.A.                             │ Av. Paulista, 2022              │ São Paulo           │ SP    │ Brazil  │ 01310-200  │ +55 (11) 3055-3278 │ +55 (11) 3055-8131 │ alero@uol.com.br              │ 5            │
│ 12         │ Roberto   │ Almeida   │ Riotur                                           │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ    │ Brazil  │ 20040-020  │ +55 (21) 2271-7000 │ +55 (21) 2271-7070 │ roberto.almeida@riotur.gov.br │ 3            │
│ 13         │ Fernanda  │ Ramos     │                                                  │ Qe 7 Bloco G                    │ Brasília            │ DF    │ Brazil  │ 71020-677  │ +55 (61) 3363-5547 │ +55 (61) 3363-7855 │ fernadaramos4@uol.com.br      │ 4            │
└────────────┴───────────┴───────────┴──────────────────────────────────────────────────┴─────────────────────────────────┴─────────────────────┴───────┴─────────┴────────────┴────────────────────┴────────────────────┴───────────────────────────────┴──────────────┘
**/

    --Proporciona una consulta que muestre las facturas de clientes que son de Brasil. La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura y país de facturación.
select c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry from invoices as i
join customers as c on c.CustomerId=i.CustomerId
where c.Country='Brazil';
    /**
┌───────────┬───────────┬───────────┬─────────────────────┬────────────────┐
│ FirstName │ LastName  │ InvoiceId │     InvoiceDate     │ BillingCountry │
├───────────┼───────────┼───────────┼─────────────────────┼────────────────┤
│ Luís      │ Gonçalves │ 98        │ 2010-03-11 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 121       │ 2010-06-13 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 143       │ 2010-09-15 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 195       │ 2011-05-06 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 316       │ 2012-10-27 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 327       │ 2012-12-07 00:00:00 │ Brazil         │
│ Luís      │ Gonçalves │ 382       │ 2013-08-07 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 25        │ 2009-04-09 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 154       │ 2010-11-14 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 177       │ 2011-02-16 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 199       │ 2011-05-21 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 251       │ 2012-01-09 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 372       │ 2013-07-02 00:00:00 │ Brazil         │
│ Eduardo   │ Martins   │ 383       │ 2013-08-12 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 57        │ 2009-09-06 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 68        │ 2009-10-17 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 123       │ 2010-06-17 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 252       │ 2012-01-22 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 275       │ 2012-04-25 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 297       │ 2012-07-28 00:00:00 │ Brazil         │
│ Alexandre │ Rocha     │ 349       │ 2013-03-18 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 34        │ 2009-05-23 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 155       │ 2010-11-14 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 166       │ 2010-12-25 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 221       │ 2011-08-25 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 350       │ 2013-03-31 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 373       │ 2013-07-03 00:00:00 │ Brazil         │
│ Roberto   │ Almeida   │ 395       │ 2013-10-05 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 35        │ 2009-06-05 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 58        │ 2009-09-07 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 80        │ 2009-12-10 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 132       │ 2010-07-31 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 253       │ 2012-01-22 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 264       │ 2012-03-03 00:00:00 │ Brazil         │
│ Fernanda  │ Ramos     │ 319       │ 2012-11-01 00:00:00 │ Brazil         │
└───────────┴───────────┴───────────┴─────────────────────┴────────────────┘
**/

    --Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.
select * from employees 
where Title='Sales Manager';
/**
┌────────────┬──────────┬───────────┬───────────────┬───────────┬─────────────────────┬─────────────────────┬──────────────┬─────────┬───────┬─────────┬────────────┬───────────────────┬───────────────────┬───────────────────────┐
│ EmployeeId │ LastName │ FirstName │     Title     │ ReportsTo │      BirthDate      │      HireDate       │   Address    │  City   │ State │ Country │ PostalCode │       Phone       │        Fax        │         Email         │
├────────────┼──────────┼───────────┼───────────────┼───────────┼─────────────────────┼─────────────────────┼──────────────┼─────────┼───────┼─────────┼────────────┼───────────────────┼───────────────────┼───────────────────────┤
│ 2          │ Edwards  │ Nancy     │ Sales Manager │ 1         │ 1958-12-08 00:00:00 │ 2002-05-01 00:00:00 │ 825 8 Ave SW │ Calgary │ AB    │ Canada  │ T2P 2T3    │ +1 (403) 262-3443 │ +1 (403) 262-3322 │ nancy@chinookcorp.com │
└────────────┴──────────┴───────────┴───────────────┴───────────┴─────────────────────┴─────────────────────┴──────────────┴─────────┴───────┴─────────┴────────────┴───────────────────┴───────────────────┴───────────────────────┘
**/

    --Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.
select distinct(BillingCountry) from invoices;
/**
┌────────────────┐
│ BillingCountry │
├────────────────┤
│ Germany        │
│ Norway         │
│ Belgium        │
│ Canada         │
│ USA            │
│ France         │
│ Ireland        │
│ United Kingdom │
│ Australia      │
│ Chile          │
│ India          │
│ Brazil         │
│ Portugal       │
│ Netherlands    │
│ Spain          │
│ Sweden         │
│ Czech Republic │
│ Finland        │
│ Denmark        │
│ Italy          │
│ Poland         │
│ Austria        │
│ Hungary        │
│ Argentina      │
└────────────────┘
**/

    --Proporciona una consulta que muestre las facturas de clientes que son de Brasil.
select i.* from invoices as i 
join customers as c on c.CustomerId=i.CustomerId
where c.Country='Brazil';
/**
┌───────────┬────────────┬─────────────────────┬─────────────────────────────────┬─────────────────────┬──────────────┬────────────────┬───────────────────┬───────┐
│ InvoiceId │ CustomerId │     InvoiceDate     │         BillingAddress          │     BillingCity     │ BillingState │ BillingCountry │ BillingPostalCode │ Total │
├───────────┼────────────┼─────────────────────┼─────────────────────────────────┼─────────────────────┼──────────────┼────────────────┼───────────────────┼───────┤
│ 98        │ 1          │ 2010-03-11 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.98  │
│ 121       │ 1          │ 2010-06-13 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 3.96  │
│ 143       │ 1          │ 2010-09-15 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 5.94  │
│ 195       │ 1          │ 2011-05-06 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 0.99  │
│ 316       │ 1          │ 2012-10-27 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 1.98  │
│ 327       │ 1          │ 2012-12-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 13.86 │
│ 382       │ 1          │ 2013-08-07 00:00:00 │ Av. Brigadeiro Faria Lima, 2170 │ São José dos Campos │ SP           │ Brazil         │ 12227-000         │ 8.91  │
│ 25        │ 10         │ 2009-04-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 8.91  │
│ 154       │ 10         │ 2010-11-14 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ 177       │ 10         │ 2011-02-16 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 3.96  │
│ 199       │ 10         │ 2011-05-21 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 5.94  │
│ 251       │ 10         │ 2012-01-09 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 0.99  │
│ 372       │ 10         │ 2013-07-02 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 1.98  │
│ 383       │ 10         │ 2013-08-12 00:00:00 │ Rua Dr. Falcão Filho, 155       │ São Paulo           │ SP           │ Brazil         │ 01007-010         │ 13.86 │
│ 57        │ 11         │ 2009-09-06 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ 68        │ 11         │ 2009-10-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 13.86 │
│ 123       │ 11         │ 2010-06-17 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 8.91  │
│ 252       │ 11         │ 2012-01-22 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 1.98  │
│ 275       │ 11         │ 2012-04-25 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 3.96  │
│ 297       │ 11         │ 2012-07-28 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 5.94  │
│ 349       │ 11         │ 2013-03-18 00:00:00 │ Av. Paulista, 2022              │ São Paulo           │ SP           │ Brazil         │ 01310-200         │ 0.99  │
│ 34        │ 12         │ 2009-05-23 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 0.99  │
│ 155       │ 12         │ 2010-11-14 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ 166       │ 12         │ 2010-12-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 13.86 │
│ 221       │ 12         │ 2011-08-25 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 8.91  │
│ 350       │ 12         │ 2013-03-31 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 1.98  │
│ 373       │ 12         │ 2013-07-03 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 3.96  │
│ 395       │ 12         │ 2013-10-05 00:00:00 │ Praça Pio X, 119                │ Rio de Janeiro      │ RJ           │ Brazil         │ 20040-020         │ 5.94  │
│ 35        │ 13         │ 2009-06-05 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ 58        │ 13         │ 2009-09-07 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 3.96  │
│ 80        │ 13         │ 2009-12-10 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 5.94  │
│ 132       │ 13         │ 2010-07-31 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 0.99  │
│ 253       │ 13         │ 2012-01-22 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 1.98  │
│ 264       │ 13         │ 2012-03-03 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 13.86 │
│ 319       │ 13         │ 2012-11-01 00:00:00 │ Qe 7 Bloco G                    │ Brasília            │ DF           │ Brazil         │ 71020-677         │ 8.91  │
└───────────┴────────────┴─────────────────────┴─────────────────────────────────┴─────────────────────┴──────────────┴────────────────┴───────────────────┴───────┘
**/
    --Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.
select i.*, e.LastName, e.FirstName from invoices as i 
join customers as c, employees as e on i.CustomerId=c.CustomerId and c.SupportRepId=e.EmployeeId
where e.Title='Sales Manager';
/**
sqlite> select i.*, e.LastName, e.FirstName from invoices as i 
join customers as c, employees as e on i.CustomerId=c.CustomerId and c.SupportRepId=e.EmployeeId
where e.Title='Sales Manager';
sqlite> 
**/
    --Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.
select i.Total, c.LastName, c.FirstName, e.FirstName, c.Country from invoices as i 
join customers as c, employees as e on i.CustomerId=c.CustomerId and c.SupportRepId=e.EmployeeId
where e.Title='Sales Manager';
/**
select i.Total, c.LastName, c.FirstName, e.FirstName, c.Country from invoices as i 
join customers as c, employees as e on i.CustomerId=c.CustomerId and c.SupportRepId=e.EmployeeId
where e.Title='Sales Manager';
**/

    --¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?
select count(*) as numero, sum(Total) as Total, substr(InvoiceDate, 0, 5) as year from invoices
group by year
having year regexp '^2009|2011';
/**
┌────────┬────────┬──────┐
│ numero │ Total  │ year │
├────────┼────────┼──────┤
│ 83     │ 449.46 │ 2009 │
│ 83     │ 469.58 │ 2011 │
└────────┴────────┴──────┘
**/

    --Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para el ID de factura 37.
select count(*) as num_items, InvoiceId from invoice_items
group by InvoiceId
having InvoiceId=37;
/**
┌───────────┬───────────┐
│ num_items │ InvoiceId │
├───────────┼───────────┤
│ 4         │ 37        │
└───────────┴───────────┘
**/

    --Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para cada Factura. PISTA: GROUP BY
select count(*) as num_items, InvoiceId from invoice_items
group by InvoiceId
limit 15;
/**
┌───────────┬───────────┐
│ num_items │ InvoiceId │
├───────────┼───────────┤
│ 2         │ 1         │
│ 4         │ 2         │
│ 6         │ 3         │
│ 9         │ 4         │
│ 14        │ 5         │
│ 1         │ 6         │
│ 2         │ 7         │
│ 2         │ 8         │
│ 4         │ 9         │
│ 6         │ 10        │
│ 9         │ 11        │
│ 14        │ 12        │
│ 1         │ 13        │
│ 2         │ 14        │
│ 2         │ 15        │
└───────────┴───────────┘
**/

    --Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.
select t.Name, ii.InvoiceLineId from tracks as t 
join invoice_items as ii on ii.TrackId=t.TrackId limit 15;
/**
┌─────────────────────────────────────────┬───────────────┐
│                  Name                   │ InvoiceLineId │
├─────────────────────────────────────────┼───────────────┤
│ For Those About To Rock (We Salute You) │ 579           │
│ Balls to the Wall                       │ 1             │
│ Balls to the Wall                       │ 1154          │
│ Fast As a Shark                         │ 1728          │
│ Restless and Wild                       │ 2             │
│ Princess of the Dawn                    │ 580           │
│ Put The Finger On You                   │ 3             │
│ Inject The Venom                        │ 4             │
│ Inject The Venom                        │ 1155          │
│ Snowballed                              │ 581           │
│ Snowballed                              │ 1729          │
│ Evil Walks                              │ 5             │
│ Breaking The Rules                      │ 6             │
│ Night Of The Long Knives                │ 582           │
│ Spellbound                              │ 1156          │
└─────────────────────────────────────────┴───────────────┘
**/
    --Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista con cada ítem de línea de factura.
select t.Name as nombre_pista, a.Name as nombre_artista, ii.InvoiceLineId from tracks as t, artists as a 
join invoice_items as ii, albums as al on ii.TrackId=t.TrackId and t.AlbumId=al.AlbumId and al.ArtistId=a.ArtistId
limit 15;
/**
┌─────────────────────────────────────────┬────────────────┬───────────────┐
│              nombre_pista               │ nombre_artista │ InvoiceLineId │
├─────────────────────────────────────────┼────────────────┼───────────────┤
│ For Those About To Rock (We Salute You) │ AC/DC          │ 579           │
│ Balls to the Wall                       │ Accept         │ 1             │
│ Balls to the Wall                       │ Accept         │ 1154          │
│ Fast As a Shark                         │ Accept         │ 1728          │
│ Restless and Wild                       │ Accept         │ 2             │
│ Princess of the Dawn                    │ Accept         │ 580           │
│ Put The Finger On You                   │ AC/DC          │ 3             │
│ Inject The Venom                        │ AC/DC          │ 4             │
│ Inject The Venom                        │ AC/DC          │ 1155          │
│ Snowballed                              │ AC/DC          │ 581           │
│ Snowballed                              │ AC/DC          │ 1729          │
│ Evil Walks                              │ AC/DC          │ 5             │
│ Breaking The Rules                      │ AC/DC          │ 6             │
│ Night Of The Long Knives                │ AC/DC          │ 582           │
│ Spellbound                              │ AC/DC          │ 1156          │
└─────────────────────────────────────────┴────────────────┴───────────────┘
**/

    --Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.
select count(pt.TrackId) as pistas, p.Name as playlist from playlist_track as pt
join playlists as p on p.PlaylistId=pt.PlaylistId 
group by TrackId limit 15;
/**
┌────────┬──────────┐
│ pistas │ playlist │
├────────┼──────────┤
│ 3      │ Music    │
│ 3      │ Music    │
│ 4      │ Music    │
│ 4      │ Music    │
│ 4      │ Music    │
│ 2      │ Music    │
│ 2      │ Music    │
│ 2      │ Music    │
│ 2      │ Music    │
│ 2      │ Music    │
│ 2      │ Music    │
│ 2      │ Music    │
│ 2      │ Music    │
│ 2      │ Music    │
│ 2      │ Music    │
└────────┴──────────┘
**/

    --Proporciona una consulta que muestre todas las pistas, pero no muestre IDs. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.
select t.Name, t.AlbumId, t.MediaTypeId, t.GenreId, t.Composer, t.Milliseconds, t.Bytes, t.UnitPrice, al.Title, mt.Name, g.Name from tracks as t 
join genres as g, albums as al, media_types as mt on g.GenreId=t.GenreId and t.AlbumId=al.AlbumId
and mt.MediaTypeId=t.MediaTypeId limit 15;
/**
┌─────────────────────────────────────────┬─────────┬─────────────┬─────────┬────────────────────────────────────────────────────────────────────────┬──────────────┬──────────┬───────────┬───────────────────────────────────────┬──────────────────────────┬──────┐
│                  Name                   │ AlbumId │ MediaTypeId │ GenreId │                                Composer                                │ Milliseconds │  Bytes   │ UnitPrice │                 Title                 │           Name           │ Name │
├─────────────────────────────────────────┼─────────┼─────────────┼─────────┼────────────────────────────────────────────────────────────────────────┼──────────────┼──────────┼───────────┼───────────────────────────────────────┼──────────────────────────┼──────┤
│ For Those About To Rock (We Salute You) │ 1       │ 1           │ 1       │ Angus Young, Malcolm Young, Brian Johnson                              │ 343719       │ 11170334 │ 0.99      │ For Those About To Rock We Salute You │ MPEG audio file          │ Rock │
│ Balls to the Wall                       │ 2       │ 2           │ 1       │                                                                        │ 342562       │ 5510424  │ 0.99      │ Balls to the Wall                     │ Protected AAC audio file │ Rock │
│ Fast As a Shark                         │ 3       │ 2           │ 1       │ F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman                    │ 230619       │ 3990994  │ 0.99      │ Restless and Wild                     │ Protected AAC audio file │ Rock │
│ Restless and Wild                       │ 3       │ 2           │ 1       │ F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider & W. Hoffman │ 252051       │ 4331779  │ 0.99      │ Restless and Wild                     │ Protected AAC audio file │ Rock │
│ Princess of the Dawn                    │ 3       │ 2           │ 1       │ Deaffy & R.A. Smith-Diesel                                             │ 375418       │ 6290521  │ 0.99      │ Restless and Wild                     │ Protected AAC audio file │ Rock │
│ Put The Finger On You                   │ 1       │ 1           │ 1       │ Angus Young, Malcolm Young, Brian Johnson                              │ 205662       │ 6713451  │ 0.99      │ For Those About To Rock We Salute You │ MPEG audio file          │ Rock │
│ Let's Get It Up                         │ 1       │ 1           │ 1       │ Angus Young, Malcolm Young, Brian Johnson                              │ 233926       │ 7636561  │ 0.99      │ For Those About To Rock We Salute You │ MPEG audio file          │ Rock │
│ Inject The Venom                        │ 1       │ 1           │ 1       │ Angus Young, Malcolm Young, Brian Johnson                              │ 210834       │ 6852860  │ 0.99      │ For Those About To Rock We Salute You │ MPEG audio file          │ Rock │
│ Snowballed                              │ 1       │ 1           │ 1       │ Angus Young, Malcolm Young, Brian Johnson                              │ 203102       │ 6599424  │ 0.99      │ For Those About To Rock We Salute You │ MPEG audio file          │ Rock │
│ Evil Walks                              │ 1       │ 1           │ 1       │ Angus Young, Malcolm Young, Brian Johnson                              │ 263497       │ 8611245  │ 0.99      │ For Those About To Rock We Salute You │ MPEG audio file          │ Rock │
│ C.O.D.                                  │ 1       │ 1           │ 1       │ Angus Young, Malcolm Young, Brian Johnson                              │ 199836       │ 6566314  │ 0.99      │ For Those About To Rock We Salute You │ MPEG audio file          │ Rock │
│ Breaking The Rules                      │ 1       │ 1           │ 1       │ Angus Young, Malcolm Young, Brian Johnson                              │ 263288       │ 8596840  │ 0.99      │ For Those About To Rock We Salute You │ MPEG audio file          │ Rock │
│ Night Of The Long Knives                │ 1       │ 1           │ 1       │ Angus Young, Malcolm Young, Brian Johnson                              │ 205688       │ 6706347  │ 0.99      │ For Those About To Rock We Salute You │ MPEG audio file          │ Rock │
│ Spellbound                              │ 1       │ 1           │ 1       │ Angus Young, Malcolm Young, Brian Johnson                              │ 270863       │ 8817038  │ 0.99      │ For Those About To Rock We Salute You │ MPEG audio file          │ Rock │
│ Go Down                                 │ 4       │ 1           │ 1       │ AC/DC                                                                  │ 331180       │ 10847611 │ 0.99      │ Let There Be Rock                     │ MPEG audio file          │ Rock │
└──────────────────────────────────
**/

    --Proporciona una consulta que muestre todas las facturas.

select * from invoices
limit 15;
/**
┌───────────┬────────────┬─────────────────────┬───────────────────────────┬───────────────┬──────────────┬────────────────┬───────────────────┬───────┐
│ InvoiceId │ CustomerId │     InvoiceDate     │      BillingAddress       │  BillingCity  │ BillingState │ BillingCountry │ BillingPostalCode │ Total │
├───────────┼────────────┼─────────────────────┼───────────────────────────┼───────────────┼──────────────┼────────────────┼───────────────────┼───────┤
│ 1         │ 2          │ 2009-01-01 00:00:00 │ Theodor-Heuss-Straße 34   │ Stuttgart     │              │ Germany        │ 70174             │ 1.98  │
│ 2         │ 4          │ 2009-01-02 00:00:00 │ Ullevålsveien 14          │ Oslo          │              │ Norway         │ 0171              │ 3.96  │
│ 3         │ 8          │ 2009-01-03 00:00:00 │ Grétrystraat 63           │ Brussels      │              │ Belgium        │ 1000              │ 5.94  │
│ 4         │ 14         │ 2009-01-06 00:00:00 │ 8210 111 ST NW            │ Edmonton      │ AB           │ Canada         │ T6G 2C7           │ 8.91  │
│ 5         │ 23         │ 2009-01-11 00:00:00 │ 69 Salem Street           │ Boston        │ MA           │ USA            │ 2113              │ 13.86 │
│ 6         │ 37         │ 2009-01-19 00:00:00 │ Berger Straße 10          │ Frankfurt     │              │ Germany        │ 60316             │ 0.99  │
│ 7         │ 38         │ 2009-02-01 00:00:00 │ Barbarossastraße 19       │ Berlin        │              │ Germany        │ 10779             │ 1.98  │
│ 8         │ 40         │ 2009-02-01 00:00:00 │ 8, Rue Hanovre            │ Paris         │              │ France         │ 75002             │ 1.98  │
│ 9         │ 42         │ 2009-02-02 00:00:00 │ 9, Place Louis Barthou    │ Bordeaux      │              │ France         │ 33000             │ 3.96  │
│ 10        │ 46         │ 2009-02-03 00:00:00 │ 3 Chatham Street          │ Dublin        │ Dublin       │ Ireland        │                   │ 5.94  │
│ 11        │ 52         │ 2009-02-06 00:00:00 │ 202 Hoxton Street         │ London        │              │ United Kingdom │ N1 5LH            │ 8.91  │
│ 12        │ 2          │ 2009-02-11 00:00:00 │ Theodor-Heuss-Straße 34   │ Stuttgart     │              │ Germany        │ 70174             │ 13.86 │
│ 13        │ 16         │ 2009-02-19 00:00:00 │ 1600 Amphitheatre Parkway │ Mountain View │ CA           │ USA            │ 94043-1351        │ 0.99  │
│ 14        │ 17         │ 2009-03-04 00:00:00 │ 1 Microsoft Way           │ Redmond       │ WA           │ USA            │ 98052-8300        │ 1.98  │
│ 15        │ 19         │ 2009-03-04 00:00:00 │ 1 Infinite Loop           │ Cupertino     │ CA           │ USA            │ 95014             │ 1.98  │
└───────────┴────────────┴─────────────────────┴───────────────────────────┴───────────────┴──────────────┴────────────────┴───────────────────┴───────┘
**/
    --Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.
select count(i.InvoiceId) as total from invoices as i 
join customers as c, employees as e on i.CustomerId=c.CustomerId and c.SupportRepId=e.EmployeeId
where e.Title='Sales Manager';
/**
┌───────┐
│ total │
├───────┤
│ 0     │
└───────┘
**/

    --¿Qué agente de ventas realizó más ventas en 2009?
select count(i.InvoiceId) as total, e.EmployeeId from invoices as i 
join customers as c, employees as e on i.CustomerId=c.CustomerId and c.SupportRepId=e.EmployeeId
where e.Title='Sales Manager'
group by e.EmployeeId
having i.InvoiceDate regexp '^2009'
order by total desc;
/**
sqlite> select count(i.InvoiceId) as total, e.EmployeeId from invoices as i 
   ...> join customers as c, employees as e on i.CustomerId=c.CustomerId and c.SupportRepId=e.EmployeeId
   ...> where e.Title='Sales Manager'
   ...> group by e.EmployeeId
   ...> having i.InvoiceDate regexp '^2009'
   ...> order by total desc;
sqlite> 
**/

    --Escribir una consulta que muestre todas las playlists de la base de datos.
select * from playlists
limit 15;
/**
┌────────────┬────────────────────────────┐
│ PlaylistId │            Name            │
├────────────┼────────────────────────────┤
│ 1          │ Music                      │
│ 2          │ Movies                     │
│ 3          │ TV Shows                   │
│ 4          │ Audiobooks                 │
│ 5          │ 90’s Music                 │
│ 6          │ Audiobooks                 │
│ 7          │ Movies                     │
│ 8          │ Music                      │
│ 9          │ Music Videos               │
│ 10         │ TV Shows                   │
│ 11         │ Brazilian Music            │
│ 12         │ Classical                  │
│ 13         │ Classical 101 - Deep Cuts  │
│ 14         │ Classical 101 - Next Steps │
│ 15         │ Classical 101 - The Basics │
└────────────┴────────────────────────────┘
**/
    --Escribe una consulta que liste todas las canciones de una playlist. 
select t.Name as cancion, p.Name as playlist from tracks as t 
join playlist_track as pl, playlists as p on t.TrackId=pl.TrackId and p.PlaylistId=pl.PlaylistId
limit 15;
/**
┌─────────────────────────────────────────┬─────────────────────┐
│                 cancion                 │      playlist       │
├─────────────────────────────────────────┼─────────────────────┤
│ For Those About To Rock (We Salute You) │ Music               │
│ For Those About To Rock (We Salute You) │ Music               │
│ For Those About To Rock (We Salute You) │ Heavy Metal Classic │
│ Balls to the Wall                       │ Music               │
│ Balls to the Wall                       │ Music               │
│ Balls to the Wall                       │ Heavy Metal Classic │
│ Fast As a Shark                         │ Music               │
│ Fast As a Shark                         │ 90’s Music          │
│ Fast As a Shark                         │ Music               │
│ Fast As a Shark                         │ Heavy Metal Classic │
│ Restless and Wild                       │ Music               │
│ Restless and Wild                       │ 90’s Music          │
│ Restless and Wild                       │ Music               │
│ Restless and Wild                       │ Heavy Metal Classic │
│ Princess of the Dawn                    │ Music               │
└─────────────────────────────────────────┴─────────────────────┘
**/
    --Escribe una consulta que liste exclusivamente el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.

select t.Name as cancion, g.Name as genero, mt.Name as tipo_medio from tracks as t 
join albums as al, genres as g, media_types as mt, playlist_track as pt on t.AlbumId=al.AlbumId and g.GenreId=t.GenreId
and mt.MediaTypeId=t.MediaTypeId and t.TrackId=pt.TrackId
where PlaylistId=16;
/**
┌─────────────────────────┬─────────────┬──────────────────────────┐
│         cancion         │   genero    │        tipo_medio        │
├─────────────────────────┼─────────────┼──────────────────────────┤
│ Man In The Box          │ Rock        │ MPEG audio file          │
│ Smells Like Teen Spirit │ Rock        │ MPEG audio file          │
│ In Bloom                │ Rock        │ MPEG audio file          │
│ Come As You Are         │ Rock        │ MPEG audio file          │
│ Lithium                 │ Rock        │ MPEG audio file          │
│ Drain You               │ Rock        │ MPEG audio file          │
│ On A Plain              │ Rock        │ MPEG audio file          │
│ Evenflow                │ Rock        │ MPEG audio file          │
│ Alive                   │ Rock        │ MPEG audio file          │
│ Jeremy                  │ Rock        │ MPEG audio file          │
│ Daughter                │ Rock        │ MPEG audio file          │
│ Outshined               │ Rock        │ MPEG audio file          │
│ Black Hole Sun          │ Rock        │ MPEG audio file          │
│ Plush                   │ Rock        │ MPEG audio file          │
│ Hunger Strike           │ Alternative │ Protected AAC audio file │
└─────────────────────────┴─────────────┴──────────────────────────┘

**/

