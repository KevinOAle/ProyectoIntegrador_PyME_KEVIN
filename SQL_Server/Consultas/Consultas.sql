USE BaseDeDatos_PyME;
GO
-- 1. Total facturado en un mes (Facturas pagadas)
SELECT SUM(total) AS TotalFacturado
FROM FACTURAS
WHERE YEAR(fecha_emision) = 2025 AND MONTH(fecha_emision) = 5
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