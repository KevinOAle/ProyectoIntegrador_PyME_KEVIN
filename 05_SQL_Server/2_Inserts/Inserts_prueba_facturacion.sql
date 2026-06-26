/* ============================================================
   INSERTS DE PRUEBA - FACTURACIONES
   Proyecto: Gestión de Ventas y Facturación PyME
   Contiene: Clientes, Usuarios, Productos y Facturas de prueba
   ============================================================ */

USE BaseDeDatos_PyME;
GO

SET NOCOUNT ON;
GO

/* ------------------------------------------------------------
   1. CLIENTES PERSONAS FISICAS
   ------------------------------------------------------------ */

/*PERSONA 1*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '20345678901')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'CABA'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIT'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20345678901', 'Carlos', 'Gómez', 'Av. Rivadavia 1234', '1122334455', 'carlos@mail.com';
END;

/*PERSONA 2*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '20456789012')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'La Plata'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'DNI'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20456789012', 'Ana', 'Martínez', 'Calle 12 N° 345', '2212345678', 'ana@mail.com';
END;

/*PERSONA 3*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '20567890123')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Rosario'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIT'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20567890123', 'Luis', 'Fernández', 'Av. Pellegrini 567', '3412345678', 'luis@mail.com';
END;

/*PERSONA 4*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '20678901234')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Córdoba Capital'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIT'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20678901234', 'María', 'López', 'Av. Vélez Sarsfield 890', '3512345678', 'maria@mail.com';
END;

/*PERSONA 5*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '20789012345')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Mendoza Capital'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'Pasaporte'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20789012345', 'Juan', 'Pérez', 'Av. San Martín 456', '2612345678', 'juan@mail.com';
END;

/*PERSONA 6*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '20890123456')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'San Miguel de Tucumán'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIT'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20890123456', 'Gabriel', 'Vergara', 'Av. Aleman 123', '3812345678', 'vergaragabriel699@mail.com';
END;

/*PERSONA 7*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '20901234567')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Mar del Plata'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'DNI'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20901234567', 'Javier', 'Rodríguez', 'Av. Constitución 789', '2232345678', 'javier@mail.com';
END;

/*PERSONA 8*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '20912345678')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Santa Fe Capital'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'DNI'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20912345678', 'Sofía', 'González', 'Av. General López 234', '3422345678', 'sofia@mail.com';
END;
GO

/* ------------------------------------------------------------
   2. CLIENTES PERSONAS JURÍDICAS (empresas)
   ------------------------------------------------------------ */

/*EMPRESA 1*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '30123456789')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, razon_social, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'CABA'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Responsable Inscripto'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIT'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'J', '30123456789', 'Distribuidora del Centro SRL', 'Av. Corrientes 3456', '1123456789', 'distribuidoracentro@gmail.com';
END;

/*EMPRESA 2*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '30234567890')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, razon_social, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Rosario'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Responsable Inscripto'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIT'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'J', '30234567890', 'Almacén Norte SRL', 'Av. Ovidio Lagos 1234', '3412345678', 'almacennorte@gmail.com';
END;

/*EMPRESA 3*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '30345678901')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, razon_social, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Córdoba Capital'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Responsable Inscripto'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIT'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'J', '30345678901', 'Tecno Sur SA', 'Av. Colón 567', '3512345678', 'tecnosur@gmail.com';
END;

/*EMPRESA 4*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '30456789012')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, razon_social, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Mendoza Capital'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Responsable Inscripto'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIT'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'J', '30456789012', 'Distribuidora Oeste SRL', 'Av. Godoy Cruz 890', '2612345678', 'distribuidoraoeste@gmail.com';
END;

/*EMPRESA 5*/
IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE numero_documento = '30567890123')
BEGIN
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, razon_social, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'San Miguel de Tucumán'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Responsable Inscripto'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIT'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'J', '30567890123', 'Norte Grande SRL', 'Av. Sarmiento 345', '3812345678', 'nortegrande@gmail.com';
END;
GO

/* ------------------------------------------------------------
   3. USUARIOS (operadores del sistema)
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM USUARIOS WHERE nombre_usuario = 'admin')
BEGIN
INSERT INTO USUARIOS (
    id_rol, id_estado_usuario, nombre_usuario, clave_hash, nombre_completo, email
)
SELECT
    (SELECT id_rol FROM ROLES WHERE rol = 'Administrador'),
    (SELECT id_estado_usuario FROM ESTADOS_USUARIOS WHERE estado = 'Activo'),
    'admin', 'admin123', 'Administrador del Sistema', 'admin@gmail.com';
END;

IF NOT EXISTS (SELECT 1 FROM USUARIOS WHERE nombre_usuario = 'vendedor1')
BEGIN
INSERT INTO USUARIOS (
    id_rol, id_estado_usuario, nombre_usuario, clave_hash, nombre_completo, email
)
SELECT
    (SELECT id_rol FROM ROLES WHERE rol = 'Vendedor'),
    (SELECT id_estado_usuario FROM ESTADOS_USUARIOS WHERE estado = 'Activo'),
    'vendedor1', 'vendedor123', 'Carlos Vendedor', 'carlos.vendedor@gmail.com';
END;

IF NOT EXISTS (SELECT 1 FROM USUARIOS WHERE nombre_usuario = 'vendedor2')
BEGIN
INSERT INTO USUARIOS (
    id_rol, id_estado_usuario, nombre_usuario, clave_hash, nombre_completo, email
)
SELECT
    (SELECT id_rol FROM ROLES WHERE rol = 'Vendedor'),
    (SELECT id_estado_usuario FROM ESTADOS_USUARIOS WHERE estado = 'Activo'),
    'vendedor2', 'vendedor456', 'Ana Vendedora', 'ana.vendedora@gmail.com';
END;
GO

/* ------------------------------------------------------------
   4. PRODUCTOS
   ------------------------------------------------------------ */

/* ------------------------------------------------------------
   PRODUCTO 1: Electrónica - Mouse Inalámbrico
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Mouse Inalámbrico')
BEGIN
INSERT INTO PRODUCTOS_SERVICIOS (
    id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo
)
SELECT
    (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Electrónica'),
    (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 21%'),
    'Mouse Inalámbrico',
    'Mouse óptico, conexión USB, color negro',
    5500.00, 100, 1;
END;
/* ------------------------------------------------------------
   PRODUCTO 2: Electrónica - Teclado Mecánico
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Teclado Mecanico')
BEGIN
INSERT INTO PRODUCTOS_SERVICIOS (
    id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo
)
SELECT
    (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Electrónica'),
    (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 21%'),
    'Teclado Mecánico',
    'Teclado mecánico RGB, switches azules',
    12500.00, 50, 1;
END;
/* ------------------------------------------------------------
   PRODUCTO 3: Electrónica - Auriculares Bluetooth
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Auriculares Bluetooth')
BEGIN
INSERT INTO PRODUCTOS_SERVICIOS (
    id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo
)
SELECT
    (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Electrónica'),
    (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 21%'),
    'Auriculares Bluetooth',
    'Auriculares inalámbricos, batería 20h, color blanco',
    8900.00, 30, 1;
END

/* ------------------------------------------------------------
   PRODUCTO 4: Indumentaria - Remera Deportiva
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Remera Deportiva')
BEGIN
INSERT INTO PRODUCTOS_SERVICIOS (
    id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo
)
SELECT
    (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Indumentaria'),
    (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 21%'),
    'Remera Deportiva',
    'Remera de algodón, talla M, color blanco',
    3200.00, 200, 1;
END;
/* ------------------------------------------------------------
   PRODUCTO 5: Indumentaria - Pantalón de Vestir
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Pantalon de Vestir')
BEGIN
INSERT INTO PRODUCTOS_SERVICIOS (
    id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo
)
SELECT
    (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Indumentaria'),
    (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 21%'),
    'Pantalón de Vestir',
    'Pantalón formal, color gris, talle 42',
    5800.00, 80, 1;
END;
/* ------------------------------------------------------------
   PRODUCTO 6: Alimentos - Caja de Chocolates
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Caja de Chocolates')
BEGIN
INSERT INTO PRODUCTOS_SERVICIOS (
    id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo
)
SELECT
    (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Alimentos'),
    (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 10.5%'),
    'Caja de Chocolates',
    'Chocolates surtidos, 500g',
    4500.00, 80, 1;
END;
/* ------------------------------------------------------------
   PRODUCTO 7: Alimentos - Café Premium 1kg
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Café Premium 1kg')
BEGIN
INSERT INTO PRODUCTOS_SERVICIOS (
    id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo
)
SELECT
    (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Alimentos'),
    (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 10.5%'),
    'Café Premium 1kg',
    'Café molido, origen colombiano, tueste medio',
    6200.00, 40, 1;
END;
/* ------------------------------------------------------------
   PRODUCTO 8: Hogar - Lámpara de Mesa
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Lámpara de mesa')
BEGIN
INSERT INTO PRODUCTOS_SERVICIOS (
    id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo
)
SELECT
    (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Hogar'),
    (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 21%'),
    'Lámpara de Mesa',
    'Lámpara LED, diseño moderno, color negro mate',
    8900.00, 30, 1;
END;
/* ------------------------------------------------------------
   PRODUCTO 9: Hogar - Cuadro Decorativo
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Cuadro Decorativo')
BEGIN
INSERT INTO PRODUCTOS_SERVICIOS (
    id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo
)
SELECT
    (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Hogar'),
    (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 21%'),
    'Cuadro Decorativo',
    'Cuadro abstracto, marco de madera, 50x70cm',
    5200.00, 20, 1;
END;
/* ------------------------------------------------------------
   PRODUCTO 10: Indumentaria - Mochila
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM PRODUCTOS_SERVICIOS WHERE nombre = 'Mochila Ejecutiva')
BEGIN
INSERT INTO PRODUCTOS_SERVICIOS (
    id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo
)
SELECT
    (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Indumentaria'),
    (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 21%'),
    'Mochila Ejecutiva',
    'Mochila para notebook, cuero sintético, color negro',
    11200.00, 25, 1;
END;
GO

/* ============================================================
   INSERTS DE FACTURAS (versión compacta)
   ============================================================ */

-- FACTURA 1: Carlos, Efectivo, Mouse + Remera (Pagada)
INSERT INTO FACTURAS (
    id_cliente, id_usuario, id_estado_factura, id_tipo_factura, id_tipo_operacion_factura,
    numero_factura, fecha_emision, total_neto, total_impuestos, total_descuentos, total_recargos, total,
    observaciones
)
VALUES (
    1, 1, 2, 2, 1, 'F2025-0001', '2025-01-15 10:30:00', 8700.00, 1827.00, 0, 0, 10527.00,
    'Venta de mouse y remera'
);

INSERT INTO DETALLES_FACTURA (
    id_factura, id_producto_servicio, cantidad, precio_unitario_facturado,
    subtotal_neto, porcentaje_impuesto_facturado, importe_impuesto, subtotal_con_impuesto
)
VALUES
    (1, 1, 1, 5500.00, 5500.00, 21.00, 1155.00, 6655.00),
    (1, 4, 2, 3200.00, 6400.00, 21.00, 1344.00, 7744.00);

INSERT INTO COMPROBANTES_PAGO (id_factura, id_forma_pago, fecha_pago, monto, numero_referencia, observaciones)
VALUES (1, 1, '2025-01-20 10:35:00', 10527.00, 'PAG-001', 'Pago en efectivo');

-- FACTURA 2: Distribuidora del Centro, Tarjeta Crédito, Teclado (Pagada)
INSERT INTO FACTURAS (
    id_cliente, id_usuario, id_estado_factura, id_tipo_factura, id_tipo_operacion_factura,
    numero_factura, fecha_emision, total_neto, total_impuestos, total_descuentos, total_recargos, total,
    observaciones
)
VALUES (
    9, 1, 2, 1, 1, 'F2025-0002', '2025-02-05 14:20:00', 12500.00, 2625.00, 0, 0, 15125.00,
    'Venta de teclado mecánico'
);

INSERT INTO DETALLES_FACTURA (
    id_factura, id_producto_servicio, cantidad, precio_unitario_facturado,
    subtotal_neto, porcentaje_impuesto_facturado, importe_impuesto, subtotal_con_impuesto
)
VALUES (2, 2, 1, 12500.00, 12500.00, 21.00, 2625.00, 15125.00);

INSERT INTO COMPROBANTES_PAGO (id_factura, id_forma_pago, fecha_pago, monto, numero_referencia, observaciones)
VALUES (2, 2, '2025-02-12 14:25:00', 15125.00, 'TC-123456789', 'Pago con Visa');

-- FACTURA 3: Ana, Transferencia, Chocolates + Lámpara (Emitida, sin pago)
INSERT INTO FACTURAS (
    id_cliente, id_usuario, id_estado_factura, id_tipo_factura, id_tipo_operacion_factura,
    numero_factura, fecha_emision, total_neto, total_impuestos, total_descuentos, total_recargos, total,
    observaciones
)
VALUES (
    2, 1, 1, 2, 1, 'F2025-0003', '2025-02-20 09:45:00', 13400.00, 2511.00, 0, 0, 15911.00,
    'Venta de chocolates y lámpara'
);

INSERT INTO DETALLES_FACTURA (
    id_factura, id_producto_servicio, cantidad, precio_unitario_facturado,
    subtotal_neto, porcentaje_impuesto_facturado, importe_impuesto, subtotal_con_impuesto
)
VALUES
    (3, 6, 2, 4500.00, 9000.00, 10.50, 945.00, 9945.00),
    (3, 8, 1, 8900.00, 8900.00, 21.00, 1869.00, 10769.00);

-- (Factura 3 no tiene comprobante de pago, porque está 'Emitida')

-- FACTURA 4: Almacén Norte, Tarjeta Débito, Mouse + Teclado + Lámpara (Pagada)
INSERT INTO FACTURAS (
    id_cliente, id_usuario, id_estado_factura, id_tipo_factura, id_tipo_operacion_factura,
    numero_factura, fecha_emision, total_neto, total_impuestos, total_descuentos, total_recargos, total,
    observaciones
)
VALUES (
    10, 1, 2, 1, 1, 'F2025-0004', '2025-03-10 11:00:00', 26900.00, 5649.00, 0, 0, 32549.00,
    'Compra mayorista de varios productos'
);

INSERT INTO DETALLES_FACTURA (
    id_factura, id_producto_servicio, cantidad, precio_unitario_facturado,
    subtotal_neto, porcentaje_impuesto_facturado, importe_impuesto, subtotal_con_impuesto
)
VALUES
    (4, 1, 2, 5500.00, 11000.00, 21.00, 2310.00, 13310.00),
    (4, 2, 1, 12500.00, 12500.00, 21.00, 2625.00, 15125.00),
    (4, 8, 1, 8900.00, 8900.00, 21.00, 1869.00, 10769.00);

INSERT INTO COMPROBANTES_PAGO (id_factura, id_forma_pago, fecha_pago, monto, numero_referencia, observaciones)
VALUES (4, 3, '2025-03-25 11:10:00', 32549.00, 'TD-987654321', 'Pago con Maestro');

-- FACTURA 5: Luis, Efectivo, Remera (Pagada)
INSERT INTO FACTURAS (
    id_cliente, id_usuario, id_estado_factura, id_tipo_factura, id_tipo_operacion_factura,
    numero_factura, fecha_emision, total_neto, total_impuestos, total_descuentos, total_recargos, total,
    observaciones
)
VALUES (
    3, 1, 2, 2, 1, 'F2025-0005', '2025-03-25 16:30:00', 3200.00, 672.00, 0, 0, 3872.00,
    'Venta de remera deportiva'
);

INSERT INTO DETALLES_FACTURA (
    id_factura, id_producto_servicio, cantidad, precio_unitario_facturado,
    subtotal_neto, porcentaje_impuesto_facturado, importe_impuesto, subtotal_con_impuesto
)
VALUES (5, 4, 1, 3200.00, 3200.00, 21.00, 672.00, 3872.00);

INSERT INTO COMPROBANTES_PAGO (id_factura, id_forma_pago, fecha_pago, monto, numero_referencia, observaciones)
VALUES (5, 1, '2025-03-27 16:35:00', 3872.00, 'PAG-005', 'Pago en efectivo');
