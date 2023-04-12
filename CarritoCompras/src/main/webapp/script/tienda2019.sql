---------------------------------------
-- Base de datos : tienda2019
-- Autor : Jose Garcia La Riva
---------------------------------------
use tienda2019;

-- Tabla : Categorias
DROP TABLE IF EXISTS Categorias;
CREATE TABLE Categorias(
    IdCategoria CHAR(6) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    Imagen VARCHAR(50) NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY (IdCategoria),
    CHECK(Estado IN ('0','1'))
);

-- Insertar filas en la tabla Categorias
INSERT INTO Categorias VALUES('CAT001','Televisor','televisor.jpg','1');
INSERT INTO Categorias VALUES('CAT002','Refrigerador','refrigerador.jpg','1');
INSERT INTO Categorias VALUES('CAT003','Equipo de Sonido','equipo.jpg','1');
INSERT INTO Categorias VALUES('CAT004','Lavadoras','lavadora.jpg','1');
INSERT INTO Categorias VALUES('CAT005','Blue-Ray','blueray.jpg','1');
INSERT INTO Categorias VALUES('CAT006','Notebook','notebook.jpg','1');

-- Tabla : Productos
DROP TABLE IF EXISTS Productos;
CREATE TABLE Productos(
    IdProducto CHAR(8) NOT NULL,
    IdCategoria CHAR(6) NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
    PrecioUnidad DECIMAL NOT NULL,
    Stock INT NOT NULL,
    Imagen VARCHAR(50) NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdProducto),
    FOREIGN KEY(IdCategoria) REFERENCES Categorias(IdCategoria),
    CHECK(PrecioUnidad > 0),
    CHECK(Stock > 0),
    CHECK(Estado IN ('0','1'))
);

-- Insertar filas en la tabla Productos
INSERT INTO Productos VALUES('PRO00001','CAT001','Televisor SONY',
1250,10,'sony01.jpg','1');
INSERT INTO Productos VALUES('PRO00002','CAT001','Televisor LG',
1200,10,'lg01.jpg','1');
INSERT INTO Productos VALUES('PRO00003','CAT001','Televisor SAMSUNG',
1150,10,'samsung01.jpg','1');
INSERT INTO Productos VALUES('PRO00004','CAT001','Televisor AOC',
1110,10,'aoc01.jpg','1');

INSERT INTO Productos VALUES('PRO00005','CAT002','Refrigerador LG',
1500,10,'refri01.jpg','1');
INSERT INTO Productos VALUES('PRO00006','CAT002','Refrigerador G&E',
1600,10,'refri02.jpg','1');
INSERT INTO Productos VALUES('PRO00007','CAT002','Refrigerador FAEDA',
1250,10,'refri03.jpg','1');
INSERT INTO Productos VALUES('PRO00008','CAT002','Refrigerador COLDEX',
1350,10,'refri04.jpg','1');

INSERT INTO Productos VALUES('PRO00009','CAT003','Equipo SONY',
900,10,'equipo01.jpg','1');
INSERT INTO Productos VALUES('PRO00010','CAT003','Equipo LG',
850,10,'equipo02.jpg','1');
INSERT INTO Productos VALUES('PRO00011','CAT003','Equipo Panasonic',
800,10,'equipo03.jpg','1');
INSERT INTO Productos VALUES('PRO00012','CAT003','Equipo Phillips',
750,10,'equipo04.jpg','1');

-- Tabla : Clientes
DROP TABLE IF EXISTS Clientes;
CREATE TABLE Clientes(
    IdCliente CHAR(8) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Nombres VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Correo VARCHAR(50) NOT NULL,
    Password VARCHAR(50) NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdCliente),
    CHECK(Sexo IN ('M','F')),
    CHECK(Estado IN ('0','1'))
);

INSERT INTO Clientes VALUES('CLI00001','RIVERA RIOS','JUAN CARLOS',
'AV.LIMA 1234-CERCADO','1990-05-01','M','jrivera@gmail.com','1234','1');
INSERT INTO Clientes VALUES('CLI00002','TORRES DURAN','CLAUDIA',
'AV.PRIMAVERA 1234-SURCO','1991-07-11','F','ctorres@gmail.com','1234','1');
INSERT INTO Clientes VALUES('CLI00003','VILLAR RAMOS','WALTER ISMAEL',
'AV.ARENALES 1525-LINCE','1989-12-01','M','wvillar@gmail.com','1234','1');

SELECT * FROM Clientes;

-- Tabla : Ventas
DROP TABLE IF EXISTS Ventas;
CREATE TABLE Ventas(
    IdVenta CHAR(10) NOT NULL,
    IdCliente CHAR(8) NOT NULL,
    FechaVenta DATE NOT NULL,
    MontoTotal DECIMAL NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdCliente,IdVenta),
    CHECK(MontoTotal > 0),

    CHECK(Estado IN ('0','1'))
);

-- Tabla : Detalle
DROP TABLE IF EXISTS Detalle;
CREATE TABLE Detalle(
    IdVenta CHAR(10) NOT NULL,
    IdProducto CHAR(8) NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnidad DECIMAL NOT NULL,
    Estado CHAR(1) NOT NULL,
    PRIMARY KEY(IdVenta, IdProducto),
    FOREIGN KEY(IdVenta) REFERENCES Ventas(IdVenta),
    CHECK(Cantidad > 0),
    CHECK(PrecioUnidad >0),
    CHECK(Estado IN ('0','1'))
);

-- PROCEDIMIENTOS ALMACENADOS

-- Store Procedure : ListarProductos
DROP PROCEDURE IF EXISTS ListarProductos;
DELIMITER @@
CREATE PROCEDURE ListarProductos()
BEGIN
    SELECT * FROM Productos;
END @@
DELIMITER;

-- Llamada al procedimiento almacenado
CALL ListarProductos()

-- Store Procedure : ListarProductosXCategoria
DROP PROCEDURE IF EXISTS ListarProductosXCategoria;
DELIMITER //
CREATE PROCEDURE ListarProductosXCategoria(IdCat CHAR(6))
BEGIN
    SELECT * FROM Productos
    WHERE IdCategoria = IdCat;
END //
DELIMITER;

CALL ListarProductosXCategoria('CAT001');

-- Store Procedure : InfoCliente
DROP PROCEDURE IF EXISTS InfoCliente;
DELIMITER @@
CREATE PROCEDURE InfoCliente(IdCli CHAR(8))
BEGIN
    SELECT * FROM Clientes
    WHERE IdCliente = IdCli;
END @@
DELIMITER;

CALL InfoCliente('CLI00001');

-- Store Procedure : InsertaVenta
DROP PROCEDURE IF EXISTS InsertaVenta;
DELIMITER @@
CREATE PROCEDURE InsertaVenta(
    IdVenta CHAR(10),
    IdCliente CHAR(8),
    FechaVenta DATE,
    MontoTotal DECIMAL,
    Estado CHAR(1)
)
BEGIN
    INSERT INTO Ventas VALUES(IdVenta,IdCliente,FechaVenta,MontoTotal,Estado);
END @@
DELIMITER;

-- Store Procedure : InsertaDetalle
DROP PROCEDURE InsertaDetalle;
DELIMITER @@
CREATE PROCEDURE InsertaDetalle(
    IdVenta CHAR(10),
    IdProducto CHAR(8),
    Cantidad INT,
    PrecioUnidad DECIMAL,
    Estado CHAR(1)
)
BEGIN
    INSERT INTO Detalle VALUES(IdVenta,IdProducto,Cantidad,PrecioUnidad,Estado);
END @@
DELIMITER;

