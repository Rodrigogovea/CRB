/****** Object:  StoredProcedure [dbo].[CREATE_MODEL]  ******/
USE [CRB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_MODEL]  
(  
     @TableName SYSNAME ,  
     @CLASSNAME VARCHAR(500)   
)  
AS  
BEGIN  
    DECLARE @Result VARCHAR(MAX)  
	SET @Result = 'class ' + UPPER(LEFT(@CLASSNAME, 1)) + LOWER(SUBSTRING(@CLASSNAME, 2, LEN(@CLASSNAME)))  + '  
{'  
SELECT @Result = @Result + '  
    public ' + ColumnType + NullableSign + ' ' + ColumnName + ' { get; set; }'  
FROM  
(  
    SELECT   
        REPLACE(col.NAME, ' ', '_') ColumnName,  
        column_id ColumnId,  
        CASE typ.NAME   
            WHEN 'bigint' THEN 'long'  
            WHEN 'binary' THEN 'byte[]'  
            WHEN 'bit' THEN 'bool'  
            WHEN 'char' THEN 'string'  
            WHEN 'date' THEN 'DateTime'  
            WHEN 'datetime' THEN 'DateTime'  
            WHEN 'datetime2' then 'DateTime'  
            WHEN 'datetimeoffset' THEN 'DateTimeOffset'  
            WHEN 'decimal' THEN 'decimal'  
            WHEN 'float' THEN 'float'  
            WHEN 'image' THEN 'byte[]'  
            WHEN 'int' THEN 'int'  
            WHEN 'money' THEN 'decimal'  
            WHEN 'nchar' THEN 'char'  
            WHEN 'ntext' THEN 'string'  
            WHEN 'numeric' THEN 'decimal'  
            WHEN 'nvarchar' THEN 'string'  
            WHEN 'real' THEN 'double'  
            WHEN 'smalldatetime' THEN 'DateTime'  
            WHEN 'smallint' THEN 'short'  
            WHEN 'smallmoney' THEN 'decimal'  
            WHEN 'text' THEN 'string'  
            WHEN 'time' THEN 'TimeSpan'  
            WHEN 'timestamp' THEN 'DateTime'  
            WHEN 'tinyint' THEN 'byte'  
            WHEN 'uniqueidentifier' THEN 'Guid'  
            WHEN 'varbinary' THEN 'byte[]'  
            WHEN 'varchar' THEN 'string'  
            ELSE 'UNKNOWN_' + typ.NAME  
        END ColumnType,  
        CASE   
            WHEN col.is_nullable = 1 and typ.NAME in ('bigint', 'bit', 'date', 'datetime', 'datetime2', 'datetimeoffset', 'decimal', 'float', 'int', 'money', 'numeric', 'real', 'smalldatetime', 'smallint', 'smallmoney', 'time', 'tinyint', 'uniqueidentifier')   
            THEN '?'   
            ELSE ''   
        END NullableSign  
    FROM SYS.COLUMNS col join sys.types typ on col.system_type_id = typ.system_type_id AND col.user_type_id = typ.user_type_id  
    where object_id = object_id(@TableName)  
) t  
ORDER BY ColumnId  
SET @Result = @Result  + '  
}'  
print @Result  
END
/******************************************************************************************************/

/****** Object:  StoredProcedure [dbo].[Valida_Usuario]     ******/
USE [CRB]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Valida_Usuario]
      @Username VARCHAR(50),
      @Password VARCHAR(50),
	  @IP NVARCHAR(20)
AS
BEGIN
      SET NOCOUNT ON;
      DECLARE 
			@UserId VARCHAR(50), 
			@LastLoginDate DATETIME
     
      SELECT @UserId = idUsuario, @LastLoginDate = fechaMov
      FROM Usuarios WHERE (idUsuario = @Username) AND ([Password] = @Password) AND (estado='A')
     
      IF @UserId IS NOT NULL
      BEGIN
            IF EXISTS(SELECT idUsuario FROM Usuarios WHERE idUsuario = @UserId AND (estado='A'))
            BEGIN
                  INSERT INTO sesiones (idUsuario, ip, fechaSesion) VALUES (@Username, @ip, GETDATE())
                  SELECT @UserId [UserId] -- USUARIO VALIDO
            END
            ELSE
            BEGIN
                  SELECT 2 -- USUARIO INACTIVO
            END
      END
      ELSE
      BEGIN
            SELECT 1 -- USUARIO INCORRECTO
      END
END
/******************************************************************************************************/


/****** Object:  StoredProcedure [dbo].[RecuperaComputadorasCentro]    ******/
USE [CRB]
GO
/****** Object:  StoredProcedure [dbo].[RecuperaComputadorasCentro]    Script Date: 04/10/2019 02:33:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[RecuperaComputadorasCentro]
	  @Centro VARCHAR(5)
AS
BEGIN
      SET NOCOUNT ON;
		
			SELECT  
					e.Descripcion as Equipo,
					ac.id_lugar as Lugar, 
					CASE
						WHEN s.Descripcion='DISPONIBLE' THEN '../images/Centro/Disponible.jpeg'
						WHEN s.Descripcion='OCUPADO' THEN '../images/Centro/Ocupado.jpeg'
						WHEN s.Descripcion='REPARACION' THEN '../images/Centro/Reparacion.jpeg'
					END as situacion,
					(SELECT STUFF(
							(SELECT at.Descripcion + ' ' + ft.Descripcion + ' '
						FROM Ficha_tecnica as ft, Atributos as at
						where ft.idAtributo=at.idAtributo
						and ft.id_activoFijo=e.id_equipos
							FOR XML PATH ('')),
						1,2, '')) as fichaTecnica
				FROM ActivoFijo AS ac,
						Centros AS c,
						situaciones AS s,
						Equipos AS e 
				WHERE (c.id_centro=@Centro AND ac.estado='A')
					AND (ac.id_centro=c.id_centro)
					AND (ac.id_situacion=s.id_situacion)
					AND (ac.id_equipos=e.id_equipos)
			ORDER BY id_lugar

END

/******************************************************************************************************/
