/* ============================================================
   SCRIPT COMPLETO - CREACIÓN DE TABLAS
   Proyecto: Gestión de Ventas y Facturación PyME
   Motor: SQL Server
   Base de datos sugerida: BaseDeDatos_PyME
   ============================================================ */

USE BaseDeDatos_PyME;
GO

SET NOCOUNT ON;
GO

/* ============================================================
   1. PROVINCIAS
   ============================================================ */
IF OBJECT_ID(N'dbo.PROVINCIAS', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.PROVINCIAS
    (
        id_provincia INT IDENTITY(1,1) NOT NULL,
        nombre VARCHAR(100) NOT NULL,

        CONSTRAINT PK_PROVINCIAS PRIMARY KEY (id_provincia),
        CONSTRAINT UQ_PROVINCIAS_nombre UNIQUE (nombre),
        CONSTRAINT CK_PROVINCIAS_nombre_no_vacio CHECK (LEN(LTRIM(RTRIM(nombre))) > 0)
    );
    PRINT 'Tabla PROVINCIAS creada.';
END
GO

/* ============================================================
   2. LOCALIDADES
   ============================================================ */
IF OBJECT_ID(N'dbo.LOCALIDADES', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.LOCALIDADES
    (
        id_localidad INT IDENTITY(1,1) NOT NULL,
        id_provincia INT NOT NULL,
        nombre VARCHAR(100) NOT NULL,
        codigo_postal VARCHAR(20) NOT NULL,

        CONSTRAINT PK_LOCALIDADES PRIMARY KEY (id_localidad),
        CONSTRAINT UQ_LOCALIDADES_nombre_cp UNIQUE (nombre, codigo_postal),
        CONSTRAINT FK_LOCALIDADES_PROVINCIAS FOREIGN KEY (id_provincia) REFERENCES dbo.PROVINCIAS(id_provincia),
        CONSTRAINT CK_LOCALIDADES_nombre_no_vacio CHECK (LEN(LTRIM(RTRIM(nombre))) > 0),
        CONSTRAINT CK_LOCALIDADES_codigo_postal_no_vacio CHECK (LEN(LTRIM(RTRIM(codigo_postal))) > 0)
    );
    PRINT 'Tabla LOCALIDADES creada.';
END
GO

/* ============================================================
   3. TIPOS_CLIENTE (fiscal/comercial)
   ============================================================ */
IF OBJECT_ID(N'dbo.TIPOS_CLIENTE', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.TIPOS_CLIENTE
    (
        id_tipo_cliente INT IDENTITY(1,1) NOT NULL,
        tipo VARCHAR(50) NOT NULL,
        descripcion VARCHAR(150) NULL,

        CONSTRAINT PK_TIPOS_CLIENTE PRIMARY KEY (id_tipo_cliente),
        CONSTRAINT UQ_TIPOS_CLIENTE_tipo UNIQUE (tipo),
        CONSTRAINT CK_TIPOS_CLIENTE_tipo_no_vacio CHECK (LEN(LTRIM(RTRIM(tipo))) > 0)
    );
    PRINT 'Tabla TIPOS_CLIENTE creada.';
END
GO

/* ============================================================
   4. TIPOS_DOCUMENTO (identidad)
   ============================================================ */
IF OBJECT_ID(N'dbo.TIPOS_DOCUMENTO', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.TIPOS_DOCUMENTO
    (
        id_tipo_documento INT IDENTITY(1,1) NOT NULL,
        tipo VARCHAR(50) NOT NULL,
        descripcion VARCHAR(150) NULL,

        CONSTRAINT PK_TIPOS_DOCUMENTO PRIMARY KEY (id_tipo_documento),
        CONSTRAINT UQ_TIPOS_DOCUMENTO_tipo UNIQUE (tipo),
        CONSTRAINT CK_TIPOS_DOCUMENTO_tipo_no_vacio CHECK (LEN(LTRIM(RTRIM(tipo))) > 0)
    );
    PRINT 'Tabla TIPOS_DOCUMENTO creada.';
END
GO

/* ============================================================
   5. ROLES (seguridad)
   ============================================================ */
IF OBJECT_ID(N'dbo.ROLES', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.ROLES
    (
        id_rol INT IDENTITY(1,1) NOT NULL,
        rol VARCHAR(50) NOT NULL,
        descripcion VARCHAR(150) NULL,

        CONSTRAINT PK_ROLES PRIMARY KEY (id_rol),
        CONSTRAINT UQ_ROLES_rol UNIQUE (rol),
        CONSTRAINT CK_ROLES_rol_no_vacio CHECK (LEN(LTRIM(RTRIM(rol))) > 0)
    );
    PRINT 'Tabla ROLES creada.';
END
GO

/* ============================================================
   6. ESTADOS_USUARIOS
   ============================================================ */
IF OBJECT_ID(N'dbo.ESTADOS_USUARIOS', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.ESTADOS_USUARIOS
    (
        id_estado_usuario INT IDENTITY(1,1) NOT NULL,
        estado VARCHAR(50) NOT NULL,
        descripcion VARCHAR(150) NULL,

        CONSTRAINT PK_ESTADOS_USUARIOS PRIMARY KEY (id_estado_usuario),
        CONSTRAINT UQ_ESTADOS_USUARIOS_estado UNIQUE (estado),
        CONSTRAINT CK_ESTADOS_USUARIOS_estado_no_vacio CHECK (LEN(LTRIM(RTRIM(estado))) > 0)
    );
    PRINT 'Tabla ESTADOS_USUARIOS creada.';
END
GO

/* ============================================================
   7. ESTADOS_CLIENTES
   ============================================================ */
IF OBJECT_ID(N'dbo.ESTADOS_CLIENTES', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.ESTADOS_CLIENTES
    (
        id_estado_cliente INT IDENTITY(1,1) NOT NULL,
        estado VARCHAR(50) NOT NULL,
        descripcion VARCHAR(150) NULL,

        CONSTRAINT PK_ESTADOS_CLIENTES PRIMARY KEY (id_estado_cliente),
        CONSTRAINT UQ_ESTADOS_CLIENTES_estado UNIQUE (estado),
        CONSTRAINT CK_ESTADOS_CLIENTES_estado_no_vacio CHECK (LEN(LTRIM(RTRIM(estado))) > 0)
    );
    PRINT 'Tabla ESTADOS_CLIENTES creada.';
END
GO

/* ============================================================
   8. CLIENTES
   ============================================================ */
IF OBJECT_ID(N'dbo.CLIENTES', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.CLIENTES
    (
        id_cliente INT IDENTITY(1,1) NOT NULL,
        id_localidad INT NOT NULL,
        id_tipo_cliente INT NOT NULL,
        id_tipo_documento INT NOT NULL,
        id_estado_cliente INT NOT NULL,
        tipo_persona CHAR(1) NOT NULL,
        numero_documento VARCHAR(11) NOT NULL,
        nombre VARCHAR(80) NULL,
        apellido VARCHAR(80) NULL,
        razon_social VARCHAR(150) NULL,
        direccion VARCHAR(150) NULL,
        telefono VARCHAR(30) NULL,
        email VARCHAR(100) NULL,

        CONSTRAINT PK_CLIENTES PRIMARY KEY (id_cliente),
        CONSTRAINT UQ_CLIENTES_numero_documento UNIQUE (numero_documento),
        CONSTRAINT FK_CLIENTES_LOCALIDADES FOREIGN KEY (id_localidad) REFERENCES dbo.LOCALIDADES(id_localidad),
        CONSTRAINT FK_CLIENTES_TIPOS_CLIENTE FOREIGN KEY (id_tipo_cliente) REFERENCES dbo.TIPOS_CLIENTE(id_tipo_cliente),
        CONSTRAINT FK_CLIENTES_TIPOS_DOCUMENTO FOREIGN KEY (id_tipo_documento) REFERENCES dbo.TIPOS_DOCUMENTO(id_tipo_documento),
        CONSTRAINT FK_CLIENTES_ESTADOS_CLIENTES FOREIGN KEY (id_estado_cliente) REFERENCES dbo.ESTADOS_CLIENTES(id_estado_cliente),
        CONSTRAINT CK_CLIENTES_numero_documento_no_vacio CHECK (LEN(LTRIM(RTRIM(numero_documento))) > 0),
        CONSTRAINT CK_CLIENTES_tipo_persona CHECK (tipo_persona IN ('J', 'F')),
        CONSTRAINT CK_CLIENTES_datos_segun_tipo CHECK (
            (tipo_persona = 'F' AND nombre IS NOT NULL AND apellido IS NOT NULL AND razon_social IS NULL) OR
            (tipo_persona = 'J' AND razon_social IS NOT NULL AND nombre IS NULL AND apellido IS NULL)
        )
    );
    PRINT 'Tabla CLIENTES creada.';
END
GO

/* ============================================================
   9. USUARIOS (operadores del sistema)
   ============================================================ */
IF OBJECT_ID(N'dbo.USUARIOS', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.USUARIOS
    (
        id_usuario INT IDENTITY(1,1) NOT NULL,
        id_rol INT NOT NULL,
        id_estado_usuario INT NOT NULL,
        nombre_usuario VARCHAR(50) NOT NULL,
        clave_hash VARCHAR(255) NOT NULL,
        nombre_completo VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL,

        CONSTRAINT PK_USUARIOS PRIMARY KEY (id_usuario),
        CONSTRAINT UQ_USUARIOS_nombre_usuario UNIQUE (nombre_usuario),
        CONSTRAINT UQ_USUARIOS_email UNIQUE (email),
        CONSTRAINT FK_USUARIOS_ROLES FOREIGN KEY (id_rol) REFERENCES dbo.ROLES(id_rol),
        CONSTRAINT FK_USUARIOS_ESTADOS_USUARIOS FOREIGN KEY (id_estado_usuario) REFERENCES dbo.ESTADOS_USUARIOS(id_estado_usuario),
        CONSTRAINT CK_USUARIOS_nombre_usuario_no_vacio CHECK (LEN(LTRIM(RTRIM(nombre_usuario))) > 0),
        CONSTRAINT CK_USUARIOS_clave_hash_no_vacia CHECK (LEN(LTRIM(RTRIM(clave_hash))) > 0),
        CONSTRAINT CK_USUARIOS_nombre_completo_no_vacio CHECK (LEN(LTRIM(RTRIM(nombre_completo))) > 0),
        CONSTRAINT CK_USUARIOS_email_no_vacio CHECK (LEN(LTRIM(RTRIM(email))) > 0)
    );
    PRINT 'Tabla USUARIOS creada.';
END
GO

/* ============================================================
   10. FORMAS_PAGO
   ============================================================ */
IF OBJECT_ID(N'dbo.FORMAS_PAGO', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.FORMAS_PAGO
    (
        id_forma_pago INT IDENTITY(1,1) NOT NULL,
        forma_pago VARCHAR(50) NOT NULL,
        descripcion VARCHAR(150) NULL,
        activo BIT NOT NULL CONSTRAINT DF_FORMAS_PAGO_activo DEFAULT (1),

        CONSTRAINT PK_FORMAS_PAGO PRIMARY KEY (id_forma_pago),
        CONSTRAINT UQ_FORMAS_PAGO_forma_pago UNIQUE (forma_pago),
        CONSTRAINT CK_FORMAS_PAGO_forma_pago_no_vacio CHECK (LEN(LTRIM(RTRIM(forma_pago))) > 0)
    );
    PRINT 'Tabla FORMAS_PAGO creada.';
END
GO

/* ============================================================
   11. ESTADOS_FACTURA
   ============================================================ */
IF OBJECT_ID(N'dbo.ESTADOS_FACTURA', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.ESTADOS_FACTURA
    (
        id_estado_factura INT IDENTITY(1,1) NOT NULL,
        estado VARCHAR(50) NOT NULL,
        descripcion VARCHAR(150) NULL,

        CONSTRAINT PK_ESTADOS_FACTURA PRIMARY KEY (id_estado_factura),
        CONSTRAINT UQ_ESTADOS_FACTURA_estado UNIQUE (estado),
        CONSTRAINT CK_ESTADOS_FACTURA_estado_no_vacio CHECK (LEN(LTRIM(RTRIM(estado))) > 0)
    );
    PRINT 'Tabla ESTADOS_FACTURA creada.';
END
GO

/* ============================================================
   12. TIPOS_FACTURA (tipo fiscal)
   ============================================================ */
IF OBJECT_ID(N'dbo.TIPOS_FACTURA', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.TIPOS_FACTURA
    (
        id_tipo_factura INT IDENTITY(1,1) NOT NULL,
        tipo VARCHAR(50) NOT NULL,
        descripcion VARCHAR(150) NULL,

        CONSTRAINT PK_TIPOS_FACTURA PRIMARY KEY (id_tipo_factura),
        CONSTRAINT UQ_TIPOS_FACTURA_tipo UNIQUE (tipo),
        CONSTRAINT CK_TIPOS_FACTURA_tipo_no_vacio CHECK (LEN(LTRIM(RTRIM(tipo))) > 0)
    );
    PRINT 'Tabla TIPOS_FACTURA creada.';
END
GO

/* ============================================================
   13. TIPOS_OPERACION_FACTURA (venta, nota crédito, etc.)
   ============================================================ */
IF OBJECT_ID(N'dbo.TIPOS_OPERACION_FACTURA', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.TIPOS_OPERACION_FACTURA
    (
        id_tipo_operacion_factura INT IDENTITY(1,1) NOT NULL,
        operacion VARCHAR(50) NOT NULL,
        descripcion VARCHAR(150) NULL,

        CONSTRAINT PK_TIPOS_OPERACION_FACTURA PRIMARY KEY (id_tipo_operacion_factura),
        CONSTRAINT UQ_TIPOS_OPERACION_FACTURA_operacion UNIQUE (operacion),
        CONSTRAINT CK_TIPOS_OPERACION_FACTURA_operacion_no_vacio CHECK (LEN(LTRIM(RTRIM(operacion))) > 0)
    );
    PRINT 'Tabla TIPOS_OPERACION_FACTURA creada.';
END
GO

/* ============================================================
   14. CATEGORIAS_PRODUCTO
   ============================================================ */
IF OBJECT_ID(N'dbo.CATEGORIAS_PRODUCTO', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.CATEGORIAS_PRODUCTO
    (
        id_categoria INT IDENTITY(1,1) NOT NULL,
        nombre VARCHAR(100) NOT NULL,
        descripcion VARCHAR(150) NULL,
        activo BIT NOT NULL CONSTRAINT DF_CATEGORIAS_PRODUCTO_activo DEFAULT (1),

        CONSTRAINT PK_CATEGORIAS_PRODUCTO PRIMARY KEY (id_categoria),
        CONSTRAINT UQ_CATEGORIAS_PRODUCTO_nombre UNIQUE (nombre),
        CONSTRAINT CK_CATEGORIAS_PRODUCTO_nombre_no_vacio CHECK (LEN(LTRIM(RTRIM(nombre))) > 0)
    );
    PRINT 'Tabla CATEGORIAS_PRODUCTO creada.';
END
GO

/* ============================================================
   15. IMPUESTOS
   ============================================================ */
IF OBJECT_ID(N'dbo.IMPUESTOS', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.IMPUESTOS
    (
        id_impuesto INT IDENTITY(1,1) NOT NULL,
        impuesto VARCHAR(50) NOT NULL,
        porcentaje DECIMAL(5,2) NOT NULL,
        descripcion VARCHAR(150) NULL,
        activo BIT NOT NULL CONSTRAINT DF_IMPUESTOS_activo DEFAULT (1),

        CONSTRAINT PK_IMPUESTOS PRIMARY KEY (id_impuesto),
        CONSTRAINT CK_IMPUESTOS_porcentaje CHECK (porcentaje >= 0),
        CONSTRAINT CK_IMPUESTOS_impuesto_no_vacio CHECK (LEN(LTRIM(RTRIM(impuesto))) > 0)
    );
    PRINT 'Tabla IMPUESTOS creada.';
END
GO

/* ============================================================
   16. PRODUCTOS_SERVICIOS
   ============================================================ */
IF OBJECT_ID(N'dbo.PRODUCTOS_SERVICIOS', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.PRODUCTOS_SERVICIOS
    (
        id_producto_servicio INT IDENTITY(1,1) NOT NULL,
        id_categoria INT NOT NULL,
        id_impuesto INT NOT NULL,
        nombre VARCHAR(120) NOT NULL,
        descripcion VARCHAR(250) NULL,
        precio_unitario_actual DECIMAL(12,2) NOT NULL,
        stock_actual INT NOT NULL CONSTRAINT DF_PRODUCTOS_SERVICIOS_stock_actual DEFAULT (0),
        activo BIT NOT NULL CONSTRAINT DF_PRODUCTOS_SERVICIOS_activo DEFAULT (1),

        CONSTRAINT PK_PRODUCTOS_SERVICIOS PRIMARY KEY (id_producto_servicio),
        CONSTRAINT FK_PRODUCTOS_SERVICIOS_CATEGORIAS FOREIGN KEY (id_categoria) REFERENCES dbo.CATEGORIAS_PRODUCTO(id_categoria),
        CONSTRAINT FK_PRODUCTOS_SERVICIOS_IMPUESTOS FOREIGN KEY (id_impuesto) REFERENCES dbo.IMPUESTOS(id_impuesto),
        CONSTRAINT CK_PRODUCTOS_SERVICIOS_nombre_no_vacio CHECK (LEN(LTRIM(RTRIM(nombre))) > 0),
        CONSTRAINT CK_PRODUCTOS_SERVICIOS_precio CHECK (precio_unitario_actual >= 0),
        CONSTRAINT CK_PRODUCTOS_SERVICIOS_stock CHECK (stock_actual >= 0)
    );
    PRINT 'Tabla PRODUCTOS_SERVICIOS creada.';
END
GO

/* ============================================================
   17. FACTURAS (cabecera)
   ============================================================ */
IF OBJECT_ID(N'dbo.FACTURAS', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.FACTURAS
    (
        id_factura INT IDENTITY(1,1) NOT NULL,
        id_cliente INT NOT NULL,
        id_usuario INT NOT NULL,
        id_estado_factura INT NOT NULL,
        id_tipo_factura INT NOT NULL,
        id_tipo_operacion_factura INT NOT NULL,
        numero_factura VARCHAR(30) NOT NULL,
        fecha_emision DATETIME NOT NULL CONSTRAINT DF_FACTURAS_fecha_emision DEFAULT (GETDATE()),
        total_neto DECIMAL(12,2) NOT NULL CONSTRAINT DF_FACTURAS_total_neto DEFAULT (0),
        total_impuestos DECIMAL(12,2) NOT NULL CONSTRAINT DF_FACTURAS_total_impuestos DEFAULT (0),
        total_descuentos DECIMAL(12,2) NOT NULL CONSTRAINT DF_FACTURAS_total_descuentos DEFAULT (0),
        total_recargos DECIMAL(12,2) NOT NULL CONSTRAINT DF_FACTURAS_total_recargos DEFAULT (0),
        total DECIMAL(12,2) NOT NULL CONSTRAINT DF_FACTURAS_total DEFAULT (0),
        observaciones VARCHAR(250) NULL,

        CONSTRAINT PK_FACTURAS PRIMARY KEY (id_factura),
        CONSTRAINT UQ_FACTURAS_numero_factura UNIQUE (numero_factura),
        CONSTRAINT FK_FACTURAS_CLIENTES FOREIGN KEY (id_cliente) REFERENCES dbo.CLIENTES(id_cliente),
        CONSTRAINT FK_FACTURAS_USUARIOS FOREIGN KEY (id_usuario) REFERENCES dbo.USUARIOS(id_usuario),
        CONSTRAINT FK_FACTURAS_ESTADOS_FACTURA FOREIGN KEY (id_estado_factura) REFERENCES dbo.ESTADOS_FACTURA(id_estado_factura),
        CONSTRAINT FK_FACTURAS_TIPOS_FACTURA FOREIGN KEY (id_tipo_factura) REFERENCES dbo.TIPOS_FACTURA(id_tipo_factura),
        CONSTRAINT FK_FACTURAS_TIPOS_OPERACION FOREIGN KEY (id_tipo_operacion_factura) REFERENCES dbo.TIPOS_OPERACION_FACTURA(id_tipo_operacion_factura),
        CONSTRAINT CK_FACTURAS_numero_factura_no_vacio CHECK (LEN(LTRIM(RTRIM(numero_factura))) > 0),
        CONSTRAINT CK_FACTURAS_total CHECK (total >= 0),
        CONSTRAINT CK_FACTURAS_total_neto CHECK (total_neto >= 0),
        CONSTRAINT CK_FACTURAS_total_impuestos CHECK (total_impuestos >= 0),
        CONSTRAINT CK_FACTURAS_total_descuentos CHECK (total_descuentos >= 0),
        CONSTRAINT CK_FACTURAS_total_recargos CHECK (total_recargos >= 0)
    );
    PRINT 'Tabla FACTURAS creada.';
END
GO

/* ============================================================
   18. DETALLES_FACTURA
   ============================================================ */
IF OBJECT_ID(N'dbo.DETALLES_FACTURA', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.DETALLES_FACTURA
    (
        id_detalle_factura INT IDENTITY(1,1) NOT NULL,
        id_factura INT NOT NULL,
        id_producto_servicio INT NOT NULL,
        cantidad DECIMAL(12,2) NOT NULL,
        precio_unitario_facturado DECIMAL(12,2) NOT NULL,
        subtotal_neto DECIMAL(12,2) NOT NULL,
        porcentaje_impuesto_facturado DECIMAL(5,2) NOT NULL,
        importe_impuesto DECIMAL(12,2) NOT NULL,
        subtotal_con_impuesto DECIMAL(12,2) NOT NULL,

        CONSTRAINT PK_DETALLES_FACTURA PRIMARY KEY (id_detalle_factura),
        CONSTRAINT FK_DETALLES_FACTURA_FACTURAS FOREIGN KEY (id_factura) REFERENCES dbo.FACTURAS(id_factura),
        CONSTRAINT FK_DETALLES_FACTURA_PRODUCTOS FOREIGN KEY (id_producto_servicio) REFERENCES dbo.PRODUCTOS_SERVICIOS(id_producto_servicio),
        CONSTRAINT CK_DETALLES_FACTURA_cantidad CHECK (cantidad > 0),
        CONSTRAINT CK_DETALLES_FACTURA_precio CHECK (precio_unitario_facturado >= 0),
        CONSTRAINT CK_DETALLES_FACTURA_subtotal CHECK (subtotal_neto >= 0),
        CONSTRAINT CK_DETALLES_FACTURA_porcentaje_impuesto CHECK (porcentaje_impuesto_facturado >= 0),
        CONSTRAINT CK_DETALLES_FACTURA_importe_impuesto CHECK (importe_impuesto >= 0),
        CONSTRAINT CK_DETALLES_FACTURA_subtotal_con_impuesto CHECK (subtotal_con_impuesto >= 0)
    );
    PRINT 'Tabla DETALLES_FACTURA creada.';
END
GO

/* ============================================================
   19. COMPROBANTES_PAGO (pagos mixtos o fraccionados)
   ============================================================ */
IF OBJECT_ID(N'dbo.COMPROBANTES_PAGO', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.COMPROBANTES_PAGO
    (
        id_comprobante_pago INT IDENTITY(1,1) NOT NULL,
        id_factura INT NOT NULL,
        id_forma_pago INT NOT NULL,
        fecha_pago DATETIME NOT NULL CONSTRAINT DF_COMPROBANTES_PAGO_fecha_pago DEFAULT (GETDATE()),
        monto DECIMAL(12,2) NOT NULL,
        numero_referencia VARCHAR(100) NULL,
        observaciones VARCHAR(150) NULL,

        CONSTRAINT PK_COMPROBANTES_PAGO PRIMARY KEY (id_comprobante_pago),
        CONSTRAINT FK_COMPROBANTES_PAGO_FACTURAS FOREIGN KEY (id_factura) REFERENCES dbo.FACTURAS(id_factura),
        CONSTRAINT FK_COMPROBANTES_PAGO_FORMAS_PAGO FOREIGN KEY (id_forma_pago) REFERENCES dbo.FORMAS_PAGO(id_forma_pago),
        CONSTRAINT CK_COMPROBANTES_PAGO_monto CHECK (monto > 0)
    );
    PRINT 'Tabla COMPROBANTES_PAGO creada.';
END
GO

/* ============================================================
   20. AUDITORIA_FACTURA (historial de cambios)
   ============================================================ */
IF OBJECT_ID(N'dbo.AUDITORIA_FACTURA', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.AUDITORIA_FACTURA
    (
        id_auditoria INT IDENTITY(1,1) NOT NULL,
        id_factura INT NOT NULL,
        id_usuario INT NOT NULL,
        accion VARCHAR(50) NOT NULL,
        fecha DATETIME NOT NULL CONSTRAINT DF_AUDITORIA_FACTURA_fecha DEFAULT (GETDATE()),
        detalle VARCHAR(250) NULL,

        CONSTRAINT PK_AUDITORIA_FACTURA PRIMARY KEY (id_auditoria),
        CONSTRAINT FK_AUDITORIA_FACTURA_FACTURAS FOREIGN KEY (id_factura) REFERENCES dbo.FACTURAS(id_factura),
        CONSTRAINT FK_AUDITORIA_FACTURA_USUARIOS FOREIGN KEY (id_usuario) REFERENCES dbo.USUARIOS(id_usuario),
        CONSTRAINT CK_AUDITORIA_FACTURA_accion_no_vacia CHECK (LEN(LTRIM(RTRIM(accion))) > 0)
    );
    PRINT 'Tabla AUDITORIA_FACTURA creada.';
END
GO

/* ============================================================
   21. DESCUENTOS_FACTURA (bonificaciones globales)
   ============================================================ */
IF OBJECT_ID(N'dbo.DESCUENTOS_FACTURA', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.DESCUENTOS_FACTURA
    (
        id_descuento_factura INT IDENTITY(1,1) NOT NULL,
        id_factura INT NOT NULL,
        descripcion VARCHAR(150) NOT NULL,
        porcentaje DECIMAL(5,2) NULL,
        monto DECIMAL(12,2) NOT NULL,

        CONSTRAINT PK_DESCUENTOS_FACTURA PRIMARY KEY (id_descuento_factura),
        CONSTRAINT FK_DESCUENTOS_FACTURA_FACTURAS FOREIGN KEY (id_factura) REFERENCES dbo.FACTURAS(id_factura),
        CONSTRAINT CK_DESCUENTOS_FACTURA_descripcion_no_vacia CHECK (LEN(LTRIM(RTRIM(descripcion))) > 0),
        CONSTRAINT CK_DESCUENTOS_FACTURA_porcentaje CHECK (porcentaje IS NULL OR porcentaje >= 0),
        CONSTRAINT CK_DESCUENTOS_FACTURA_monto CHECK (monto > 0)
    );
    PRINT 'Tabla DESCUENTOS_FACTURA creada.';
END
GO

/* ============================================================
   22. RECARGOS_FACTURA (intereses o envíos)
   ============================================================ */
IF OBJECT_ID(N'dbo.RECARGOS_FACTURA', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.RECARGOS_FACTURA
    (
        id_recargo_factura INT IDENTITY(1,1) NOT NULL,
        id_factura INT NOT NULL,
        descripcion VARCHAR(150) NOT NULL,
        porcentaje DECIMAL(5,2) NULL,
        monto DECIMAL(12,2) NOT NULL,

        CONSTRAINT PK_RECARGOS_FACTURA PRIMARY KEY (id_recargo_factura),
        CONSTRAINT FK_RECARGOS_FACTURA_FACTURAS FOREIGN KEY (id_factura) REFERENCES dbo.FACTURAS(id_factura),
        CONSTRAINT CK_RECARGOS_FACTURA_descripcion_no_vacia CHECK (LEN(LTRIM(RTRIM(descripcion))) > 0),
        CONSTRAINT CK_RECARGOS_FACTURA_porcentaje CHECK (porcentaje IS NULL OR porcentaje >= 0),
        CONSTRAINT CK_RECARGOS_FACTURA_monto CHECK (monto > 0)
    );
    PRINT 'Tabla RECARGOS_FACTURA creada.';
END
GO

/* ============================================================
   ÍNDICES ÚNICOS FILTRADOS
   Propósito: Evitar duplicados solo entre registros ACTIVOS.
   Permiten tener nombres repetidos si uno de ellos está inactivo.
   ============================================================ */

-- 1. PRODUCTOS_SERVICIOS: No pueden existir dos productos ACTIVOS con el mismo nombre.
--    Ejemplo: Si hay un producto "Camisa" activo, no se puede crear otro "Camisa" activo.
--    Pero si uno se desactiva (activo=0), se puede crear otro nuevo con el mismo nombre.
CREATE UNIQUE NONCLUSTERED INDEX IX_PRODUCTOS_nombre_activo
ON PRODUCTOS_SERVICIOS(nombre) WHERE activo = 1;

-- 2. CATEGORIAS_PRODUCTO: No pueden existir dos categorías ACTIVAS con el mismo nombre.
--    Útil para mantener limpias las familias de productos.
CREATE UNIQUE NONCLUSTERED INDEX IX_CATEGORIAS_nombre_activo
ON CATEGORIAS_PRODUCTO(nombre) WHERE activo = 1;

-- 3. FORMAS_PAGO: No pueden existir dos formas de pago ACTIVAS con el mismo nombre.
--    Ejemplo: Solo una forma "Tarjeta Crédito" activa a la vez.
CREATE UNIQUE NONCLUSTERED INDEX IX_FORMAS_PAGO_nombre_activo
ON FORMAS_PAGO(forma_pago) WHERE activo = 1;

PRINT 'Todas las tablas se han creado exitosamente.';
GO