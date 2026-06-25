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
IF NOT EXISTS (SELECT 1 FROM ESTADOS_USUARIOS WHERE estado = 'Activo')
BEGIN
INSERT INTO dbo.ESTADOS_USUARIOS (estado, descripcion)
VALUES ('Activo', 'Usuario habilitado')
END;

IF NOT EXISTS (SELECT 1 FROM ESTADOS_USUARIOS WHERE estado = 'Bloqueado')
BEGIN
INSERT INTO dbo.ESTADOS_USUARIOS (estado, descripcion)
VALUES ('Bloqueado', 'Usuario bloqueado temporalmente')
END;

IF NOT EXISTS (SELECT 1 FROM ESTADOS_USUARIOS WHERE estado = 'Inactivo')
BEGIN
INSERT INTO dbo.ESTADOS_USUARIOS (estado, descripcion)
VALUES ('Inactivo', 'Usuario dado de baja')
END;
GO

/* ------------------------------------------------------------
   ESTADOS_CLIENTES
   ------------------------------------------------------------ */
IF NOT EXISTS (SELECT 1 FROM ESTADOS_CLIENTES WHERE estado = 'Activo')
BEGIN
INSERT INTO dbo.ESTADOS_CLIENTES (estado, descripcion)
VALUES ('Activo', 'Cliente habilitado para comprar')
END;

IF NOT EXISTS (SELECT 1 FROM ESTADOS_CLIENTES WHERE estado = 'Moroso')
BEGIN
INSERT INTO dbo.ESTADOS_CLIENTES (estado, descripcion)
VALUES ('Moroso', 'Tiene deudas pendientes')
END;

IF NOT EXISTS (SELECT 1 FROM ESTADOS_CLIENTES WHERE estado = 'Inactivo')
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
   confirmación
   ------------------------------------------------------------ */
PRINT 'Datos de provincias, localidades insertados correctamente.';
GO