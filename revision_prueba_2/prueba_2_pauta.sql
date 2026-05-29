/*
***PARTE 1 - TEÓRICA (40 puntos)***
*/

/*

Pregunta 1: Diferencia entre Procedimiento y Función (10 puntos)
Enunciado: Explica la diferencia entre un procedimiento almacenado y una función almacenada en PL/SQL. Da un ejemplo de cuándo usarías cada uno en el contexto de la base de datos de la prueba.

Respuesta Correcta:

    Un procedimiento almacenado en PL/SQL es un bloque de código que ejecuta una serie de acciones (como INSERT, UPDATE o DELETE) y puede aceptar parámetros (IN, OUT, IN OUT), pero no devuelve un valor directamente con RETURN. Una función almacenada es un bloque de código que realiza un cálculo y devuelve un único valor usando RETURN, siendo utilizable en consultas SQL.

    Ejemplo de uso: Usaría un procedimiento para registrar una asignación en la tabla Asignaciones (Ejercicio 1), ya que implica insertar y actualizar datos sin necesidad de devolver un valor. Usaría una función para calcular el total de horas dedicadas por un agente a incidentes (Ejercicio 2), ya que necesito un valor calculado para usarlo en un procedimiento o consulta.

Criterios de Evaluación (10 puntos):

    Diferencia (5 puntos): Explicar que procedimientos ejecutan acciones y funciones devuelven valores.
    Ejemplo en Contexto (5 puntos): Proporcionar un caso de uso relevante para cada uno basado en la base de datos (Asignaciones, Agentes, etc.).

Pregunta 2: Uso de Parámetro IN OUT (10 puntos)
Enunciado: Describe cómo usarías un parámetro IN OUT en un procedimiento almacenado. Escribe un ejemplo de un procedimiento que use un parámetro IN OUT para actualizar y devolver las horas de una asignación después de un ajuste.

Respuesta Correcta:

    Usaría un parámetro IN OUT en un procedimiento para pasar un valor inicial (como las horas) que se modifica dentro del procedimiento y luego se devuelve al llamador para reflejar el cambio.

    Ejemplo:

    CREATE OR REPLACE PROCEDURE ajustar_horas_asignacion(p_asignacion_id IN NUMBER, p_horas IN OUT NUMBER) AS
    BEGIN
        UPDATE Asignaciones
        SET Horas = Horas + p_horas
        WHERE AsignacionID = p_asignacion_id;
        SELECT Horas INTO p_horas FROM Asignaciones WHERE AsignacionID = p_asignacion_id;
    END;
    /

Criterios de Evaluación (10 puntos):

    Descripción (5 puntos): Explicar que IN OUT permite pasar y retornar un valor modificado.
    Ejemplo (5 puntos): Proporcionar un procedimiento con sintaxis correcta y lógica que actualice y devuelva las horas.

Pregunta 3: Uso de Función en Consulta SQL (10 puntos)
Enunciado: ¿Cómo se puede usar una función almacenada dentro de una consulta SQL? Escribe un ejemplo de una función que calcule el total de horas asignadas a un incidente y úsala en una consulta para listar los incidentes con su total de horas.

Respuesta Correcta:

    Una función almacenada se puede usar dentro de una consulta SQL al invocarla en la cláusula SELECT, WHERE u otras, como si fuera una columna calculada.

    Ejemplo:

    CREATE OR REPLACE FUNCTION total_horas_incidente(p_incidente_id IN NUMBER) RETURN NUMBER AS
        v_total NUMBER;
    BEGIN
        SELECT SUM(Horas) INTO v_total
        FROM Asignaciones
        WHERE IncidenteID = p_incidente_id;
        RETURN NVL(v_total, 0);
    END;
    /

    SELECT IncidenteID, Descripcion, total_horas_incidente(IncidenteID) AS TotalHoras
    FROM Incidentes;

Criterios de Evaluación (10 puntos):

    Explicación (5 puntos): Describir cómo se usa en una consulta SQL (p.ej., en SELECT).
    Ejemplo (5 puntos): Proporcionar una función que calcule el valor y una consulta que la use.

Pregunta 4: Explicación de Trigger y Ejemplo (10 puntos)
Enunciado: Explica qué es un trigger y menciona dos tipos de eventos que pueden dispararlo. Da un ejemplo de un trigger que se dispare después de insertar una asignación en la tabla Asignaciones y actualice el estado del incidente a 'En Proceso' si estaba en 'Abierto'.

Respuesta Correcta:

    Un trigger es un bloque PL/SQL que se ejecuta automáticamente al ocurrir un evento específico en una tabla, como una operación DML. Dos tipos de eventos que pueden dispararlo son INSERT y DELETE.

    Ejemplo:

    CREATE OR REPLACE TRIGGER actualizar_estado_incidente
    AFTER INSERT ON Asignaciones
    FOR EACH ROW
    BEGIN
        UPDATE Incidentes
        SET Estado = 'En Proceso'
        WHERE IncidenteID = :NEW.IncidenteID
        AND Estado = 'Abierto';
    END;
    /

Criterios de Evaluación (10 puntos):

    Explicación (5 puntos): Definir un trigger y mencionar dos eventos (p.ej., INSERT, DELETE).
    Ejemplo (5 puntos): Proporcionar un trigger que actualice el estado del incidente tras un INSERT en Asignaciones.

*/

/*
***PARTE 2 - PRÁCTICA (60 puntos)***
*/

/*
Ejercicio 1: Procedimiento registrar_asignacion (20 puntos)
Enunciado: Escribe un procedimiento registrar_asignacion que reciba un AgenteID, IncidenteID, Horas y Rol (parámetros IN). El procedimiento debe:

    1. Insertar una nueva asignación en la tabla Asignaciones (usa el próximo AsignacionID disponible).
    2. Actualizar el estado del incidente a 'En Proceso' si estaba en 'Abierto'.
    3. Manejar excepciones si el agente o incidente no existen, o si el agente ya está asignado a ese incidente.
*/

CREATE OR REPLACE PROCEDURE registrar_asignacion(
    p_agente_id IN NUMBER,
    p_incidente_id IN NUMBER,
    p_horas IN NUMBER,
    p_rol IN VARCHAR2
) AS
    v_nuevo_id NUMBER;
    v_existe_agente NUMBER;
    v_existe_incidente NUMBER;
    v_ya_asignado NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_existe_agente FROM Agentes WHERE AgenteID = p_agente_id;
    IF v_existe_agente = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El agente no existe.');
    END IF;

    SELECT COUNT(*) INTO v_existe_incidente FROM Incidentes WHERE IncidenteID = p_incidente_id;
    IF v_existe_incidente = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'El incidente no existe.');
    END IF;

    SELECT COUNT(*) INTO v_ya_asignado FROM Asignaciones
    WHERE AgenteID = p_agente_id AND IncidenteID = p_incidente_id;
    IF v_ya_asignado > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'El agente ya está asignado a este incidente.');
    END IF;

    SELECT NVL(MAX(AsignacionID), 0) + 1 INTO v_nuevo_id FROM Asignaciones;

    INSERT INTO Asignaciones (AsignacionID, AgenteID, IncidenteID, Horas, Rol)
    VALUES (v_nuevo_id, p_agente_id, p_incidente_id, p_horas, p_rol);

    UPDATE Incidentes
    SET Estado = 'En Proceso'
    WHERE IncidenteID = p_incidente_id
    AND Estado = 'Abierto';

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/

/*
Criterios de Evaluación (20 puntos):

    Inserción (5 puntos): Insertar una asignación con un AsignacionID calculado.
    Actualización de Estado (5 puntos): Actualizar el estado del incidente a 'En Proceso' si estaba 'Abierto'.
    Validaciones (5 puntos): Verificar existencia de agente e incidente, y que no esté ya asignado.
    Manejo de Excepciones (5 puntos): Usar RAISE_APPLICATION_ERROR o EXCEPTION para manejar errores.
*/

/*
Ejercicio 2: Función y Procedimiento (20 puntos)
Enunciado: Escribe una función calcular_horas_agente que reciba un AgenteID (parámetro IN) y devuelva el total de horas asignadas a ese agente en todos los incidentes. Luego, usa la función en un procedimiento mostrar_carga_agentes que muestre el total de horas por agente para todos los agentes, indicando su nombre y especialidad.
*/

CREATE OR REPLACE FUNCTION calcular_horas_agente(p_agente_id IN NUMBER) RETURN NUMBER AS
    v_total NUMBER;
BEGIN
    SELECT SUM(Horas) INTO v_total
    FROM Asignaciones
    WHERE AgenteID = p_agente_id;
    RETURN NVL(v_total, 0);
END;
/

CREATE OR REPLACE PROCEDURE mostrar_carga_agentes AS
    CURSOR c_agentes IS SELECT AgenteID, Nombre, Especialidad FROM Agentes;
BEGIN
    FOR rec IN c_agentes LOOP
        DBMS_OUTPUT.PUT_LINE('Agente: ' || rec.Nombre || ' (' || rec.Especialidad || ') - Total Horas: ' || calcular_horas_agente(rec.AgenteID));
    END LOOP;
END;
/

/*
Criterios de Evaluación (20 puntos):

    Función (10 puntos): Calcular y devolver el total de horas con SUM (5 pts). Usar NVL para manejar NULL (2 pts). Sintaxis correcta (3 pts).
    Procedimiento (10 puntos): Usar un cursor para recorrer agentes (5 pts). Invocar la función y mostrar resultados con DBMS_OUTPUT (5 pts).
*/

/*
Ejercicio 3: Trigger auditar_asignaciones (20 puntos)
Enunciado: Implementa un sistema de auditoría manual usando un trigger. Para esto, primero crea una tabla llamada AuditoriaAsignaciones con las columnas necesarias. Luego, crea un trigger auditar_asignaciones que se dispare después de insertar o eliminar una asignación en la tabla Asignaciones. El trigger debe registrar en la tabla de auditoría el AsignacionID, AgenteID, IncidenteID, Horas, la acción realizada ('INSERT' o 'DELETE') y la fecha del registro.
*/

CREATE TABLE AuditoriaAsignaciones (
    AuditoriaID NUMBER PRIMARY KEY,
    AsignacionID NUMBER,
    AgenteID NUMBER,
    IncidenteID NUMBER,
    Horas NUMBER,
    Accion VARCHAR2(10),
    FechaRegistro DATE
);

CREATE SEQUENCE seq_auditoria START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER auditar_asignaciones
AFTER INSERT OR DELETE ON Asignaciones
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        INSERT INTO AuditoriaAsignaciones (AuditoriaID, AsignacionID, AgenteID, IncidenteID, Horas, Accion, FechaRegistro)
        VALUES (seq_auditoria.NEXTVAL, :NEW.AsignacionID, :NEW.AgenteID, :NEW.IncidenteID, :NEW.Horas, 'INSERT', SYSDATE);
    ELSIF DELETING THEN
        INSERT INTO AuditoriaAsignaciones (AuditoriaID, AsignacionID, AgenteID, IncidenteID, Horas, Accion, FechaRegistro)
        VALUES (seq_auditoria.NEXTVAL, :OLD.AsignacionID, :OLD.AgenteID, :OLD.IncidenteID, :OLD.Horas, 'DELETE', SYSDATE);
    END IF;
END;
/

/*
Criterios de Evaluación (20 puntos):

    Creación de Tabla (10 puntos): Crear AuditoriaAsignaciones con las columnas solicitadas (AsignacionID, AgenteID, IncidenteID, Horas, Accion, FechaRegistro).
    Trigger (10 puntos): Implementar un trigger AFTER INSERT OR DELETE con FOR EACH ROW (3 pts). Usar :NEW para INSERT y :OLD para DELETE (4 pts). Registrar la acción correcta ('INSERT' o 'DELETE') con SYSDATE (3 pts).
*/
