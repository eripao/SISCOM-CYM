-- =============================================
-- BASE DE DATOS: Camisetas y Más
-- Sistema de Inventario, Ventas y Facturación
-- =============================================
DROP DATABASE siscomcym;
CREATE DATABASE siscomcym;
USE siscomcym;

-- =============================================
-- TABLA: CATEGORIAS
-- =============================================
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100)
);

-- =============================================
-- TABLA: PRODUCTOS
-- =============================================
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(150),
    precio_compra DECIMAL(10,2) NOT NULL,
    precio_venta DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- =============================================
-- TABLA: CLIENTES
-- =============================================
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100)
);

-- =============================================
-- TABLA: VENTAS
-- =============================================
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- =============================================
-- TABLA: DETALLE_VENTA
-- =============================================
CREATE TABLE detalle_venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- =============================================
-- TABLA: FACTURAS
-- =============================================
CREATE TABLE facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    numero_factura VARCHAR(20) NOT NULL UNIQUE,
    fecha_emision DATE NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    iva DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta)
);

-- =============================================
-- TABLA: DETALLE_FACTURA
-- =============================================
CREATE TABLE detalle_factura (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_factura INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);



-- =============================================
-- REGISTROS
-- =============================================

use siscomcym;
-- CATEGORIAS
INSERT INTO categorias (nombre, descripcion) VALUES
('Camisetas','Ropa casual'),('Pijamas','Ropa de dormir'),('Sabanas','Ropa de cama'),('Blusas','Ropa femenina'),('Cobertores','Abrigos'),
('Shorts','Ropa deportiva'),('Polos','Ropa formal'),('Jeans','Pantalones'),('Vestidos','Ropa femenina'),('Ropa Interior','Uso diario'),
('Medias','Accesorios'),('Chaquetas','Abrigos'),('Sudaderas','Ropa deportiva'),('Camisas','Ropa formal'),('Faldas','Ropa femenina'),
('Gorras','Accesorios'),('Bufandas','Accesorios'),('Pantalonetas','Deporte'),('Overoles','Trabajo'),('Uniformes','Institucional');


-- PRODUCTOS
INSERT INTO productos (nombre, descripcion, precio_compra, precio_venta, stock, id_categoria) VALUES
('Camiseta Blanca','Algodon',5,10,50,1),('Camiseta Negra','Algodon',6,12,40,1),('Pijama Azul','Algodon',10,18,30,2),('Sabana Simple','Cama simple',15,25,20,3),
('Blusa Roja','Moda',8,15,35,4),('Cobertor Polar','Invierno',20,35,15,5),('Short Deportivo','Running',7,14,25,6),('Polo Blanco','Formal',9,18,30,7),
('Jean Azul','Clasico',18,35,20,8),('Vestido Floral','Verano',15,30,18,9),('Boxer','Algodon',3,7,60,10),('Medias Negras','Uso diario',1,3,100,11),
('Chaqueta Jeans','Abrigo',20,45,10,12),('Sudadera Gris','Deportiva',12,25,22,13),('Camisa Blanca','Oficina',10,22,28,14),('Falda Negra','Formal',9,18,24,15),
('Gorra Negra','Casual',4,9,40,16),('Bufanda Lana','Invierno',5,12,30,17),('Pantaloneta Futbol','Deporte',6,13,26,18),('Uniforme Escolar','Institucional',18,40,12,20);


-- CLIENTES
INSERT INTO clientes (nombre, telefono, email) VALUES
('Juan Perez','0991111111','juan@gmail.com'),('Maria Lopez','0992222222','maria@gmail.com'),('Carlos Ruiz','0993333333','carlos@hotmail.com'),('Ana Torres','0994444444','ana@gmail.com'),
('Luis Vega','0995555555','luis@gmail.com'),('Sofia Mena','0996666666','sofia@yahoo.com'),('Pedro Rios','0997777777','pedro@gmail.com'),('Lucia Paz','0998888888','lucia@gmail.com'),
('Diego Cruz','0999999999','diego@gmail.com'),('Valeria Soto','0981111111','valeria@gmail.com'),('Miguel Lara','0982222222','miguel@gmail.com'),('Paola Diaz','0983333333','paola@gmail.com'),
('Jorge Velez','0984444444','jorge@gmail.com'),('Camila Ortiz','0985555555','camila@gmail.com'),('Andres Luna','0986666666','andres@gmail.com'),('Daniela Paredes','0987777777','daniela@gmail.com'),
('Ricardo Mora','0988888888','ricardo@gmail.com'),('Natalia Peña','0989999999','natalia@gmail.com'),('Oscar Cedeño','0971111111','oscar@gmail.com'),('Fernanda Gil','0972222222','fernanda@gmail.com');


-- VENTAS
INSERT INTO ventas (fecha, id_cliente, total) VALUES
('2025-01-01',1,50),('2025-01-02',2,75),('2025-01-03',3,40),('2025-01-04',4,60),('2025-01-05',5,90),
('2025-01-06',6,30),('2025-01-07',7,110),('2025-01-08',8,55),('2025-01-09',9,70),('2025-01-10',10,85),
('2025-01-11',11,45),('2025-01-12',12,65),('2025-01-13',13,95),('2025-01-14',14,80),('2025-01-15',15,120),
('2025-01-16',16,50),('2025-01-17',17,60),('2025-01-18',18,75),('2025-01-19',19,90),('2025-01-20',20,100);


-- DETALLE_VENTA
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1,1,2,10,20),(2,2,3,12,36),(3,3,1,18,18),(4,4,2,25,50),(5,5,3,15,45),
(6,6,1,35,35),(7,7,4,14,56),(8,8,2,18,36),(9,9,1,35,35),(10,10,2,30,60),
(11,11,5,7,35),(12,12,10,3,30),(13,13,1,45,45),(14,14,2,25,50),(15,15,3,22,66),
(16,16,2,18,36),(17,17,3,9,27),(18,18,2,12,24),(19,19,4,13,52),(20,20,1,40,40);


-- FACTURAS
INSERT INTO facturas (id_venta, numero_factura, fecha_emision, subtotal, iva, total, estado) VALUES
(1,'F001','2025-01-01',50,6,56,'EMITIDA'),(2,'F002','2025-01-02',75,9,84,'EMITIDA'),(3,'F003','2025-01-03',40,4.8,44.8,'EMITIDA'),
(4,'F004','2025-01-04',60,7.2,67.2,'EMITIDA'),(5,'F005','2025-01-05',90,10.8,100.8,'EMITIDA'),(6,'F006','2025-01-06',30,3.6,33.6,'EMITIDA'),
(7,'F007','2025-01-07',110,13.2,123.2,'EMITIDA'),(8,'F008','2025-01-08',55,6.6,61.6,'EMITIDA'),(9,'F009','2025-01-09',70,8.4,78.4,'EMITIDA'),
(10,'F010','2025-01-10',85,10.2,95.2,'EMITIDA'),(11,'F011','2025-01-11',45,5.4,50.4,'EMITIDA'),(12,'F012','2025-01-12',65,7.8,72.8,'EMITIDA'),
(13,'F013','2025-01-13',95,11.4,106.4,'EMITIDA'),(14,'F014','2025-01-14',80,9.6,89.6,'EMITIDA'),(15,'F015','2025-01-15',120,14.4,134.4,'EMITIDA'),
(16,'F016','2025-01-16',50,6,56,'EMITIDA'),(17,'F017','2025-01-17',60,7.2,67.2,'EMITIDA'),(18,'F018','2025-01-18',75,9,84,'EMITIDA'),
(19,'F019','2025-01-19',90,10.8,100.8,'EMITIDA'),(20,'F020','2025-01-20',100,12,112,'EMITIDA');


-- DETALLE_FACTURA
INSERT INTO detalle_factura (id_factura, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1,1,2,10,20),(2,2,3,12,36),(3,3,1,18,18),(4,4,2,25,50),(5,5,3,15,45),
(6,6,1,35,35),(7,7,4,14,56),(8,8,2,18,36),(9,9,1,35,35),(10,10,2,30,60),
(11,11,5,7,35),(12,12,10,3,30),(13,13,1,45,45),(14,14,2,25,50),(15,15,3,22,66),
(16,16,2,18,36),(17,17,3,9,27),(18,18,2,12,24),(19,19,4,13,52),(20,20,1,40,40);


-- =============================================
-- CONSULTAS
-- =============================================

select * from clientes;