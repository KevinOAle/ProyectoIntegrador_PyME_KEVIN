/* ============================================================
   CRUD - Ejemplos de operaciones básicas
   ============================================================ */

USE BaseDeDatos_PyME;
GO

-- 1. CREATE (INSERT): Agregar un nuevo producto
IF NOT EXISTS (SELECT 1 FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Pendrive 64GB')
BEGIN
    INSERT INTO PRODUCTOS_SERVICIOS (id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo)
    SELECT
        (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Electrónica'),
        (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 21%'),
        'Pendrive 64GB',
        'USB 3.0, color negro',
        3500.00,
        50,
        1;
    PRINT 'Producto agregado.';
END;
GO

-- 2. READ (SELECT): Ver el producto recién agregado
SELECT * FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Pendrive 64GB';
GO

-- 3. UPDATE: Actualizar el stock de un producto
UPDATE PRODUCTOS_SERVICIOS
SET stock_actual = 45
WHERE nombre = 'Pendrive 64GB';
PRINT 'Stock actualizado.';
GO

-- 4. DELETE (lógico): Desactivar un producto (no se borra, se inactiva)
UPDATE PRODUCTOS_SERVICIOS
SET activo = 0
WHERE nombre = 'Pendrive 64GB';
PRINT 'Producto desactivado.';
GO