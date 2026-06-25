USE BaseDeDatos_PyME;
GO
-- 1. Total facturado en un mes (Facturas pagadas)
SELECT SUM(total) AS TotalFacturado
FROM FACTURAS
WHERE YEAR(fecha_emision) = 2025 AND MONTH(fecha_emision) = 3
AND id_estado_factura = (SELECT id_estado_factura FROM ESTADOS_FACTURA WHERE estado = 'Pagada');;

GO

-- 2. Productos más vendidos
SELECT TOP 5 p.nombre AS Producto, SUM(d.cantidad) AS TotalVendido
FROM DETALLES_FACTURA d
JOIN PRODUCTOS_SERVICIOS p ON d.id_producto_servicio = p.id_producto_servicio
GROUP BY p.nombre
ORDER BY TotalVendido DESC;

GO

-- 3. Clientes con más compras Tanto Juridicos como Fisicos

-- A: Clientes juridicos
SELECT TOP 5 
    c.razon_social AS Empresa,
    COUNT(f.id_factura) AS CantidadCompras,
    SUM(f.total) AS TotalGastado
FROM FACTURAS f
JOIN CLIENTES c ON f.id_cliente = c.id_cliente
WHERE c.tipo_persona = 'J'
GROUP BY c.id_cliente, c.razon_social
ORDER BY TotalGastado DESC;

GO

-- B: Clientes fisicos
SELECT TOP 5 
    c.nombre + ' ' + c.apellido AS Cliente,
    COUNT(f.id_factura) AS CantidadCompras,
    SUM(f.total) AS TotalGastado
FROM FACTURAS f
JOIN CLIENTES c ON f.id_cliente = c.id_cliente
WHERE c.tipo_persona = 'F'
GROUP BY c.id_cliente, c.nombre, c.apellido
ORDER BY TotalGastado DESC;

GO

-- 4. Facturas en un rango de fechas (filtro avanzado)
DECLARE @fecha_inicio DATE = '2025-01-01';
DECLARE @fecha_fin DATE = '2025-12-31';

SELECT 
    f.numero_factura,
    f.fecha_emision,
    CASE 
        WHEN c.tipo_persona = 'F' THEN c.nombre + ' ' + c.apellido
        ELSE c.razon_social
    END AS Cliente,
    f.total
FROM FACTURAS f
JOIN CLIENTES c ON f.id_cliente = c.id_cliente
WHERE f.fecha_emision BETWEEN @fecha_inicio AND @fecha_fin
ORDER BY f.fecha_emision DESC;
GO

-- 5. Productos que nunca se vendieron (subconsulta)
SELECT 
    p.nombre,
    p.precio_unitario_actual,
    c.nombre AS Categoria
FROM PRODUCTOS_SERVICIOS p
JOIN CATEGORIAS_PRODUCTO c ON p.id_categoria = c.id_categoria
WHERE NOT EXISTS (
    SELECT 1 
    FROM DETALLES_FACTURA d 
    WHERE d.id_producto_servicio = p.id_producto_servicio
)
AND p.activo = 1
ORDER BY p.nombre;
GO

-- 6. Días entre emisión y pago (función de fecha)
SELECT 
    CASE 
        WHEN c.tipo_persona = 'F' THEN c.nombre + ' ' + c.apellido
        ELSE c.razon_social
    END AS Cliente,
    AVG(DATEDIFF(DAY, f.fecha_emision, cp.fecha_pago)) AS DiasPromedioPago,
    COUNT(f.id_factura) AS CantidadFacturas
FROM FACTURAS f
JOIN CLIENTES c ON f.id_cliente = c.id_cliente
JOIN COMPROBANTES_PAGO cp ON f.id_factura = cp.id_factura
GROUP BY c.id_cliente, c.tipo_persona, c.nombre, c.apellido, c.razon_social
HAVING COUNT(f.id_factura) > 1
ORDER BY DiasPromedioPago DESC;
GO

-- 7. Facturación por forma de pago (agrupación)
SELECT 
    fp.forma_pago,
    COUNT(f.id_factura) AS CantidadFacturas,
    SUM(f.total) AS TotalFacturado
FROM FACTURAS f
JOIN COMPROBANTES_PAGO cp ON f.id_factura = cp.id_factura
JOIN FORMAS_PAGO fp ON cp.id_forma_pago = fp.id_forma_pago
WHERE f.id_estado_factura = (SELECT id_estado_factura FROM ESTADOS_FACTURA WHERE estado = 'Pagada')
GROUP BY fp.forma_pago
ORDER BY TotalFacturado DESC;
GO

-- 8. Productos más vendidos por categoría
SELECT 
    c.nombre AS Categoria,
    p.nombre AS Producto,
    SUM(d.cantidad) AS UnidadesVendidas
FROM DETALLES_FACTURA d
JOIN PRODUCTOS_SERVICIOS p ON d.id_producto_servicio = p.id_producto_servicio
JOIN CATEGORIAS_PRODUCTO c ON p.id_categoria = c.id_categoria
GROUP BY c.nombre, p.nombre
ORDER BY c.nombre, UnidadesVendidas DESC;
GO