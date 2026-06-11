/*
PRUEBA 2 - RECUPERATIVA
Tópicos Avanzados de Datos - 2026

IMPORTANTE: Esta prueba usa el mismo esquema de datos (Agentes, Incidentes, Asignaciones).
Ejecute el script prueba_2.sql antes de comenzar.
*/

/*
***PARTE 1 - TEÓRICA (40 puntos)***
*/

/*
Pregunta 1 (10 pts): Explica la diferencia entre un procedimiento almacenado y una función 
almacenada en PL/SQL. Luego, dado el siguiente código, indica si es un procedimiento o una 
función y explica qué hace paso a paso:

CREATE OR REPLACE _____ obtener_agente_lider(p_incidente_id IN NUMBER) _____ VARCHAR2 AS
    v_nombre Agentes.Nombre%TYPE;
BEGIN
    SELECT a.Nombre INTO v_nombre
    FROM Agentes a
    JOIN Asignaciones asi ON a.AgenteID = asi.AgenteID
    WHERE asi.IncidenteID = p_incidente_id AND asi.Rol = 'Lider';
    RETURN v_nombre;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Sin líder asignado';
END;
/

Completa los espacios en blanco y explica por qué.
*/

/*
Pregunta 2 (10 pts): Describe cómo usarías un parámetro IN OUT en un procedimiento almacenado.
Escribe un procedimiento que reciba un AgenteID (IN) y un parámetro de horas (IN OUT). 
El procedimiento debe:
- Usar el valor IN OUT como cantidad de horas a agregar
- Sumar esas horas a TODAS las asignaciones del agente (UPDATE múltiple)
- Devolver en el mismo parámetro IN OUT el nuevo TOTAL de horas del agente (suma de todas sus asignaciones)
*/

/*
Pregunta 3 (10 pts): ¿Cómo se puede usar una función almacenada dentro de una consulta SQL? 
Escribe una función que reciba un AgenteID y devuelva la cantidad de incidentes DISTINTOS 
en los que participa ese agente. Luego úsala en una consulta que liste todos los agentes 
que participan en más de 1 incidente, mostrando nombre, especialidad y cantidad de incidentes.
*/

/*
Pregunta 4 (10 pts): Explica qué es un trigger y menciona dos tipos de eventos que pueden 
dispararlo. Escribe un trigger que se dispare ANTES de insertar una asignación en la tabla 
Asignaciones y que valide lo siguiente:
- Si el incidente tiene severidad 'Critical', solo agentes con especialidad 'Pentester' o 
  'Forense Digital' pueden ser asignados.
- Si la validación falla, el trigger debe impedir la inserción con un mensaje de error.
*/

/*
***PARTE 2 - PRÁCTICA (60 puntos)***
*/

/*
Ejercicio 1 (20 pts): Escribe un procedimiento registrar_asignacion_multiple que reciba 
un IncidenteID, una lista de AgenteIDs separados por coma (VARCHAR2, ej: '101,103,105'), 
Horas y Rol (parámetros IN). El procedimiento debe:

1. Parsear la lista de agentes y por cada uno:
   a. Verificar que el agente existe.
   b. Verificar que no esté ya asignado a ese incidente.
   c. Insertar la asignación con el próximo AsignacionID disponible.
2. Actualizar el estado del incidente a 'En Proceso' si estaba en 'Abierto'.
3. Mostrar por pantalla cuántas asignaciones se registraron exitosamente y cuántas fallaron.
4. Manejar excepciones generales. Si algún agente falla, los demás deben seguir procesándose
   (no hacer ROLLBACK por un fallo individual).
*/

/*
Ejercicio 2 (20 pts): Escribe una función calcular_costo_incidente que reciba un IncidenteID 
(parámetro IN) y devuelva el costo estimado del incidente calculado como:
- Cada hora de un agente 'Pentester' cuesta 50000
- Cada hora de un agente 'Analista SOC' cuesta 35000
- Cada hora de un agente 'Forense Digital' cuesta 45000

La función debe hacer JOIN entre Asignaciones y Agentes para obtener la especialidad 
y calcular el costo total.

Luego, escribe un procedimiento reporte_costos que use la función y muestre por pantalla 
todos los incidentes con su descripción, severidad, total de horas y costo estimado.
Ordena la salida de mayor a menor costo.
*/

/*
Ejercicio 3 (20 pts): Implementa un sistema de auditoría manual usando un trigger.
Primero crea una tabla AuditoriaAsignaciones con las columnas: AuditoriaID, AsignacionID, 
AgenteID, IncidenteID, Horas, Accion ('INSERT', 'UPDATE' o 'DELETE'), CampoModificado 
(VARCHAR2, indica qué campo cambió en caso de UPDATE, NULL para INSERT/DELETE), 
ValorAnterior, ValorNuevo y FechaRegistro.

Luego crea un trigger auditar_asignaciones que se dispare después de INSERT, UPDATE o 
DELETE en la tabla Asignaciones. Para UPDATE, debe registrar específicamente qué campo 
cambió (Horas o Rol) con su valor anterior y nuevo en registros separados.
*/
