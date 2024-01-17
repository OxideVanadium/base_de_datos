PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);
INSERT INTO empleados VALUES(1,'Juan',50000.0,'Ventas');
INSERT INTO empleados VALUES(2,'María',60000.0,'TI');
INSERT INTO empleados VALUES(3,'Carlos',55000.0,'Ventas');
INSERT INTO empleados VALUES(4,'Ana',48000.0,'Recursos Humanos');
INSERT INTO empleados VALUES(5,'Pedro',70000.0,'TI');
INSERT INTO empleados VALUES(6,'Laura',52000.0,'Ventas');
INSERT INTO empleados VALUES(7,'Javier',48000.0,'Recursos Humanos');
INSERT INTO empleados VALUES(8,'Carmen',65000.0,'TI');
INSERT INTO empleados VALUES(9,'Miguel',51000.0,'Ventas');
INSERT INTO empleados VALUES(10,'Elena',55000.0,'Recursos Humanos');
INSERT INTO empleados VALUES(11,'Diego',72000.0,'TI');
INSERT INTO empleados VALUES(12,'Sofía',49000.0,'Ventas');
INSERT INTO empleados VALUES(13,'Andrés',60000.0,'Recursos Humanos');
INSERT INTO empleados VALUES(14,'Isabel',53000.0,'TI');
INSERT INTO empleados VALUES(15,'Raúl',68000.0,'Ventas');
INSERT INTO empleados VALUES(16,'Patricia',47000.0,'Recursos Humanos');
INSERT INTO empleados VALUES(17,'Alejandro',71000.0,'TI');
INSERT INTO empleados VALUES(18,'Natalia',54000.0,'Ventas');
INSERT INTO empleados VALUES(19,'Roberto',49000.0,'Recursos Humanos');
INSERT INTO empleados VALUES(20,'Beatriz',63000.0,'TI');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('empleados',20);
COMMIT;
