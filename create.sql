CREATE DATABASE `empleado_proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

Use empleado_proyecto;


create table Empleado_NM (
	id_empleado INT AUTO_INCREMENT PRIMARY KEY,
	nombre_empleado VARCHAR(255) NOT NULL, 
    departamento VARCHAR(20)NOT NULL, 
    correo_electronico VARCHAR(100)NOT NULL,
    proyectos VARCHAR(20),
    roles VARCHAR(20),
    fecha_inicio_proyecto DATE NOT NULL,
    salario VARCHAR(20),
    Supervisor VARCHAR(20)
    );
    

    
    

