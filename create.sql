-- Script para crear la base de datos no normalizada

-- Crear base de datos no normalizada
CREATE DATABASE `empleado_proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- Seleccionar la base de datos para su uso
USE empleado_proyecto;

-- Crear tabla Empleado_NM
-- Esta tabla almacena información de empleados con detalles de proyectos, roles, y supervisores.
CREATE TABLE Empleado_NM (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para cada empleado
    nombre_empleado VARCHAR(255) NOT NULL, -- Nombre completo del empleado
    departamento VARCHAR(20) NOT NULL, -- Departamento al que pertenece el empleado
    correo_electronico VARCHAR(100) NOT NULL, -- Correo electrónico del empleado
    proyectos VARCHAR(20), -- Proyecto(s) en el que está involucrado el empleado (no normalizado)
    roles VARCHAR(20), -- Rol(s) del empleado en el proyecto (no normalizado)
    fecha_inicio_proyecto DATE NOT NULL, -- Fecha de inicio del proyecto para el empleado
    salario VARCHAR(20), -- Salario del empleado (almacenado como texto)
    Supervisor VARCHAR(20) -- Nombre del supervisor del empleado (no normalizado)
);
  
  
  -- Script para crear la base de datos normalizada

-- Crear base de datos normalizada
CREATE DATABASE `empleado_proyecto_normalizado` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- Seleccionar la base de datos para su uso
USE empleado_proyecto_normalizado;

-- Crear tabla Empleado
-- Esta tabla almacena información básica sobre los empleados.
CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único para cada empleado
    nombre_empleado VARCHAR(255) NOT NULL, -- Nombre completo del empleado
    departamento VARCHAR(20) NOT NULL, -- Departamento al que pertenece el empleado
    correo_electronico VARCHAR(100) NOT NULL, -- Correo electrónico del empleado
    salario DECIMAL(10, 2) NOT NULL -- Salario del empleado, almacenado como valor numérico decimal
);

-- Crear tabla Empleado_Proyecto
-- Esta tabla almacena la relación entre empleados y proyectos, incluyendo la fecha de inicio del proyecto.
CREATE TABLE Empleado_Proyecto (
    id_empleado INT, -- Identificador del empleado
    proyecto VARCHAR(20), -- Nombre del proyecto
    fecha_inicio_proyecto DATE NOT NULL, -- Fecha de inicio del proyecto para el empleado
    PRIMARY KEY (id_empleado, proyecto), -- Clave primaria compuesta por id_empleado y proyecto
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado) -- Clave externa que referencia a la tabla Empleado
);

-- Crear tabla Empleado_Rol
-- Esta tabla almacena los roles de los empleados en los proyectos.
CREATE TABLE Empleado_Rol (
    id_empleado INT, -- Identificador del empleado
    rol VARCHAR(20), -- Rol del empleado
    PRIMARY KEY (id_empleado, rol), -- Clave primaria compuesta por id_empleado y rol
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado) -- Clave externa que referencia a la tabla Empleado
);

-- Crear tabla Supervisor
-- Esta tabla almacena la información del supervisor de cada empleado.
CREATE TABLE Supervisor (
    id_empleado INT, -- Identificador del empleado
    supervisor_nombre VARCHAR(255), -- Nombre del supervisor del empleado
    PRIMARY KEY (id_empleado), -- Clave primaria que también actúa como clave externa
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado) -- Clave externa que referencia a la tabla Empleado
);