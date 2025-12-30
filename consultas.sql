-- *********************************
-- CONSULTA  
-- *********************************
-- Elaborar una consulta sQL para obtener una lista de registros con:
USE siscomcym;
-- 1. Una condición de igualdad aplicada a un atributo de tipo entero
select 
    id_producto as N°,
    nombre as producto,
    descripcion,
    precio_venta,
    stock
    from productos 
    where id_producto = 17;

-- 2. Una condición de igualdad aplicada a un atributo de tipo cadena de caracteres
select
    cedula,
    nombre as cliente
from clientes
where nombre LIKE 'Betty%';

SELECT * from clientes;

-- 3. Una condición de mayor igual que aplicada a un atributo de tipo decimal
select *
from productos
where precio_venta > 30.00;

-- 4. Una condición de distinto aplicada a un atributo de tipo cadena de caracteres
SELECT cedula, nombre, tipo
FROM clientes
WHERE tipo != 'NAT';

-- 5. Una condición de pertenencia a una lista de valores (IN)
-- aplicada a un atributo de tipo cadena de caracteres
SELECT *
FROM facturas
WHERE estado IN ('PENDIENTE');

select * from facturas;

-- 6. Dos condiciones a su elección, unidas con el operador AND
SELECT nombre, precio_venta, stock
FROM productos
WHERE stock > 10
AND precio_venta > 20;

-- 7. Doc condiciones similares a la anterior, proyecta en tres columnas y crea una vista para contenerla
CREATE VIEW vista_clientes_contactables AS
SELECT cedula, nombre, email
FROM clientes
WHERE telefono IS NOT NULL
AND email IS NOT NULL;

-- consulta  la vista 
select * from vista_clientes_contactables;

-- 8. Dos condiciones a su elección, unidas con el operador OR
SELECT nombre, precio_venta, stock
FROM productos
WHERE stock < 5
OR precio_venta > 12;

-- 9. Una condición a su elección y el operador NOT
SELECT numero_factura, estado, total
FROM facturas
WHERE NOT estado = 'PAGADA';

-- 10. La operación JOIN en base de dos tablas que dispongan de la restricción de clave foránea
SELECT 
    v.id_venta,
    v.fecha,
    c.nombre AS cliente,
    v.total
FROM ventas v
INNER JOIN clientes c
    ON v.cedula = c.cedula;

-- 11. La operación JOIN como la anterior, proyecta en tres columnas, y crea una vista para contenerla.
SELECT 
    c.nombre AS cliente,
    f.numero_factura,
    f.total
FROM clientes c
JOIN ventas v ON c.cedula = v.cedula
JOIN facturas f ON v.id_venta = f.id_venta;

-- 12. La operación LEFT JOIN en base de dos tablas que dispongan de la restricción de clave foránea
SELECT 
    c.nombre AS categoria,
    p.nombre AS producto,
    p.stock
FROM categorias c
LEFT JOIN productos p 
    ON c.id_categoria = p.id_categoria;
 
-- 13. La operación RIGHT JOIN en base de dos tablas que dispongan de la restricción de clave foránea
SELECT 
    c.nombre,
    v.id_venta,
    v.total
FROM clientes c
RIGHT JOIN ventas v
    ON c.cedula = v.cedula;

-- 14. La operación LEFT JOIN en base de una tabla que disponga de una auto referencia
SELECT 
    c1.nombre AS cliente,
    c1.cedula,
    c2.nombre AS "posible_referido"
FROM clientes c1
LEFT JOIN clientes c2
    ON c1.cedula < c2.cedula;

-- 15. Un ordenamiento sobre un atributo de forma descendente
use siscomcym;
SELECT nombre, precio_venta, stock
FROM productos
ORDER BY precio_venta DESC;

-- 16. Un ordenamiento sobre dos atributos, el primero ascendente y el segundo descendente
SELECT id_producto, nombre, id_categoria, precio_venta
FROM productos
ORDER BY id_categoria ASC, precio_venta DESC;

-- 17. Un agrupamiento sobre un atributo que no posee una restricción de unicidad y una operación de conteo
SELECT id_venta, cedula, total, fecha
FROM ventas
ORDER BY cedula ASC, total DESC;

-- 18. Una proyección con tres columnas, una de ellas calculada, con operadores matemáticos
use siscomcym;
SELECT 
    id_producto,
    cantidad,
    cantidad * precio_unitario AS subtotal_calculado
FROM detalle_venta;

-- 19. Una proyección con tres columnas, una de ellas calculada, con concatenación de caracteres
SELECT 
    p.nombre AS producto,
    c.nombre AS categoria,
    CONCAT(p.nombre, ' (', c.nombre, ')') AS producto_categoria
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria;

-- 20. Una proyeccción con tres columnas similar a la anterior y crea una vista para contenerla
CREATE VIEW vista_productos_categoria AS
SELECT 
    p.nombre AS producto,
    c.nombre AS categoria,
    CONCAT(p.nombre, ' (', c.nombre, ')') AS producto_categoria
FROM productos p
JOIN categorias c ON p.id_categoria = c.id_categoria;

-- 21. Una subconsulta que retorne un valor, basada en una restricción de clave foránea
use siscomcym;
SELECT nombre,
       (SELECT COUNT(*) 
        FROM ventas 
        WHERE ventas.cedula = clientes.cedula) AS total_ventas
FROM clientes;

-- 22. Consulta con atributo fecha y campo calculado usando CURDATE()

SELECT 
    id_venta,
    fecha,
    DATEDIFF(CURDATE(), fecha) AS dias_desde_venta
FROM ventas;

-- 23. Consulta con atributo fecha usando BETWEEN

SELECT *
FROM ventas
WHERE fecha BETWEEN '2024-01-01' AND '2025-01-05';

-- 24. Consulta con IS NULL y IS NOT NULL

SELECT *
FROM ventas
WHERE total IS NULL;

SELECT *
FROM ventas
WHERE total IS NOT NULL;

-- 25. Consulta con DISTINCT sobre datos repetidos
SELECT DISTINCT cedula
FROM ventas;

-- 26. Consulta con CASE WHEN THEN ELSE END
SELECT 
    numero_factura,
    total,
    CASE
        WHEN total >= 100 THEN 'Factura Alta'
        WHEN total BETWEEN 50 AND 99.99 THEN 'Factura Media'
        ELSE 'Factura Baja'
    END AS tipo_factura
FROM facturas;

-- 27. Consulta usando UNION

SELECT nombre, email
FROM clientes
UNION
SELECT nombre, descripcion
FROM categorias;

-- 28. Consulta con EXISTS y subconsulta

SELECT *
FROM clientes c
WHERE EXISTS (
    SELECT 1
    FROM ventas v
    WHERE v.cedula = c.cedula
);

-- ************************************
-- CONSULTA TABLA PROVEEDORES_PRODUCTOS
-- ************************************
SELECT p.nombre AS proveedor, pr.nombre AS producto, pp.precio_compra
FROM proveedor_productos pp
JOIN proveedor p ON pp.id_proveedor = p.id_proveedor
JOIN productos pr ON pp.id_producto = pr.id_producto
ORDER BY p.nombre;

-- *********************
-- DETALLE FACTURA
-- *********************
CREATE VIEW vista_detalle_factura AS
SELECT
    f.id_factura,
    f.numero_factura,
    f.fecha_emision,
    f.estado,
    
    c.cedula,
    c.nombre AS nombre_cliente,
    c.email,
    
    p.nombre AS producto,
    df.cantidad,
    df.precio_unitario,
    df.subtotal,
    
    f.subtotal AS subtotal_factura,
    f.iva,
    f.total
FROM facturas f
INNER JOIN ventas v ON f.id_venta = v.id_venta
INNER JOIN clientes c ON v.cedula = c.cedula
INNER JOIN detalle_factura df ON f.id_factura = df.id_factura
INNER JOIN productos p ON df.id_producto = p.id_producto;

-- *********************
-- CONSULTA DE INVENTARIO
-- *********************
use siscomcym;
SELECT 
    p.id_producto,
    p.nombre AS producto,
    c.nombre AS categoria,
    p.stock,
    p.precio_compra,
    p.precio_venta,
    (p.stock * p.precio_compra) AS valor_inventario_costo,
    (p.stock * p.precio_venta) AS valor_inventario_venta
FROM productos p
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
ORDER BY c.nombre, p.nombre;
-- ******************
-- VENTAS Y FACTURAS
-- ******************
CREATE VIEW vista_ventas_facturas_union AS
SELECT 
    id_venta,
    fecha,
    total,
    'VENTA' AS origen
FROM ventas
UNION
SELECT 
    f.id_venta,
    f.fecha_emision,
    f.total,
    'FACTURA' AS origen
FROM facturas f;

select * from vista_ventas_facturas_union;|

-- *****************
-- TOTAL INVENTARIO
-- *****************

SELECT 
    SUM(stock * precio_compra) AS total_invertido,
    SUM(stock * precio_venta) AS total_potencial_venta
FROM productos;

-- *************************************
-- ESTADO DEL INVENTARIO
-- *************************************
SELECT 
    p.id_producto,
    p.nombre AS producto,
    c.nombre AS categoria,
    p.stock,
    CASE 
        WHEN p.stock = 0 THEN 'AGOTADO'
        WHEN p.stock BETWEEN 1 AND 15 THEN 'POR AGOTARSE'
        ELSE 'STOCK NORMAL'
    END AS estado_inventario
FROM productos p
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
ORDER BY p.stock ASC;

-- *********************
-- CONSULTA INVENTARIO -- CON FUNCION UNION
-- *********************
CREATE VIEW vista_estado_inventario_union AS
SELECT 
    p.id_producto,
    p.nombre AS producto,
    c.nombre AS categoria,
    p.stock,
    'AGOTADO' AS estado_inventario
FROM productos p
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
WHERE p.stock = 0
UNION
SELECT 
    p.id_producto,
    p.nombre AS producto,
    c.nombre AS categoria,
    p.stock,
    'POR AGOTARSE' AS estado_inventario
FROM productos p
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
WHERE p.stock BETWEEN 1 AND 5
UNION
SELECT 
    p.id_producto,
    p.nombre AS producto,
    c.nombre AS categoria,
    p.stock,
    'STOCK NORMAL' AS estado_inventario
FROM productos p
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
WHERE p.stock > 5;

-- CONSULTA: 
SELECT * FROM vista_estado_inventario_union
ORDER BY stock;

-- *********************
-- GROUP BY
-- *********************
SELECT 
    c.nombre AS categoria,
    COUNT(p.id_producto) AS cantidad_productos,
    SUM(p.stock) AS total_unidades,
    SUM(p.stock * p.precio_compra) AS valor_total_compra,
    SUM(p.stock * p.precio_venta) AS valor_total_venta
FROM productos p
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
GROUP BY c.nombre
ORDER BY c.nombre;

-- *********************
-- PARTITION BY
-- *********************
use siscomcym;
SELECT 
    p.id_producto,
    p.nombre AS producto,
    c.nombre AS categoria,
    p.stock,
    SUM(p.stock) OVER (PARTITION BY c.nombre) AS stock_total_categoria
FROM productos p
INNER JOIN categorias c
    ON p.id_categoria = c.id_categoria
ORDER BY c.nombre, p.nombre;

-- *********************
--  PRODUCTOS VENDIDOS VS STOCK ACTUAL
-- *********************
use siscomcym;
SELECT 
    p.id_producto,
    p.nombre AS producto,
    p.stock AS stock_actual,
    COALESCE(SUM(dv.cantidad), 0) AS total_vendido,
    (p.stock - COALESCE(SUM(dv.cantidad), 0)) AS stock_restante,
    CASE
        WHEN (p.stock - COALESCE(SUM(dv.cantidad), 0)) = 0 THEN 'AGOTADO'
        WHEN (p.stock - COALESCE(SUM(dv.cantidad), 0)) BETWEEN 1 AND 13 THEN 'POR AGOTARSE'
        ELSE 'STOCK NORMAL'
    END AS estado_inventario
FROM productos p
LEFT JOIN detalle_venta dv
    ON p.id_producto = dv.id_producto
GROUP BY 
    p.id_producto,
    p.nombre,
    p.stock
ORDER BY estado_inventario, producto;

-- *********************
-- CALCULO DE GANANCIAS
-- *********************
SELECT 
    v.id_venta,
    p.nombre AS producto,
    dv.cantidad,
    p.precio_compra,
    p.precio_venta,
    (p.precio_venta - p.precio_compra) * dv.cantidad AS ganancia_producto
FROM ventas v
INNER JOIN detalle_venta dv
    ON v.id_venta = dv.id_venta
INNER JOIN productos p
    ON dv.id_producto = p.id_producto
ORDER BY v.id_venta;

-- *********************
-- CONSULTA
-- *********************
use siscomcym;
SELECT *
FROM vista_detalle_factura where estado = 'PENDIENTE';