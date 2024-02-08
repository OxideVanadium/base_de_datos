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
where Country='Brazil';
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
select i.Total, c.LastName, c.FirstName, c.FirstName, c.Country from invoices as i 
join customers as c, employees as e on i.CustomerId=c.CustomerId and c.SupportRepId=e.EmployeeId
where e.Title='Sales Manager';
/**
select i.Total, c.LastName, c.FirstName, c.FirstName, c.Country from invoices as i 
join customers as c, employees as e on i.CustomerId=c.CustomerId and c.SupportRepId=e.EmployeeId
where e.Title='Sales Manager';
**/

    --¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?
select count(*) as total, substr(InvoiceDate, 0, 5) as year from invoices
group by year
having year regexp '^2009|2011';
/**
┌───────┬──────┐
│ total │ year │
├───────┼──────┤
│ 83    │ 2009 │
│ 83    │ 2011 │
└───────┴──────┘
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
PRAGMA foreign_key_list('invoice_items');
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
select t.Name, a.Name, ii.InvoiceLineId from tracks as t 
join invoice_items as ii, albums as al, artists as a 
on ii.TrackId=t.Name and t.AlbumId=al.AlbumId and al.ArtistId=a.ArtistId
limit 15;


    --Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.
select count(pt.TrackId) as pistas, p.Name from playlist_track as pt
join playlists as p on p.PlaylistId=pt.PlaylistId 
group by TrackId limit 15;
/**
┌────────┬───────┐
│ pistas │ Name  │
├────────┼───────┤
│ 3      │ Music │
│ 3      │ Music │
│ 4      │ Music │
│ 4      │ Music │
│ 4      │ Music │
│ 2      │ Music │
│ 2      │ Music │
│ 2      │ Music │
│ 2      │ Music │
│ 2      │ Music │
│ 2      │ Music │
│ 2      │ Music │
│ 2      │ Music │
│ 2      │ Music │
│ 2      │ Music │
└────────┴───────┘
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

    --Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.


    --¿Qué agente de ventas realizó más ventas en 2009?

    --Escribir una consulta que muestre todas las playlists de la base de datos.

    --Escribe una consulta que liste todas las canciones de una playlist. 
select t.Name from tracks as t 
join playlist_track as pl on t.TrackId=pl.TrackId
limit 15;
/**
┌─────────────────────────────────────────┐
│                  Name                   │
├─────────────────────────────────────────┤
│ For Those About To Rock (We Salute You) │
│ For Those About To Rock (We Salute You) │
│ For Those About To Rock (We Salute You) │
│ Balls to the Wall                       │
│ Balls to the Wall                       │
│ Balls to the Wall                       │
│ Fast As a Shark                         │
│ Fast As a Shark                         │
│ Fast As a Shark                         │
│ Fast As a Shark                         │
│ Restless and Wild                       │
│ Restless and Wild                       │
│ Restless and Wild                       │
│ Restless and Wild                       │
│ Princess of the Dawn                    │
└─────────────────────────────────────────┘
**/
    --Escribe una consulta que liste exclusivamente el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.

select t.Name, al.Title, g.Name, mt.Name from tracks as t 
join albums as al, genres as g, media_types as mt, playlist_track as pt on t.AlbumId=al.AlbumId and g.GenreId=t.GenreId
and mt.MediaTypeId=t.MediaTypeId and t.TrackId=pt.TrackId
where PlaylistId='15';
/**
┌────────────────────────────────────────────────────────────────────────────────────────────────────┬───────────────────────────────────────────────────────────────────────────────┬───────────┬──────────────────────────┐
│                                                Name                                                │                                     Title                                     │   Name    │           Name           │
├────────────────────────────────────────────────────────────────────────────────────────────────────┼───────────────────────────────────────────────────────────────────────────────┼───────────┼──────────────────────────┤
│ Intoitus: Adorate Deum                                                                             │ Adorate Deum: Gregorian Chant from the Proper of the Mass                     │ Classical │ Protected AAC audio file │
│ Miserere mei, Deus                                                                                 │ Allegri: Miserere                                                             │ Classical │ Protected AAC audio file │
│ Canon and Gigue in D Major: I. Canon                                                               │ Pachelbel: Canon & Gigue                                                      │ Classical │ Protected AAC audio file │
│ Concerto No. 1 in E Major, RV 269 "Spring": I. Allegro                                             │ Vivaldi: The Four Seasons                                                     │ Classical │ Protected AAC audio file │
│ Concerto for 2 Violins in D Minor, BWV 1043: I. Vivace                                             │ Bach: Violin Concertos                                                        │ Classical │ Protected AAC audio file │
│ Aria Mit 30 Veränderungen, BWV 988 "Goldberg Variations": Aria                                     │ Bach: Goldberg Variations                                                     │ Classical │ Protected AAC audio file │
│ Suite for Solo Cello No. 1 in G Major, BWV 1007: I. Prélude                                        │ Bach: The Cello Suites                                                        │ Classical │ Protected AAC audio file │
│ The Messiah: Behold, I Tell You a Mystery... The Trumpet Shall Sound                               │ Handel: The Messiah (Highlights)                                              │ Classical │ Protected AAC audio file │
│ Solomon HWV 67: The Arrival of the Queen of Sheba                                                  │ The World of Classical Favourites                                             │ Classical │ Protected AAC audio file │
│ "Eine Kleine Nachtmusik" Serenade In G, K. 525: I. Allegro                                         │ Sir Neville Marriner: A Celebration                                           │ Classical │ Protected AAC audio file │
│ Concerto for Clarinet in A Major, K. 622: II. Adagio                                               │ Mozart: Wind Concertos                                                        │ Classical │ Protected AAC audio file │
│ Symphony No. 104 in D Major "London": IV. Finale: Spiritoso                                        │ Haydn: Symphonies 99 - 104                                                    │ Classical │ Purchased AAC audio file │
│ Symphony No.5 in C Minor: I. Allegro con brio                                                      │ Beethoven: Symhonies Nos. 5 & 6                                               │ Classical │ Protected AAC audio file │
│ Ave Maria                                                                                          │ A Soprano Inspired                                                            │ Classical │ Protected AAC audio file │
│ Nabucco: Chorus, "Va, Pensiero, Sull'ali Dorate"                                                   │ Great Opera Choruses                                                          │ Classical │ Protected AAC audio file │
│ Die Walküre: The Ride of the Valkyries                                                             │ Wagner: Favourite Overtures                                                   │ Classical │ Protected AAC audio file │
│ Requiem, Op.48: 4. Pie Jesu                                                                        │ Fauré: Requiem, Ravel: Pavane & Others                                        │ Classical │ Protected AAC audio file │
│ The Nutcracker, Op. 71a, Act II: Scene 14: Pas de deux: Dance of the Prince & the Sugar-Plum Fairy │ Tchaikovsky: The Nutcracker                                                   │ Classical │ Protected AAC audio file │
│ Nimrod (Adagio) from Variations On an Original Theme, Op. 36 "Enigma"                              │ The Last Night of the Proms                                                   │ Classical │ Protected AAC audio file │
│ Madama Butterfly: Un Bel Dì Vedremo                                                                │ Puccini: Madama Butterfly - Highlights                                        │ Classical │ Protected AAC audio file │
│ Jupiter, the Bringer of Jollity                                                                    │ Holst: The Planets, Op. 32 & Vaughan Williams: Fantasies                      │ Classical │ Protected AAC audio file │
│ Turandot, Act III, Nessun dorma!                                                                   │ Pavarotti's Opera Made Easy                                                   │ Classical │ Protected AAC audio file │
│ Adagio for Strings from the String Quartet, Op. 11                                                 │ Great Performances - Barber's Adagio and Other Romantic Favorites for Strings │ Classical │ Protected AAC audio file │
│ Carmina Burana: O Fortuna                                                                          │ Carmina Burana                                                                │ Classical │ Protected AAC audio file │
│ Fanfare for the Common Man                                                                         │ A Copland Celebration, Vol. I                                                 │ Classical │ Protected AAC audio file │
└────────────────────────────────────────────────────────────────────────────────────────────────────┴───────────────────────────────────────────────────────────────────────────────┴───────────┴──────────────────────────┘
**/

