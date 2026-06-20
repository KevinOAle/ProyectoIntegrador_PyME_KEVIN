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
INSERT INTO dbo.TIPOS_CLIENTE (tipo, descripcion)
VALUES
('Consumidor Final', 'Persona física que no emite factura'),
('Responsable Inscripto', 'Empresa o persona inscripta en AFIP'),
('Monotributista', 'Pequeño contribuyente'),
('Exento', 'Exento de IVA (ej: ciertas actividades)');
GO

/* ------------------------------------------------------------
   TIPOS_DOCUMENTO
   ------------------------------------------------------------ */
INSERT INTO dbo.TIPOS_DOCUMENTO (tipo, descripcion)
VALUES
('DNI', 'Documento Nacional de Identidad (persona física)'),
('CUIT_CUIL', 'Clave Única de Identificación Laboral (personas físicas y jurídicas)'),
('Pasaporte', 'Pasaporte extranjero');
GO

/* ------------------------------------------------------------
   ROLES (seguridad)
   ------------------------------------------------------------ */
INSERT INTO dbo.ROLES (rol, descripcion)
VALUES
('Administrador', 'Acceso total al sistema'),
('Vendedor', 'Puede generar facturas y ver clientes'),
('Auditor', 'Puede ver reportes pero no modificar');
GO

/* ------------------------------------------------------------
   ESTADOS_USUARIOS
   ------------------------------------------------------------ */
INSERT INTO dbo.ESTADOS_USUARIOS (estado, descripcion)
VALUES
('Activo', 'Usuario habilitado'),
('Bloqueado', 'Usuario bloqueado temporalmente'),
('Inactivo', 'Usuario dado de baja');
GO

/* ------------------------------------------------------------
   ESTADOS_CLIENTES
   ------------------------------------------------------------ */
INSERT INTO dbo.ESTADOS_CLIENTES (estado, descripcion)
VALUES
('Activo', 'Cliente habilitado para comprar'),
('Moroso', 'Tiene deudas pendientes'),
('Inactivo', 'Cliente dado de baja');
GO

/* ------------------------------------------------------------
   FORMAS_PAGO
   ------------------------------------------------------------ */
INSERT INTO dbo.FORMAS_PAGO (forma_pago, descripcion, activo)
VALUES
('Efectivo', 'Pago en efectivo', 1),
('Tarjeta Crédito', 'Visa, Mastercard, etc.', 1),
('Tarjeta Débito', 'Maestro, Visa Débito', 1),
('Transferencia', 'Transferencia bancaria', 1),
('Mercado Pago', 'Billetera virtual', 1);
GO

/* ------------------------------------------------------------
   ESTADOS_FACTURA
   ------------------------------------------------------------ */
INSERT INTO dbo.ESTADOS_FACTURA (estado, descripcion)
VALUES
('Emitida', 'Factura generada pero aún no pagada'),
('Pagada', 'Factura pagada totalmente'),
('Anulada', 'Factura anulada (no tiene efecto)');
GO

/* ------------------------------------------------------------
   TIPOS_FACTURA (tipo fiscal)
   ------------------------------------------------------------ */
INSERT INTO dbo.TIPOS_FACTURA (tipo, descripcion)
VALUES
('Factura A', 'Para responsable inscripto'),
('Factura B', 'Para consumidor final'),
('Factura C', 'Para monotributista');
GO

/* ------------------------------------------------------------
   TIPOS_OPERACION_FACTURA
   ------------------------------------------------------------ */
INSERT INTO dbo.TIPOS_OPERACION_FACTURA (operacion, descripcion)
VALUES
('Venta', 'Factura de venta normal'),
('Nota de Crédito', 'Devolución o anulación de venta');
GO

/* ------------------------------------------------------------
   CATEGORIAS_PRODUCTO
   ------------------------------------------------------------ */
INSERT INTO dbo.CATEGORIAS_PRODUCTO (nombre, descripcion, activo)
VALUES
('Electrónica', 'Computadoras, celulares, etc.', 1),
('Indumentaria', 'Ropa y accesorios', 1),
('Alimentos', 'Productos alimenticios', 1),
('Hogar', 'Muebles, decoración', 1);
GO

/* ------------------------------------------------------------
   IMPUESTOS
   ------------------------------------------------------------ */
INSERT INTO dbo.IMPUESTOS (impuesto, porcentaje, descripcion, activo)
VALUES
('IVA 21%', 21.00, 'Impuesto al valor agregado general', 1),
('IVA 10.5%', 10.50, 'IVA reducido para ciertos productos (ej: alimentos)', 1),
('IVA 0%', 0.00, 'Exento (ej: exportaciones)', 1);
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
INSERT INTO PROVINCIAS (nombre) VALUES
('Buenos Aires'),
('Córdoba'),
('Santa Fe'),
('Mendoza'),
('Tucumán');
GO

/* ------------------------------------------------------------
   2. LOCALIDADES
   ------------------------------------------------------------ */
INSERT INTO LOCALIDADES (id_provincia, nombre, codigo_postal)
VALUES
((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Buenos Aires'), 'CABA', '1000'),
((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Buenos Aires'), 'La Plata', '1900'),
((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Buenos Aires'), 'Mar del Plata', '7600'),
((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Córdoba'), 'Córdoba Capital', '5000'),
((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Córdoba'), 'Villa Carlos Paz', '5152'),
((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Santa Fe'), 'Rosario', '2000'),
((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Santa Fe'), 'Santa Fe Capital', '3000'),
((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Mendoza'), 'Mendoza Capital', '5500'),
((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Mendoza'), 'San Rafael', '5600'),
((SELECT id_provincia FROM PROVINCIAS WHERE nombre = 'Tucumán'), 'San Miguel de Tucumán', '4000');
GO

/* ------------------------------------------------------------
   3. CLIENTES PERSONAS FISICAS
   ------------------------------------------------------------ */

/*PERSONA 1*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'CABA'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20345678901', 'Carlos', 'Gómez', 'Av. Rivadavia 1234', '1122334455', 'carlos@mail.com';

/*PERSONA 2*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'La Plata'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20456789012', 'Ana', 'Martínez', 'Calle 12 N° 345', '2212345678', 'ana@mail.com';

/*PERSONA 3*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Rosario'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20567890123', 'Luis', 'Fernández', 'Av. Pellegrini 567', '3412345678', 'luis@mail.com';

/*PERSONA 4*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Córdoba Capital'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20678901234', 'María', 'López', 'Av. Vélez Sarsfield 890', '3512345678', 'maria@mail.com';

/*PERSONA 5*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Mendoza Capital'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20789012345', 'Juan', 'Pérez', 'Av. San Martín 456', '2612345678', 'juan@mail.com';

/*PERSONA 6*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'San Miguel de Tucumán'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20890123456', 'Gabriel', 'Vergara', 'Av. Aleman 123', '3812345678', 'vergaragabriel699@mail.com';

/*PERSONA 7*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Mar del Plata'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20901234567', 'Javier', 'Rodríguez', 'Av. Constitución 789', '2232345678', 'javier@mail.com';

/*PERSONA 8*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, nombre, apellido, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Santa Fe Capital'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Consumidor Final'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'F', '20912345678', 'Sofía', 'González', 'Av. General López 234', '3422345678', 'sofia@mail.com';
GO

/* ------------------------------------------------------------
   4. CLIENTES PERSONAS JURÍDICAS (empresas)
   ------------------------------------------------------------ */

/*EMPRESA 1*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, razon_social, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'CABA'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Responsable Inscripto'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'J', '30123456789', 'Distribuidora del Centro SRL', 'Av. Corrientes 3456', '1123456789', 'distribuidoracentro@gmail.com';

/*EMPRESA 2*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, razon_social, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Rosario'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Responsable Inscripto'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'J', '30234567890', 'Almacén Norte SRL', 'Av. Ovidio Lagos 1234', '3412345678', 'almacennorte@gmail.com';

/*EMPRESA 3*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, razon_social, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Córdoba Capital'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Responsable Inscripto'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'J', '30345678901', 'Tecno Sur SA', 'Av. Colón 567', '3512345678', 'tecnosur@gmail.com';

/*EMPRESA 4*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, razon_social, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'Mendoza Capital'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Responsable Inscripto'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'J', '30456789012', 'Distribuidora Oeste SRL', 'Av. Godoy Cruz 890', '2612345678', 'distribuidoraoeste@gmail.com';

/*EMPRESA 5*/
INSERT INTO CLIENTES (
    id_localidad, id_tipo_cliente, id_tipo_documento, id_estado_cliente,
    tipo_persona, numero_documento, razon_social, direccion, telefono, email
)
SELECT
    (SELECT TOP 1 id_localidad FROM LOCALIDADES WHERE nombre = 'San Miguel de Tucumán'),
    (SELECT id_tipo_cliente FROM TIPOS_CLIENTE WHERE tipo = 'Responsable Inscripto'),
    (SELECT id_tipo_documento FROM TIPOS_DOCUMENTO WHERE tipo = 'CUIL'),
    (SELECT id_estado_cliente FROM ESTADOS_CLIENTES WHERE estado = 'Activo'),
    'J', '30567890123', 'Norte Grande SRL', 'Av. Sarmiento 345', '3812345678', 'nortegrande@gmail.com';
GO

/* ------------------------------------------------------------
   5. USUARIOS (operadores del sistema)
   ------------------------------------------------------------ */
INSERT INTO USUARIOS (
    id_rol, id_estado_usuario, nombre_usuario, clave_hash, nombre_completo, email
)
SELECT
    (SELECT id_rol FROM ROLES WHERE rol = 'Administrador'),
    (SELECT id_estado_usuario FROM ESTADOS_USUARIOS WHERE estado = 'Activo'),
    'admin', 'admin123', 'Administrador del Sistema', 'admin@gmail.com';

INSERT INTO USUARIOS (
    id_rol, id_estado_usuario, nombre_usuario, clave_hash, nombre_completo, email
)
SELECT
    (SELECT id_rol FROM ROLES WHERE rol = 'Vendedor'),
    (SELECT id_estado_usuario FROM ESTADOS_USUARIOS WHERE estado = 'Activo'),
    'vendedor1', 'vendedor123', 'Carlos Vendedor', 'carlos.vendedor@gmail.com';

INSERT INTO USUARIOS (
    id_rol, id_estado_usuario, nombre_usuario, clave_hash, nombre_completo, email
)
SELECT
    (SELECT id_rol FROM ROLES WHERE rol = 'Vendedor'),
    (SELECT id_estado_usuario FROM ESTADOS_USUARIOS WHERE estado = 'Activo'),
    'vendedor2', 'vendedor456', 'Ana Vendedora', 'ana.vendedora@gmail.com';
GO

/* ------------------------------------------------------------
   6. PRODUCTOS
   ------------------------------------------------------------ */

INSERT INTO PRODUCTOS_SERVICIOS (
    id_categoria, id_impuesto, nombre, descripcion, precio_unitario_actual, stock_actual, activo
)
SELECT
    (SELECT id_categoria FROM CATEGORIAS_PRODUCTO WHERE nombre = 'Electrónica'),
    (SELECT id_impuesto FROM IMPUESTOS WHERE impuesto = 'IVA 21%'),
    'Mouse Inalámbrico',
    'Mouse óptico, conexión USB, color negro',
    5500.00, 100, 1;

GO

/* ------------------------------------------------------------
   confirmación
   ------------------------------------------------------------ */
PRINT 'Datos de provincias, localidades, clientes, productos y usuarios insertados correctamente.';
GO