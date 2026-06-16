/* =========================================================
   PROYECTO INTEGRADOR BDD
   CREACION DE BASE DE DATOS - UNIVERSAL (Sirve para Kevin y Mauro)
   ========================================================= */

-- 1. Creamos la base de datos de forma simple (SQL Server elige las rutas por defecto)
CREATE DATABASE BaseDeDatos_PyME;
GO

-- 2. Nos posicionamos sobre la base de datos que acabamos de crear
USE BaseDeDatos_PyME;
GO

-- 3. Optimizamos el espacio (Modo Simple)
ALTER DATABASE BaseDeDatos_PyME SET RECOVERY SIMPLE;
GO

PRINT 'Base de datos BaseDeDatos_PyME creada correctamente.';
GO