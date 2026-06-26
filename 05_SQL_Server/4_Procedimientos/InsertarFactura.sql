/* ============================================================
   PROCEDIMIENTO: Insertar una factura con sus detalles
   ============================================================ */

USE BaseDeDatos_PyME;
GO

CREATE PROCEDURE usp_InsertFactura
    @id_cliente INT,
    @id_producto INT,
    @cantidad DECIMAL(12,2),
    @precio DECIMAL(12,2)
AS
BEGIN
    /* ==========================================
       PASO 1: Calcular totales de la venta
       ========================================== */
    DECLARE @subtotal DECIMAL(12,2) = @cantidad * @precio;
    
    DECLARE @porcentaje_iva DECIMAL(5,2);
    SELECT @porcentaje_iva = i.porcentaje
    FROM PRODUCTOS_SERVICIOS p
    INNER JOIN IMPUESTOS i ON p.id_impuesto = i.id_impuesto
    WHERE p.id_producto_servicio = @id_producto;    
    
    DECLARE @iva DECIMAL(12,2) = @subtotal * (@porcentaje_iva / 100);
    DECLARE @total DECIMAL(12,2) = @subtotal + @iva;

    /* ==========================================
       PASO 2: Generar número de factura único
       ========================================== */
    DECLARE @numero VARCHAR(30);
    SELECT @numero = 'F' + CAST(YEAR(GETDATE()) AS VARCHAR(4)) + '-' +
                     RIGHT('0000' + CAST(ISNULL(MAX(id_factura), 0) + 1 AS VARCHAR(4)), 4)
    FROM FACTURAS;   -- Ejemplo: F2025-0006

    /* ==========================================
       PASO 3: Insertar cabecera de factura
       ========================================== */
    INSERT INTO FACTURAS (
        id_cliente, id_usuario, id_estado_factura, id_tipo_factura,
        id_tipo_operacion_factura, numero_factura, fecha_emision,
        total_neto, total_impuestos, total_descuentos, total_recargos, total)
    VALUES (
        @id_cliente, 1, 1, 1, 1,   -- 1 = admin, Emitida, Factura A, Venta
        @numero, GETDATE(),
        @subtotal, @iva, 0, 0, @total);

    /* ==========================================
       PASO 4: Obtener el ID de la factura insertada
       ========================================== */
    DECLARE @id_factura INT = SCOPE_IDENTITY();

    /* ==========================================
       PASO 5: Insertar detalle (productos vendidos)
       ========================================== */
    INSERT INTO DETALLES_FACTURA (
        id_factura, id_producto_servicio, cantidad,
        precio_unitario_facturado, subtotal_neto,
        porcentaje_impuesto_facturado, importe_impuesto, subtotal_con_impuesto)
    VALUES (
        @id_factura, @id_producto, @cantidad,
        @precio, @subtotal,
        21.00, @iva, @total);

    /* ==========================================
       PASO 6: Actualizar stock (restar lo vendido)
       ========================================== */
    UPDATE PRODUCTOS_SERVICIOS
    SET stock_actual = stock_actual - @cantidad
    WHERE id_producto_servicio = @id_producto;

    /* ==========================================
       PASO 7: Mensaje de éxito
       ========================================== */
    PRINT 'Factura generada: ' + @numero;
END;

GO