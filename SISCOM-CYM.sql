-- Tabla para productos
CREATE DATABASE siscom-cym;
USE ;
CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    stock INT,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Tabla para categorías de productos
CREATE TABLE categorias (
    id INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Tabla para ventas
CREATE TABLE ventas (
    id INT PRIMARY KEY,
    fecha DATE,
    total DECIMAL(10, 2),
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabla para clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20)
);

-- Tabla para detalle de ventas (productos vendidos)
CREATE TABLE detalle_venta (
    id INT PRIMARY KEY,
    venta_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (venta_id) REFERENCES ventas(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Tabla para proveedores
CREATE TABLE proveedores (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    telefono VARCHAR(20)
);

-- Tabla para compras a proveedores
CREATE TABLE compras (
    id INT PRIMARY KEY,
    fecha DATE,
    proveedor_id INT,
    total DECIMAL(10, 2),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);

-- Tabla para detalle de compras (productos adquiridos)
CREATE TABLE detalle_compra (
    id INT PRIMARY KEY,
    compra_id INT,
    producto_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (compra_id) REFERENCES compras(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);