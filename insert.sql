
-- Base de datos no normalizada
Use empleado_proyecto;

INSERT INTO Empleado_NM (nombre_empleado, departamento, correo_electronico, proyectos, roles, fecha_inicio_proyecto, salario, Supervisor)
VALUES 
('Juan Pérez', 'Desarrollo', 'juan.perez@example.com', 'Proyecto A', 'Desarrollador', '2024-01-15', '1000', 'Ana Gómez'),
('Laura Martínez', 'Diseño', 'laura.martinez@example.com', 'Proyecto B', 'Diseñadora', '2024-02-01', '1200', 'Carlos Fernández'),
('Pedro Sánchez', 'Marketing', 'pedro.sanchez@example.com', 'Proyecto C', 'Marketing', '2024-03-10', '1100', 'Luis Rodríguez'),
('María López', 'Desarrollo', 'maria.lopez@example.com', 'Proyecto A', 'Desarrolladora', '2024-01-20', '1050', 'Ana Gómez'),
('Jorge Ramírez', 'Soporte', 'jorge.ramirez@example.com', 'Proyecto D', 'Soporte Técnico', '2024-04-05', '950', 'Sofía Morales'),
('Sofía Morales', 'Soporte', 'sofia.morales@example.com', 'Proyecto D', 'Jefa de Soporte', '2024-01-30', '1300', 'Luis Rodríguez'),
('Esteban Vargas', 'Administración', 'esteban.vargas@example.com', 'Proyecto E', 'Administrador', '2024-02-15', '1150', 'Carlos Fernández'),
('Gabriela Gómez', 'Ventas', 'gabriela.gomez@example.com', 'Proyecto F', 'Ejecutiva de Ventas', '2024-03-25', '1000', 'Ana Gómez'),
('Andrés Díaz', 'Desarrollo', 'andres.diaz@example.com', 'Proyecto G', 'Desarrollador Junior', '2024-05-01', '900', 'Ana Gómez'),
('Claudia Pérez', 'Diseño', 'claudia.perez@example.com', 'Proyecto H', 'Diseñadora Senior', '2024-06-10', '1400', 'Luis Rodríguez');

-- Basde de datos normalizada
Use empleado_proyecto_normalizado;

INSERT INTO Empleado (nombre_empleado, departamento, correo_electronico, salario) VALUES
('Juan Pérez', 'Ventas', 'juan.perez@empresa.com', 1500.00),
('María González', 'Marketing', 'maria.gonzalez@empresa.com', 1600.00),
('Carlos Rodríguez', 'IT', 'carlos.rodriguez@empresa.com', 1800.00),
('Ana López', 'Finanzas', 'ana.lopez@empresa.com', 1700.00),
('Luis Fernández', 'Ventas', 'luis.fernandez@empresa.com', 1550.00),
('Laura Martínez', 'Marketing', 'laura.martinez@empresa.com', 1650.00),
('Pedro Morales', 'IT', 'pedro.morales@empresa.com', 1750.00),
('Sofía Torres', 'Finanzas', 'sofia.torres@empresa.com', 1850.00),
('Javier Ruiz', 'Ventas', 'javier.ruiz@empresa.com', 1600.00),
('Claudia Sánchez', 'Marketing', 'claudia.sanchez@empresa.com', 1700.00);

INSERT INTO Empleado_Proyecto (id_empleado, proyecto, fecha_inicio_proyecto) VALUES
(1, 'Proyecto A', '2024-01-10'),
(2, 'Proyecto B', '2024-02-15'),
(3, 'Proyecto C', '2024-03-20'),
(4, 'Proyecto D', '2024-04-25'),
(5, 'Proyecto A', '2024-05-30'),
(6, 'Proyecto B', '2024-06-15'),
(7, 'Proyecto C', '2024-07-20'),
(8, 'Proyecto D', '2024-08-25'),
(9, 'Proyecto A', '2024-09-30'),
(10, 'Proyecto B', '2024-10-15');


INSERT INTO Empleado_Rol (id_empleado, rol) VALUES
(1, 'Vendedor'),
(2, 'Analista'),
(3, 'Desarrollador'),
(4, 'Contador'),
(5, 'Vendedor'),
(6, 'Analista'),
(7, 'Desarrollador'),
(8, 'Contador'),
(9, 'Vendedor'),
(10, 'Analista');

INSERT INTO Supervisor (id_empleado, supervisor_nombre) VALUES
(1, 'Roberto Díaz'),
(2, 'Sandra Pérez'),
(3, 'Diego Hernández'),
(4, 'Carmen García'),
(5, 'Roberto Díaz'),
(6, 'Sandra Pérez'),
(7, 'Diego Hernández'),
(8, 'Carmen García'),
(9, 'Roberto Díaz'),
(10, 'Sandra Pérez');
