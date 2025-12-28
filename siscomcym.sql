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
    id_producto INT PRIMARY KEY,
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
create table clientes 
(
cedula VARCHAR (13) primary key, -- declaramos el identificador foraneo 
nombre VARCHAR(100),
fechadenacimiento date,
tipo CHAR(3),
email VARCHAR(100),
direccion VARCHAR(100),
telefono VARCHAR(13)
);

-- =============================================
-- TABLA: VENTAS
-- =============================================
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    cedula VARCHAR(13),
    total DECIMAL(10,2),
    FOREIGN KEY (cedula) REFERENCES clientes(cedula)
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
-- TABLA: EMPRESA
-- =============================================
CREATE TABLE empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ruc VARCHAR(13) NOT NULL,
    direccion VARCHAR(150),
    telefono VARCHAR(13),
    email VARCHAR(100)
);

-- =============================================
-- TABLA: PROVEEDOR
-- =============================================
CREATE TABLE proveedor (
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(13),
    email VARCHAR(100),
    direccion VARCHAR(150)
);

-- =============================================
-- TABLA: PROVEEDOR_PRODUCTOS
-- =============================================
CREATE TABLE proveedor_productos (
    id_proveedor INT NOT NULL,
    id_producto INT NOT NULL,
    precio_compra DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_proveedor, id_producto),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

