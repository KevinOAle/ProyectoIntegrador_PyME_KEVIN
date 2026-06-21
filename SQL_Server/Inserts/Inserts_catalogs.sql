/* ============================================================
   DATOS DE PRUEBA - TABLAS CATÁLOGO
   Proyecto: Gestión de Ventas y Facturación PyME
   ============================================================ */

USE BaseDeDatos_PyME;
GO

SET NOCOUNT ON;
GO

/* ------------------------------------------------------------
   TIPOS_CLIENTE (condición fiscal)
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM TIPOS_CLIENTE WHERE tipo ='Consumidor Final')
BEGIN
INSERT INTO dbo.TIPOS_CLIENTE (tipo, descripcion)
VALUES ('Consumidor Final', 'Persona física que no emite factura')
END;

IF NOT EXISTS (SELECT 1 FROM TIPOS_CLIENTE WHERE tipo ='Responsabre Inscripto')
BEGIN
INSERT INTO dbo.TIPOS_CLIENTE (tipo, descripcion)
VALUES ('Responsable Inscripto', 'Empresa o persona inscripta en AFIP')
END;

IF NOT EXISTS (SELECT 1 FROM TIPOS_CLIENTE WHERE tipo ='Monotributista')
BEGIN
INSERT INTO dbo.TIPOS_CLIENTE (tipo, descripcion)
VALUES ('Monotributista', 'Pequeño contribuyente')
END;

IF NOT EXISTS (SELECT 1 FROM TIPOS_CLIENTE WHERE tipo ='Exento')
BEGIN
INSERT INTO dbo.TIPOS_CLIENTE (tipo, descripcion)
VALUES ('Exento', 'Exento de IVA (ej: ciertas actividades)')
END;
GO

/* ------------------------------------------------------------
   TIPOS_DOCUMENTO
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM TIPOS_DOCUMENTO WHERE tipo = 'DNI')
BEGIN
INSERT INTO dbo.TIPOS_DOCUMENTO (tipo, descripcion)
VALUES ('DNI', 'Documento Nacional de Identidad (persona física)')
END;

IF NOT EXISTS (SELECT 1 FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIT')
BEGIN
INSERT INTO dbo.TIPOS_DOCUMENTO (tipo, descripcion)
VALUES ('CUIT', 'Clave Única de Identificación Tributaria (empresas y monotributistas)')
END;

IF NOT EXISTS (SELECT 1 FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL')
BEGIN
INSERT INTO dbo.TIPOS_DOCUMENTO (tipo, descripcion)
VALUES ('CUIL', 'Clave Única de Identificación Laboral (personas físicas)')
END;

IF NOT EXISTS (SELECT 1 FROM TIPOS_DOCUMENTO WHERE tipo = 'Pasaporte')
BEGIN
INSERT INTO dbo.TIPOS_DOCUMENTO (tipo, descripcion)
VALUES ('Pasaporte', 'Pasaporte extranjero')
END;
GO

/* ------------------------------------------------------------
   ROLES (seguridad)
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM ROLES WHERE rol = 'Administrador')
BEGIN
INSERT INTO dbo.ROLES (rol, descripcion)
VALUES ('Administrador', 'Acceso total al sistema')
END;

IF NOT EXISTS (SELECT 1 FROM ROLES WHERE rol = 'Vendedor')
BEGIN
INSERT INTO dbo.ROLES (rol, descripcion)
VALUES ('Vendedor', 'Puede generar facturas y ver clientes')
END;

IF NOT EXISTS (SELECT 1 FROM ROLES WHERE rol = 'Auditor')
BEGIN
INSERT INTO dbo.ROLES (rol, descripcion)
VALUES ('Auditor', 'Puede ver reportes pero no modificar')
END;
GO

/* ------------------------------------------------------------
   ESTADOS_USUARIOS
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM ESTADOS_USUARIOS WHERE estado = '')
BEGIN
INSERT INTO dbo.ESTADOS_USUARIOS (estado, descripcion)
VALUES ('Activo', 'Usuario habilitado')
END;

IF NOT EXISTS (SELECT 1 FROM ESTADOS_USUARIOS WHERE estado = '')
BEGIN
INSERT INTO dbo.ESTADOS_USUARIOS (estado, descripcion)
VALUES ('Bloqueado', 'Usuario bloqueado temporalmente')
END;

IF NOT EXISTS (SELECT 1 FROM ESTADOS_USUARIOS WHERE estado = '')
BEGIN
INSERT INTO dbo.ESTADOS_USUARIOS (estado, descripcion)
VALUES ('Inactivo', 'Usuario dado de baja')
END;
GO

/* ------------------------------------------------------------
   ESTADOS_CLIENTES
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM ESTADOS_CLIENTES WHERE estado = '')
BEGIN
INSERT INTO dbo.ESTADOS_CLIENTES (estado, descripcion)
VALUES ('Activo', 'Cliente habilitado para comprar')
END;

IF NOT EXISTS (SELECT 1 FROM ESTADOS_CLIENTES WHERE estado = '')
BEGIN
INSERT INTO dbo.ESTADOS_CLIENTES (estado, descripcion)
VALUES ('Moroso', 'Tiene deudas pendientes')
END;

IF NOT EXISTS (SELECT 1 FROM ESTADOS_CLIENTES WHERE estado = '')
BEGIN
INSERT INTO dbo.ESTADOS_CLIENTES (estado, descripcion)
VALUES ('Inactivo', 'Cliente dado de baja')
END;
GO

/* ------------------------------------------------------------
   FORMAS_PAGO
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM FORMAS_PAGO WHERE forma_pago = 'Efectivo')
BEGIN
INSERT INTO dbo.FORMAS_PAGO (forma_pago, descripcion, activo)
VALUES ('Efectivo', 'Pago en efectivo', 1)
END;

IF NOT EXISTS (SELECT 1 FROM FORMAS_PAGO WHERE forma_pago = 'Tarjeta Crédito')
BEGIN
INSERT INTO dbo.FORMAS_PAGO (forma_pago, descripcion, activo)
VALUES ('Tarjeta Crédito', 'Visa, Mastercard, etc.', 1)
END;

IF NOT EXISTS (SELECT 1 FROM FORMAS_PAGO WHERE forma_pago = 'Tarjeta Débito')
BEGIN
INSERT INTO dbo.FORMAS_PAGO (forma_pago, descripcion, activo)
VALUES ('Tarjeta Débito', 'Maestro, Visa Débito', 1)
END;

IF NOT EXISTS (SELECT 1 FROM FORMAS_PAGO WHERE forma_pago = 'Transferencia')
BEGIN
INSERT INTO dbo.FORMAS_PAGO (forma_pago, descripcion, activo)
VALUES ('Transferencia', 'Transferencia bancaria', 1)
END;

IF NOT EXISTS (SELECT 1 FROM FORMAS_PAGO WHERE forma_pago = 'Mercado Pago')
BEGIN
INSERT INTO dbo.FORMAS_PAGO (forma_pago, descripcion, activo)
VALUES ('Mercado Pago', 'Billetera virtual', 1)
END;
GO

/* ------------------------------------------------------------
   ESTADOS_FACTURA
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM ESTADOS_FACTURA WHERE estado = 'Emitida')
BEGIN
INSERT INTO dbo.ESTADOS_FACTURA (estado, descripcion)
VALUES ('Emitida', 'Factura generada pero aún no pagada')
END;

IF NOT EXISTS (SELECT 1 FROM ESTADOS_FACTURA WHERE estado = 'Pagada')
BEGIN
INSERT INTO dbo.ESTADOS_FACTURA (estado, descripcion)
VALUES ('Pagada', 'Factura pagada totalmente')
END;

IF NOT EXISTS (SELECT 1 FROM ESTADOS_FACTURA WHERE estado = 'Anulada')
BEGIN
INSERT INTO dbo.ESTADOS_FACTURA (estado, descripcion)
VALUES ('Anulada', 'Factura anulada (no tiene efecto)')
END;
GO

/* ------------------------------------------------------------
   TIPOS_FACTURA (tipo fiscal)
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM TIPOS_FACTURA WHERE tipo = 'Factura A')
BEGIN
INSERT INTO dbo.TIPOS_FACTURA (tipo, descripcion)
VALUES ('Factura A', 'Para responsable inscripto')
END;

IF NOT EXISTS (SELECT 1 FROM TIPOS_FACTURA WHERE tipo = 'Factura B')
BEGIN
INSERT INTO dbo.TIPOS_FACTURA (tipo, descripcion)
VALUES ('Factura B', 'Para consumidor final')
END;

IF NOT EXISTS (SELECT 1 FROM TIPOS_FACTURA WHERE tipo = 'Factura C')
BEGIN
INSERT INTO dbo.TIPOS_FACTURA (tipo, descripcion)
VALUES ('Factura C', 'Para monotributista')
END;
GO

/* ------------------------------------------------------------
   TIPOS_OPERACION_FACTURA
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM TIPOS_OPERACION_FACTURA WHERE operacion = 'Venta')
BEGIN
INSERT INTO dbo.TIPOS_OPERACION_FACTURA (operacion, descripcion)
VALUES ('Venta', 'Factura de venta normal')
END;

IF NOT EXISTS (SELECT 1 FROM TIPOS_OPERACION_FACTURA WHERE operacion = 'Nota de Credito')
BEGIN
INSERT INTO dbo.TIPOS_OPERACION_FACTURA (operacion, descripcion)
VALUES ('Nota de Crédito', 'Devolución o anulación de venta')
END;
GO

/* ------------------------------------------------------------
   CATEGORIAS_PRODUCTO
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Electrónica')
BEGIN
INSERT INTO dbo.CATEGORIAS_PRODUCTO (nombre, descripcion, activo)
VALUES ('Electrónica', 'Computadoras, celulares, etc.', 1)
END;

IF NOT EXISTS (SELECT 1 FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Indumentaria')
BEGIN
INSERT INTO dbo.CATEGORIAS_PRODUCTO (nombre, descripcion, activo)
VALUES ('Indumentaria', 'Ropa y accesorios', 1)
END;

IF NOT EXISTS (SELECT 1 FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Alimentos')
BEGIN
INSERT INTO dbo.CATEGORIAS_PRODUCTO (nombre, descripcion, activo)
VALUES ('Alimentos', 'Productos alimenticios', 1)
END;

IF NOT EXISTS (SELECT 1 FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Hogar')
BEGIN
INSERT INTO dbo.CATEGORIAS_PRODUCTO (nombre, descripcion, activo)
VALUES ('Hogar', 'Muebles, decoración', 1)
END;
GO

/* ------------------------------------------------------------
   IMPUESTOS
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM IMPUESTOS WHERE impuesto = 'IVA 21%')
BEGIN
INSERT INTO dbo.IMPUESTOS (impuesto, porcentaje, descripcion, activo)
VALUES ('IVA 21%', 21.00, 'Impuesto al valor agregado general', 1)
END;

IF NOT EXISTS (SELECT 1 FROM IMPUESTOS WHERE impuesto = 'IVA 10.5%')
BEGIN
INSERT INTO dbo.IMPUESTOS (impuesto, porcentaje, descripcion, activo)
VALUES ('IVA 10.5%', 10.50, 'IVA reducido para ciertos productos (ej: alimentos)', 1)
END;

IF NOT EXISTS (SELECT 1 FROM IMPUESTOS WHERE impuesto = 'IVA 0%')
BEGIN
INSERT INTO dbo.IMPUESTOS (impuesto, porcentaje, descripcion, activo)
VALUES ('IVA 0%', 0.00, 'Exento (ej: exportaciones)', 1)
END;
GO


/* ============================================================
   INSERTS DE DATOS
   Provincias, Localidades, Clientes y Usuarios
   ============================================================ */

USE BaseDeDatos_PyME;
GO

SET NOCOUNT ON;
GO

/* ------------------------------------------------------------
   1. PROVINCIAS
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM PROVINCIAS WHERE nombre = 'Buenos Aires')
BEGIN
INSERT INTO PROVINCIAS (nombre) VALUES ('Buenos Aires')
END;

IF NOT EXISTS (SELECT 1 FROM PROVINCIAS WHERE nombre = 'Córdoba')
BEGIN
INSERT INTO PROVINCIAS (nombre) VALUES ('Córdoba')
END;

IF NOT EXISTS (SELECT 1 FROM PROVINCIAS WHERE nombre = 'Santa Fe')
BEGIN
INSERT INTO PROVINCIAS (nombre) VALUES ('Santa Fe')
END;

IF NOT EXISTS (SELECT 1 FROM PROVINCIAS WHERE nombre = 'Mendoza')
BEGIN
INSERT INTO PROVINCIAS (nombre) VALUES ('Mendoza')
END;

IF NOT EXISTS (SELECT 1 FROM PROVINCIAS WHERE nombre = 'Tucumán')
BEGIN
INSERT INTO PROVINCIAS (nombre) VALUES ('Tucumán')
END;

GO

/* ------------------------------------------------------------
   2. LOCALIDADES
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM LOCALIDADES WHERE nombre = 'CABA')
BEGIN
INSERT INTO LOCALIDADES (id_provincia, nombre, codigo_postal)
VALUES ((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Buenos Aires'), 'CABA', '1000')
END;

IF NOT EXISTS (SELECT 1 FROM LOCALIDADES WHERE nombre = 'La Plata')
BEGIN
INSERT INTO LOCALIDADES (id_provincia, nombre, codigo_postal)
VALUES ((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Buenos Aires'), 'La Plata', '1900')
END;

IF NOT EXISTS (SELECT 1 FROM LOCALIDADES WHERE nombre = 'Mar del Plata')
BEGIN
INSERT INTO LOCALIDADES (id_provincia, nombre, codigo_postal)
VALUES ((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Buenos Aires'), 'Mar del Plata', '7600')
END;

IF NOT EXISTS (SELECT 1 FROM LOCALIDADES WHERE nombre = 'Córdoba Capital')
BEGIN
INSERT INTO LOCALIDADES (id_provincia, nombre, codigo_postal)
VALUES ((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Córdoba'), 'Córdoba Capital', '5000')
END;

IF NOT EXISTS (SELECT 1 FROM LOCALIDADES WHERE nombre = 'Villa Carlos Paz')
BEGIN
INSERT INTO LOCALIDADES (id_provincia, nombre, codigo_postal)
VALUES ((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Córdoba'), 'Villa Carlos Paz', '5152')
END;

IF NOT EXISTS (SELECT 1 FROM LOCALIDADES WHERE nombre = 'Rosario')
BEGIN
INSERT INTO LOCALIDADES (id_provincia, nombre, codigo_postal)
VALUES ((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Santa Fe'), 'Rosario', '2000')
END;

IF NOT EXISTS (SELECT 1 FROM LOCALIDADES WHERE nombre = 'Santa Fe Capital')
BEGIN
INSERT INTO LOCALIDADES (id_provincia, nombre, codigo_postal)
VALUES ((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Santa Fe'), 'Santa Fe Capital', '3000')
END;

IF NOT EXISTS (SELECT 1 FROM LOCALIDADES WHERE nombre = 'Mendoza Capital')
BEGIN
INSERT INTO LOCALIDADES (id_provincia, nombre, codigo_postal)
VALUES ((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Mendoza'), 'Mendoza Capital', '5500')
END;

IF NOT EXISTS (SELECT 1 FROM LOCALIDADES WHERE nombre = 'San Rafael')
BEGIN
INSERT INTO LOCALIDADES (id_provincia, nombre, codigo_postal)
VALUES ((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Mendoza'), 'San Rafael', '5600')
END;

IF NOT EXISTS (SELECT 1 FROM LOCALIDADES WHERE nombre = 'San Miguel de Tucumán')
BEGIN
INSERT INTO LOCALIDADES (id_provincia, nombre, codigo_postal)
VALUES ((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Tucumán'), 'San Miguel de Tucumán', '4000');
END;

GO

/* ------------------------------------------------------------
   3. CLIENTES PERSONAS FISICAS
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
   4. CLIENTES PERSONAS JURÍDICAS (empresas)
   ------------------------------------------------------------ */

/*EMPRESA 1*/
IF NOT EXISTS (SELECT 1 FROM USUARIOS WHERE nombre_usuario = '30123456789')
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
IF NOT EXISTS (SELECT 1 FROM USUARIOS WHERE nombre_usuario = '30234567890')
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
IF NOT EXISTS (SELECT 1 FROM USUARIOS WHERE nombre_usuario = '30345678901')
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
IF NOT EXISTS (SELECT 1 FROM USUARIOS WHERE nombre_usuario = '30456789012')
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
   5. USUARIOS (operadores del sistema)
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

IF NOT EXISTS (SELECT 1 FROM USUARIOS WHERE nombre_usuario = 'vandedor1')
BEGIN
INSERT INTO USUARIOS (
    id_rol, id_estado_usuario, nombre_usuario, clave_hash, nombre_completo, email
)
SELECT
    (SELECT id_rol FROM ROLES WHERE rol = 'Vendedor'),
    (SELECT id_estado_usuario FROM ESTADOS_USUARIOS WHERE estado = 'Activo'),
    'vendedor1', 'vendedor123', 'Carlos Vendedor', 'carlos.vendedor@gmail.com';
END;

IF NOT EXISTS (SELECT 1 FROM USUARIOS WHERE nombre_usuario = 'vandedor2')
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
   6. PRODUCTOS
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

/* ------------------------------------------------------------
   confirmación
   ------------------------------------------------------------ */
PRINT 'Datos de provincias, localidades, clientes, productos y usuarios insertados correctamente.';
GO