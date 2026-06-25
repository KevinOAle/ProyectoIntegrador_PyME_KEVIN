/* ============================================================
   PROCEDIMIENTO: Insertar una factura con sus detalles
   ============================================================ */

USE BaseDeDatos_PyME;
GO

IF OBJECT_ID(N'dbo.usp_InsertarFactura', N'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_InsertarFactura;
GO

CREATE PROCEDURE dbo.usp_InsertarFactura
    @id_cliente INT,
    @id_usuario INT,
    @id_forma_pago INT,
    @id_tipo_factura INT,
    @id_producto INT,
    @cantidad DECIMAL(12,2),
    @precio_unitario DECIMAL(12,2),
    @observaciones VARCHAR(250) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRANSACTION;
    BEGIN TRY
        DECLARE @id_factura INT;
        DECLARE @subtotal_neto DECIMAL(12,2) = @cantidad * @precio_unitario;
        DECLARE @porcentaje_impuesto DECIMAL(5,2);
        DECLARE @importe_impuesto DECIMAL(12,2);
        DECLARE @total DECIMAL(12,2);
        DECLARE @numero_factura VARCHAR(30);

        -- Generar número de factura secuencial
        SELECT @numero_factura = 'F' + CAST(YEAR(GETDATE()) AS VARCHAR(4)) + '-' +
               RIGHT('000000' + CAST(ISNULL(MAX(id_factura), 0) + 1 AS VARCHAR(6)), 6)
        FROM FACTURAS;

        -- Obtener porcentaje de impuesto del producto
        SELECT @porcentaje_impuesto = i.porcentaje
        FROM PRODUCTOS_SERVICIOS p
        INNER JOIN IMPUESTOS i ON p.id_impuesto = i.id_impuesto
        WHERE p.id_producto_servicio = @id_producto;

        -- Calcular impuesto y total
        SET @importe_impuesto = @subtotal_neto * (@porcentaje_impuesto / 100);
        SET @total = @subtotal_neto + @importe_impuesto;

        -- Insertar cabecera
        INSERT INTO FACTURAS (
            id_cliente, id_usuario, id_estado_factura, id_tipo_factura, id_tipo_operacion_factura,
            numero_factura, fecha_emision,
            total_neto, total_impuestos, total_descuentos, total_recargos, total,
            observaciones
        ) VALUES (
            @id_cliente, @id_usuario, 1, @id_tipo_factura, 1,
            @numero_factura, GETDATE(),
            @subtotal_neto, @importe_impuesto, 0, 0, @total,
            @observaciones
        );

        SET @id_factura = SCOPE_IDENTITY();

        -- Insertar detalle
        INSERT INTO DETALLES_FACTURA (
            id_factura, id_producto_servicio, cantidad, precio_unitario_facturado,
            subtotal_neto, porcentaje_impuesto_facturado, importe_impuesto, subtotal_con_impuesto
        ) VALUES (
            @id_factura, @id_producto, @cantidad, @precio_unitario,
            @subtotal_neto, @porcentaje_impuesto, @importe_impuesto, @total
        );

        -- Insertar comprobante de pago (para que quede registrado)
        INSERT INTO COMPROBANTES_PAGO (id_factura, id_forma_pago, fecha_pago, monto, observaciones)
        VALUES (@id_factura, @id_forma_pago, GETDATE(), @total, 'Pago registrado automáticamente');

        -- Actualizar stock
        UPDATE PRODUCTOS_SERVICIOS
        SET stock_actual = stock_actual - @cantidad
        WHERE id_producto_servicio = @id_producto;

        COMMIT TRANSACTION;
        PRINT 'Factura insertada correctamente. Número: ' + @numero_factura;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

-- Ejemplo de uso:
-- EXEC dbo.usp_InsertarFactura @id_cliente=1, @id_usuario=1, @id_forma_pago=1, @id_tipo_factura=2, @id_producto=3, @cantidad=1, @precio_unitario=8900.00;