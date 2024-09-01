-- Seleccionar la base de datos no normalizada para su uso
USE empleado_proyecto;

-- Obtener todos los registros de la tabla Empleado_NM
-- Esta consulta devuelve todos los datos almacenados en la tabla no normalizada.
SELECT * FROM Empleado_NM;

-- Seleccionar la base de datos normalizada para su uso
USE empleado_proyecto_normalizado;

-- Obtener todos los registros de la tabla Empleado
-- Esta consulta devuelve toda la información básica de los empleados.
SELECT * FROM Empleado;

-- Obtener el nombre del empleado, el proyecto y la fecha de inicio del proyecto para un empleado específico
-- Esta consulta une las tablas Empleado y Empleado_Proyecto para mostrar el nombre del empleado, el proyecto y la fecha de inicio para el empleado con id_empleado = 1.
SELECT e.nombre_empleado, ep.proyecto, ep.fecha_inicio_proyecto
FROM Empleado e
JOIN Empleado_Proyecto ep ON e.id_empleado = ep.id_empleado
WHERE e.id_empleado = 1;

-- Obtener el nombre del empleado y su rol para un empleado específico
-- Esta consulta une las tablas Empleado y Empleado_Rol para mostrar el nombre del empleado y su rol para el empleado con id_empleado = 2.
SELECT e.nombre_empleado, er.rol
FROM Empleado e
JOIN Empleado_Rol er ON e.id_empleado = er.id_empleado
WHERE e.id_empleado = 2;

-- Obtener el nombre del empleado y el nombre de su supervisor para un empleado específico
-- Esta consulta une las tablas Empleado y Supervisor para mostrar el nombre del empleado y el nombre de su supervisor para el empleado con id_empleado = 3.
SELECT e.nombre_empleado, s.supervisor_nombre
FROM Empleado e
JOIN Supervisor s ON e.id_empleado = s.id_empleado
WHERE e.id_empleado = 3;

-- Obtener los nombres de los empleados que están involucrados en un proyecto específico
-- Esta consulta une las tablas Empleado y Empleado_Proyecto para mostrar el nombre de los empleados que están involucrados en 'Proyecto A'.
SELECT e.nombre_empleado
FROM Empleado e
JOIN Empleado_Proyecto ep ON e.id_empleado = ep.id_empleado
WHERE ep.proyecto = 'Proyecto A';

-- Obtener el nombre del empleado, su rol y el proyecto en el que está involucrado
-- Esta consulta une las tablas Empleado, Empleado_Rol y Empleado_Proyecto usando LEFT JOIN para incluir empleados sin roles o proyectos asociados. Se filtra por el empleado con id_empleado = 4.
SELECT e.nombre_empleado, er.rol, ep.proyecto
FROM Empleado e
LEFT JOIN Empleado_Rol er ON e.id_empleado = er.id_empleado
LEFT JOIN Empleado_Proyecto ep ON e.id_empleado = ep.id_empleado
WHERE e.id_empleado = 4;

-- Obtener todos los empleados del departamento de 'Ventas'
-- Esta consulta filtra los empleados de la tabla Empleado que pertenecen al departamento 'Ventas'.
SELECT * FROM Empleado
WHERE departamento = 'Ventas';

-- Obtener el nombre del empleado, su salario y la fecha de inicio del proyecto para un proyecto específico
-- Esta consulta une las tablas Empleado y Empleado_Proyecto para mostrar el nombre del empleado, su salario y la fecha de inicio del proyecto para empleados involucrados en 'Proyecto B'.
SELECT e.nombre_empleado, e.salario, ep.fecha_inicio_proyecto
FROM Empleado e
JOIN Empleado_Proyecto ep ON e.id_empleado = ep.id_empleado
WHERE ep.proyecto = 'Proyecto B';

-- Obtener el nombre del empleado, su supervisor y su rol
-- Esta consulta utiliza LEFT JOIN para unir las tablas Empleado, Supervisor, y Empleado_Rol, devolviendo los nombres de empleados, sus supervisores y roles, incluso si algunos de estos datos están ausentes.
SELECT e.nombre_empleado, s.supervisor_nombre, er.rol
FROM Empleado e
LEFT JOIN Supervisor s ON e.id_empleado = s.id_empleado
LEFT JOIN Empleado_Rol er ON e.id_empleado = er.id_empleado;

-- Contar el número de empleados en cada proyecto
-- Esta consulta agrupa por proyecto y cuenta el número de empleados involucrados en cada uno.
SELECT ep.proyecto, COUNT(ep.id_empleado) AS num_empleados
FROM Empleado_Proyecto ep
GROUP BY ep.proyecto;

-- Obtener el nombre del proyecto y la fecha de inicio para los empleados con un rol específico ('Analista')
-- Esta consulta une las tablas Empleado, Empleado_Proyecto y Empleado_Rol para obtener la fecha de inicio del proyecto filtrando por el rol 'Analista'.
SELECT ep.proyecto, ep.fecha_inicio_proyecto
FROM Empleado e
JOIN Empleado_Proyecto ep ON e.id_empleado = ep.id_empleado
JOIN Empleado_Rol er ON e.id_empleado = er.id_empleado
WHERE er.rol = 'Analista';

-- Obtener el nombre del proyecto y la fecha de inicio para los empleados con un rol específico ('Desarrollador')
-- Similar a la consulta anterior, pero filtrando por el rol 'Desarrollador'.
SELECT ep.proyecto, ep.fecha_inicio_proyecto
FROM Empleado e
JOIN Empleado_Proyecto ep ON e.id_empleado = ep.id_empleado
JOIN Empleado_Rol er ON e.id_empleado = er.id_empleado
WHERE er.rol = 'Desarrollador';

-- Calcular el costo total de un proyecto basado en los salarios de los empleados involucrados
-- Esta consulta suma los salarios de todos los empleados que trabajan en 'Proyecto B' para calcular el costo total del proyecto.
SELECT ep.proyecto, SUM(e.salario) AS costo_total
FROM Empleado e
JOIN Empleado_Proyecto ep ON e.id_empleado = ep.id_empleado
WHERE ep.proyecto = 'Proyecto B'
GROUP BY ep.proyecto;