-- 1. Total facturado en un mes
SELECT SUM(total) AS TotalFacturado
FROM FACTURAS
WHERE YEAR(fecha_emision) = 2025 AND MONTH(fecha_emision) = 5;

-- 2. Productos más vendidos
SELECT TOP 5 p.nombre, SUM(d.cantidad) AS TotalVendido
FROM DETALLES_FACTURA d
JOIN PRODUCTOS_SERVICIOS p ON d.id_producto_servicio = p.id_producto_servicio
GROUP BY p.nombre
ORDER BY TotalVendido DESC;

-- 3. Clientes con más compras
SELECT TOP 5 c.nombre_razon_social, SUM(f.total) AS TotalGastado
FROM FACTURAS f
JOIN CLIENTES c ON f.id_cliente = c.id_cliente
GROUP BY c.nombre_razon_social
ORDER BY TotalGastado DESC;