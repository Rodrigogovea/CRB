--***** CREAR BASE DE DATOS ************

CREATE DATABASE C3

--********************************** CETROS ****************************************
CREATE TABLE Centros (
		id_centro VARCHAR(5) NOT NULL,
		nombre VARCHAR(500) NOT NULL,
		estado INT NOT NULL,
		fechaMov DATETIME NOT NULL,
		id_usuario_modifica VARCHAR(50) NOT NULL
						)
ALTER TABLE Centros 
ADD CONSTRAINT PK_Centros PRIMARY KEY NONCLUSTERED (id_centro);
GO
--***********************************************************************************

--************************** CENTROS LUGARES ****************************************
CREATE TABLE Lugares_centros(
				id_centro VARCHAR(5) NOT NULL,
				id_lugar VARCHAR(5) NOT NULL,
				estado INT NOT NULL,
				fechaMov DATETIME NOT NULL,
				id_usuario_modifica VARCHAR(50) NOT NULL
								)
ALTER TABLE Lugares_centros 
ADD CONSTRAINT PK_Lugares_centros PRIMARY KEY NONCLUSTERED (id_centro,id_lugar);
GO

ALTER TABLE Lugares_centros 
ADD CONSTRAINT FK_Centros FOREIGN KEY (id_centro)
      REFERENCES Centros (id_centro)
--***********************************************************************************

---************************* EQUIPOS ************************************************
CREATE TABLE Equipos (
				id_equipos VARCHAR(5) NOT NULL,
				Descripcion VARCHAR(500) NOT NULL,
				estado INT NOT NULL,
				fechaMov DATETIME NOT NULL,
				id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE Equipos 
ADD CONSTRAINT PK_Equipos PRIMARY KEY NONCLUSTERED (id_equipos);
GO
--***********************************************************************************

--************************** SITUACIONES  ******************************************
CREATE TABLE situaciones
(
	id_situacion VARCHAR(5)  NOT NULL, 
	Descripcion VARCHAR(500) NOT NULL,
	estado INT NOT NULL,
	fechaMov DATETIME NOT NULL,
	id_usuario_modifica VARCHAR(50)
)
ALTER TABLE Situaciones
ADD CONSTRAINT PK_Situaciones PRIMARY KEY NONCLUSTERED(id_situacion);
GO
--***********************************************************************************

---******************************* EQUIPOS *****************************************
CREATE TABLE ActivoFijo (
			id_activoFijo VARCHAR(20) NOT NULL,
			id_equipos VARCHAR(5) NOT NULL,
			id_centro VARCHAR(5) NOT NULL,
			id_lugar VARCHAR(5) NOT NULL,
			id_situacion VARCHAR(5) NOT NULL,
			estado INT NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE ActivoFijo 
ADD CONSTRAINT PK_ActivoFijo PRIMARY KEY NONCLUSTERED (id_activoFijo);
GO

ALTER TABLE ActivoFijo 
ADD CONSTRAINT FK_ActivoFijo_Equipos FOREIGN KEY (id_equipos)
      REFERENCES Equipos (id_equipos)
ALTER TABLE ActivoFijo 
ADD CONSTRAINT FK_ActivoFijo_Centros FOREIGN KEY (id_centro)
      REFERENCES Lugares_centros (id_centro)
ALTER TABLE ActivoFijo 
ADD CONSTRAINT FK_ActivoFijo_Lugar FOREIGN KEY (id_lugar)
      REFERENCES Lugares_centros (id_lugar)
ALTER TABLE ActivoFijo 
ADD CONSTRAINT FK_Situacion FOREIGN KEY (id_situacion)
      REFERENCES situaciones (id_situacion)
----********************************************************************************** 

---******************************* FICHA TECNICA *************************************
CREATE TABLE Ficha_tecnica(
				id_activoFijo VARCHAR(20) NOT NULL,
				id_atributo VARCHAR(10) NOT NULL,
				Descripcion VARCHAR(500) NOT NULL,
				estado INT NOT NULL,
				fechaMov DATETIME NOT NULL,
				id_usuario_modifica VARCHAR(50) NOT NULL
				)
----********************************************************************************** 

---******************************* CARRERAS *****************************************
CREATE TABLE Carrera (
			id_carrera VARCHAR(20) NOT NULL,
			Descripcion VARCHAR(500) NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE Carrera 
ADD CONSTRAINT PK_Carrera PRIMARY KEY NONCLUSTERED (id_carrera);
GO
----********************************************************************************** 

---******************************* TURNOS *****************************************
CREATE TABLE Turno (
			id_turno VARCHAR(5) NOT NULL,
			Descripcion VARCHAR(500) NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE Turno 
ADD CONSTRAINT PK_Turno PRIMARY KEY NONCLUSTERED (id_turno);
GO
----********************************************************************************** 

---******************************* PERIODO *****************************************
CREATE TABLE Periodo (
			id_periodo VARCHAR(5) NOT NULL,
			Descripcion VARCHAR(500) NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
					)
ALTER TABLE Periodo 
ADD CONSTRAINT PK_Periodo PRIMARY KEY NONCLUSTERED (id_periodo);
GO
----********************************************************************************** 


---******************************* SEMESTRES *****************************************
CREATE TABLE Semestre (
			id_semestre VARCHAR(5) NOT NULL,
			Descripcion VARCHAR(500) NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE Semestre 
ADD CONSTRAINT PK_Semestre PRIMARY KEY NONCLUSTERED (id_semestre);
GO
----********************************************************************************** 

---******************************* GRUPOS *****************************************
CREATE TABLE Grupos (
			id_grupo VARCHAR(1) NOT NULL,
			Descripcion VARCHAR(500) NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE Grupos 
ADD CONSTRAINT PK_Grupos PRIMARY KEY NONCLUSTERED (id_grupo);
GO
----********************************************************************************** 

---******************************* ALUMNOS *******************************************
CREATE TABLE Alummno (
			No_Control VARCHAR(20) NOT NULL,
			Nombre VARCHAR(500) NOT NULL,
			curp VARCHAR(20) NOT NULL,
			nacionalidad VARCHAR(50) NOT NULL,
			fecha_nacimiento DATETIME NOT NULL,
			sexo VARCHAR(5)NOT NULL,
			Tel_movil VARCHAR(12) NOT NULL,
			Tel_particular VARCHAR(12) NOT NULL,
			Correo VARCHAR(100) NOT NULL,
			saldo_impresion DECIMAL(10,2) NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE Alummno 
ADD CONSTRAINT PK_No_Control PRIMARY KEY NONCLUSTERED (No_Control);
GO
----********************************************************************************** 

---******************************* ALUMNOS_DETALLE *******************************************
CREATE TABLE Alumnos_detalle(
			No_Control VARCHAR(20) NOT NULL,
			id_periodo VARCHAR(5) NOT NULL,
			id_semestre VARCHAR(5) NOT NULL,
			id_grupo VARCHAR(1) NOT NULL,
			id_turno VARCHAR(5) NOT NULL,
			id_carrera VARCHAR(20) NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)				
)
ALTER TABLE Alumnos_detalle 
ADD CONSTRAINT PK_Alumnos_detalle PRIMARY KEY NONCLUSTERED (No_Control,id_periodo);
GO
ALTER TABLE Alumnos_detalle 
ADD CONSTRAINT FK_Alumnos_detalle_Alumno FOREIGN KEY (No_Control)
REFERENCES Alummno (No_Control)
ALTER TABLE Alumnos_detalle 
ADD CONSTRAINT FK_Alumnos_detalle_perido FOREIGN KEY (id_periodo)
REFERENCES Periodo (id_periodo)
ALTER TABLE Alumnos_detalle 
ADD CONSTRAINT FK_Alumnos_detalle_semestre FOREIGN KEY (id_semestre)
REFERENCES Semestre (id_semestre)
ALTER TABLE Alumnos_detalle 
ADD CONSTRAINT FK_Alumnos_detalle_grupo FOREIGN KEY (id_grupo)
REFERENCES Grupos (id_grupo)
ALTER TABLE Alumnos_detalle 
ADD CONSTRAINT FK_Alumnos_detalle_turno FOREIGN KEY (id_turno)
REFERENCES Turno (id_turno)
ALTER TABLE Alumnos_detalle 
ADD CONSTRAINT FK_Alumnos_detalle_carrera FOREIGN KEY (id_carrera)
REFERENCES Carrera (id_carrera)
----******************************************************************************************

---*************************** RECARGAS ******************************************************
CREATE TABLE Recargas (
			Folio_recarga VARCHAR(20) NOT NULL,
			No_Control VARCHAR(20) NOT NULL,
			monto DECIMAL(10,2) NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE Recargas 
ADD CONSTRAINT PK_Recargas PRIMARY KEY NONCLUSTERED (Folio_recarga);
GO

ALTER TABLE Recargas 
ADD CONSTRAINT FK_Recargas_Alumno FOREIGN KEY (No_Control)
REFERENCES Alummno (No_Control)
----********************************************************************************** 

---*************************** TIPOS_IMPRESIONES **************************************
CREATE TABLE Tipo_impresiones (
			id_tipo_impresiones VARCHAR(5) NOT NULL,
			Descripcion VARCHAR(500) NOT NULL,
			precio DECIMAL(10,2) NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE Tipo_impresiones 
ADD CONSTRAINT PK_Tipo_impresiones PRIMARY KEY NONCLUSTERED (id_tipo_impresiones);
GO
----***********************************************************************************

---****************************** IMPRESIONES *****************************************
CREATE TABLE impresiones (
			id_impresiones VARCHAR(5) NOT NULL,
			Descripcion VARCHAR(500) NOT NULL,
			No_Control VARCHAR(20) NOT NULL,
			id_tipo_impresiones VARCHAR(5) NOT NULL,
			cantidad_impresa INT NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE impresiones 
ADD CONSTRAINT PK_Impresiones PRIMARY KEY NONCLUSTERED (id_impresiones);
GO

ALTER TABLE impresiones 
ADD CONSTRAINT FK_Impresiones_Alumno FOREIGN KEY (No_Control)
      REFERENCES Alummno (No_Control)
ALTER TABLE impresiones 
ADD CONSTRAINT FK_Impresiones_id_tipo_impresiones FOREIGN KEY (id_tipo_impresiones)
      REFERENCES Tipo_impresiones (id_tipo_impresiones)
----***********************************************************************************

---****************************** RENTA ***********************************************
CREATE TABLE Renta (
			id_renta VARCHAR(5) NOT NULL,
			id_activoFijo VARCHAR(20) NOT NULL,
			No_Control VARCHAR(20) NOT NULL,
			id_periodo VARCHAR(5) NOT NULL,
			Descripcion VARCHAR(500) NOT NULL,
			horaInicio DATETIME NOT NULL,
			horaFin DATETIME NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE Renta 
ADD CONSTRAINT PK_Renta PRIMARY KEY NONCLUSTERED (id_renta);
GO

ALTER TABLE Renta 
ADD CONSTRAINT FK_Renta_ActivoFijo FOREIGN KEY (id_activoFijo)
      REFERENCES ActivoFijo (id_activoFijo)
ALTER TABLE Renta 
ADD CONSTRAINT FK_Renta_Alumno FOREIGN KEY (No_Control)
      REFERENCES Alummno (No_Control)
ALTER TABLE Renta 
ADD CONSTRAINT FK_Renta_Periodo FOREIGN KEY (id_periodo)
      REFERENCES Periodo (id_periodo)
----***********************************************************************************

---****************************** INCIDENTES ***************************************
CREATE TABLE Incidentes(
			id_incidente VARCHAR(5) NOT NULL,
			Descripcion VARCHAR(500) NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
						)
ALTER TABLE Incidentes 
ADD CONSTRAINT PK_Incidentes PRIMARY KEY NONCLUSTERED (id_incidente);
GO
----***********************************************************************************

---****************************** DETALLE_RENTA ***************************************
CREATE TABLE Detalle_Renta(
			id_renta VARCHAR(5) NOT NULL,
			Consecutivo INT NOT NULL,
			id_incidente VARCHAR(5) NOT NULL,
			Descripcion VARCHAR(500) NOT NULL,
			estado VARCHAR(5) NOT NULL,
			fechaMov DATETIME NOT NULL,
			id_usuario_modifica VARCHAR(50)
							)
ALTER TABLE Detalle_Renta 
ADD CONSTRAINT FK_Renta_Detalle_Renta FOREIGN KEY (id_renta)
      REFERENCES Renta (id_renta)
ALTER TABLE Detalle_Renta 
ADD CONSTRAINT FK_Incidentes_Detalle_Renta FOREIGN KEY (id_incidente)
      REFERENCES Incidentes  (id_incidente)
----***********************************************************************************

