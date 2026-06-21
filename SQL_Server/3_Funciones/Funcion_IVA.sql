/* ============================================================
   FUNCIÓN: Calcular IVA
   ============================================================ */

USE BaseDeDatos_PyME;
GO

IF OBJECT_ID(N'dbo.ufn_CalcularIVA', N'FN') IS NOT NULL
    DROP FUNCTION dbo.ufn_CalcularIVA;
GO

CREATE FUNCTION dbo.ufn_CalcularIVA
(
    @monto DECIMAL(12,2),
    @porcentaje DECIMAL(5,2)
)
RETURNS DECIMAL(12,2)
AS
BEGIN
    RETURN @monto * (@porcentaje / 100);
END;
GO

-- Ejemplo de uso:
-- SELECT dbo.ufn_CalcularIVA(10000, 21) AS IVA;