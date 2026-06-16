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
('CUIT', 'Clave Única de Identificación Tributaria'),
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

/* ------------------------------------------------------------
   USUARIOS (al menos uno para operar)
   ------------------------------------------------------------ */
-- Insertar un administrador por defecto (clave_hash = 'admin123' en un sistema real debería estar encriptado)
INSERT INTO dbo.USUARIOS (id_rol, id_estado_usuario, nombre_usuario, clave_hash, nombre_completo, email)
VALUES
(1, 1, 'admin', 'admin123', 'Administrador del Sistema', 'admin@pyme.com');
GO

PRINT 'Datos de catálogo insertados correctamente.';
GO