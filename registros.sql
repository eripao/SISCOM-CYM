
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
INSERT INTO productos 
(id_producto, nombre, descripcion, precio_compra, precio_venta, stock, id_categoria) VALUES
(1, 'Camiseta Blanca', 'Algodon', 5.00, 10.00, 50, 1),
(2, 'Camiseta Negra', 'Algodon', 6.00, 12.00, 40, 1),
(3, 'Pijama Azul', 'Algodon', 10.00, 18.00, 30, 2),
(4, 'Sabana Simple', 'Cama simple', 15.00, 25.00, 20, 3),
(5, 'Blusa Roja', 'Moda', 8.00, 15.00, 35, 4),
(6, 'Cobertor Polar', 'Invierno', 20.00, 35.00, 15, 5),
(7, 'Short Deportivo', 'Running', 7.00, 14.00, 25, 6),
(8, 'Polo Blanco', 'Formal', 9.00, 18.00, 30, 7),
(9, 'Jean Azul', 'Clasico', 18.00, 35.00, 20, 8),
(10, 'Vestido Floral', 'Verano', 15.00, 30.00, 18, 9),
(11, 'Boxer', 'Algodon', 3.00, 7.00, 60, 10),
(12, 'Medias Negras', 'Uso diario', 1.00, 3.00, 100, 11),
(13, 'Chaqueta Jeans', 'Abrigo', 20.00, 45.00, 10, 12),
(14, 'Sudadera Gris', 'Deportiva', 12.00, 25.00, 22, 13),
(15, 'Camisa Blanca', 'Oficina', 10.00, 22.00, 28, 14),
(16, 'Falda Negra', 'Formal', 9.00, 18.00, 24, 15),
(17, 'Gorra Negra', 'Casual', 4.00, 9.00, 40, 16),
(18, 'Bufanda Lana', 'Invierno', 5.00, 12.00, 30, 17),
(19, 'Pantaloneta Futbol', 'Deporte', 6.00, 13.00, 26, 18),
(20, 'Uniforme Escolar', 'Institucional', 18.00, 40.00, 12, 20);

-- CLIENTES

insert into clientes 
(cedula,nombre,fechadenacimiento,tipo,email,direccion,telefono) values 
('0602596587', 'Viviana Perez', '1990-03-24', 'NAT','viviana5@gmail.com','Av. Gaspar de Villarroel N79-813, Carcelén, Quito', '0910647731'),
('1804141479', 'Juan Guaman', '1990-03-24', 'JUR','juan34@gmail.com','Av. De los Shyris N92-345, Carcelén, Quito', '0973666927'),
('1720477171', 'Betty Bowen', '1990-03-24', 'NAT','betty8@gmail.com','Av. Colón N39-452, Turubamba, Quito', '0976632750'),
('1802278604', 'Manuel Avalos', '1990-03-24', 'JUR','manuel9@gmail.com','Av. República N18-902, Calderón, Quito', '0934473990'),
('1723006035', 'Soledad Perez', '1990-03-24', 'JUR','soledad6@gmail.com','Av. Gaspar de Villarroel N39-698, Iñaquito, Quito', '0909111159'),
('1720026663', 'Patricio Villacis', '1990-03-24', 'NAT','patricio3@gmail.,com','Calle Whymper N88-718, La Floresta, Quito','0934567990'),
('1758357162', 'Diego Jimenez', '1990-03-24', 'NAT','diego4@gmail.com','Av. Mariana de Jesús N92-284, Quitumbe, Quito', '0978884020'),
('0300885506', 'Fabian Romero', '1990-03-24', 'JUR','fabian1@gmail.com','Calle Whymper N31-522, La Mariscal, Quito', '0961655576');

-- VENTAS
INSERT INTO ventas (fecha, cedula, total) VALUES
('2025-01-01','0602596587',50),
('2025-01-02','1804141479',75),
('2025-01-03','1720477171',40),
('2025-01-04','1802278604',60),
('2025-01-05','1723006035',90),
('2025-01-06','1720026663',30),
('2025-01-07','1758357162',110),
('2025-01-08','0300885506',55),
('2025-01-09','0602596587',70),
('2025-01-10','1804141479',85),
('2025-01-11','1720477171',45),
('2025-01-12','1802278604',65),
('2025-01-13','1723006035',95),
('2025-01-14','1720026663',80),
('2025-01-15','1758357162',120),
('2025-01-16','0300885506',50),
('2025-01-17','0602596587',60),
('2025-01-18','1804141479',75),
('2025-01-19','1720477171',90),
('2025-01-20','1802278604',100);


-- DETALLE_VENTA
INSERT INTO detalle_venta (id_venta, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1,1,2,10,20),(2,2,3,12,36),(3,3,1,18,18),(4,4,2,25,50),(5,5,3,15,45),
(6,6,1,35,35),(7,7,4,14,56),(8,8,2,18,36),(9,9,1,35,35),(10,10,2,30,60),
(11,11,5,7,35),(12,12,10,3,30),(13,13,1,45,45),(14,14,2,25,50),(15,15,3,22,66),
(16,16,2,18,36),(17,17,3,9,27),(18,18,2,12,24),(19,19,4,13,52),(20,20,1,40,40);


-- FACTURAS
INSERT INTO facturas (id_venta, numero_factura, fecha_emision, subtotal, iva, total, estado) VALUES
(1,'F001','2025-01-01',50,6,56,'PAGADA'),(2,'F002','2025-01-02',75,9,84,'PAGADA'),(3,'F003','2025-01-03',40,4.8,44.8,'PENDIENTE'),
(4,'F004','2025-01-04',60,7.2,67.2,'PAGADA'),(5,'F005','2025-01-05',90,10.8,100.8,'PAGADA'),(6,'F006','2025-01-06',30,3.6,33.6,'PAGADA'),
(7,'F007','2025-01-07',110,13.2,123.2,'PAGADA'),(8,'F008','2025-01-08',55,6.6,61.6,'PAGADA'),(9,'F009','2025-01-09',70,8.4,78.4,'PAGADA'),
(10,'F010','2025-01-10',85,10.2,95.2,'PAGADA'),(11,'F011','2025-01-11',45,5.4,50.4,'PAGADA'),(12,'F012','2025-01-12',65,7.8,72.8,'PENDIENTE'),
(13,'F013','2025-01-13',95,11.4,106.4,'PAGADA'),(14,'F014','2025-01-14',80,9.6,89.6,'PAGADA'),(15,'F015','2025-01-15',120,14.4,134.4,'PENDIENTE'),
(16,'F016','2025-01-16',50,6,56,'PENDIENTE'),(17,'F017','2025-01-17',60,7.2,67.2,'PAGADA'),(18,'F018','2025-01-18',75,9,84,'PENDIENTE'),
(19,'F019','2025-01-19',90,10.8,100.8,'PENDIENTE'),(20,'F020','2025-01-20',100,12,112,'PAGADA');


-- DETALLE_FACTURA
INSERT INTO detalle_factura (id_factura, id_producto, cantidad, precio_unitario, subtotal) VALUES
(1,1,2,10,20),(2,2,3,12,36),(3,3,1,18,18),(4,4,2,25,50),(5,5,3,15,45),
(6,6,1,35,35),(7,7,4,14,56),(8,8,2,18,36),(9,9,1,35,35),(10,10,2,30,60),
(11,11,5,7,35),(12,12,10,3,30),(13,13,1,45,45),(14,14,2,25,50),(15,15,3,22,66),
(16,16,2,18,36),(17,17,3,9,27),(18,18,2,12,24),(19,19,4,13,52),(20,20,1,40,40);


-- PROVEEDOR
INSERT INTO proveedor 
(id_proveedor, nombre, contacto, telefono, email, direccion) VALUES
(1, 'Textiles Andinos', 'Carlos Pérez', '0991234567', 'ventas@andinos.com', 'Quito'),
(2, 'Moda Global', 'Ana López', '0987654321', 'contacto@modaglobal.com', 'Guayaquil'),
(3, 'Distribuciones El Norte', 'Luis Martínez', '0974567890', 'elnorte@proveedores.com', 'Ibarra'),
(4, 'Ropa Express', 'María Torres', '0963214789', 'info@ropaexpress.com', 'Ambato'),
(5, 'Fabrica Nacional Textil', 'Jorge Ramos', '0958741236', 'ventas@fnt.com', 'Cuenca');



-- PROVEEDOR PRODUCTOS
INSERT INTO proveedor_productos (id_proveedor, id_producto, precio_compra) VALUES
-- Proveedor 1: Textiles Andinos
(1, 1, 5.0),
(1, 2, 6.0),
(1, 3, 10.0),
(1, 11, 3.0),
-- Proveedor 2: Moda Global
(2, 4, 15.0),
(2, 5, 8.0),
(2, 10, 15.0),
(2, 15, 10.0),
-- Proveedor 3: Distribuciones El Norte
(3, 6, 20.0),
(3, 7, 7.0),
(3, 8, 9.0),
(3, 14, 12.0),
-- Proveedor 4: Ropa Express
(4, 9, 18.0),
(4, 12, 1.0),
(4, 16, 9.0),
(4, 17, 5.0),
-- Proveedor 5: Fabrica Nacional Textil
(5, 13, 20.0),
(5, 18, 6.0),
(5, 19, 6.0),
(5, 20, 18.0);


