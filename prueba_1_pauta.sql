/*
***PARTE 1 - TEORICA (40 puntos)***
*/

/*

Pregunta 1: Relación Muchos a Muchos y su Implementación (10 puntos)

Enunciado: Explica qué es una relación muchos a muchos y cómo se implementa en una base de datos relacional. Usa un ejemplo basado en las tablas del esquema creado para la prueba.

Respuesta Correcta:

    Una relación muchos a muchos en una base de datos relacional ocurre cuando múltiples registros de una tabla A pueden relacionarse con múltiples registros de una tabla B, y viceversa. Esto significa que cada registro de A puede estar asociado con varios registros de B, y cada registro de B puede estar asociado con varios registros de A.
    Para implementar una relación muchos a muchos, se utiliza una tabla intermedia que contiene las claves primarias de ambas tablas como claves foráneas, permitiendo conectar los registros de ambas tablas. Esta tabla intermedia puede incluir columnas adicionales para describir la relación.
    En el esquema de la prueba, un ejemplo de relación muchos a muchos es entre las tablas Agentes e Incidentes. Un agente puede trabajar en varios incidentes, y un incidente puede tener varios agentes asignados. Esto se implementa mediante la tabla intermedia Asignaciones, que tiene las columnas AgenteID (clave foránea que referencia a Agentes) e IncidenteID (clave foránea que referencia a Incidentes). Además, Asignaciones incluye las columnas Horas y Rol para registrar las horas dedicadas y el rol de cada agente en cada incidente.

Criterios de Evaluación (10 puntos):

    Definición Correcta (3 puntos): Explicar que una relación muchos a muchos implica que múltiples registros de una tabla se relacionan con múltiples registros de otra.
    Explicación de la Implementación (3 puntos): Mencionar que se usa una tabla intermedia con claves foráneas de ambas tablas.
    Ejemplo Correcto (3 puntos): Identificar la relación entre Agentes e Incidentes a través de Asignaciones, con detalles específicos (columnas AgenteID e IncidenteID).
    Precisión y Claridad (1 punto): Redacción técnica y clara.

Pregunta 2: Vistas y Consulta para Total de Horas por Incidente (10 puntos)

Enunciado: Describe qué es una vista y cómo la usarías para mostrar el total de horas dedicadas por incidente, incluyendo la descripción del incidente y su severidad. Escribe la consulta SQL para crear la vista (no es necesario ejecutarla).

Respuesta Correcta:

    Una vista en una base de datos es una tabla virtual creada a partir de una consulta SQL, que no almacena datos físicamente, sino que muestra los resultados de las tablas subyacentes en tiempo real. Las vistas se utilizan para simplificar consultas complejas, mejorar la seguridad al restringir el acceso a ciertas columnas o filas, y presentar datos de manera organizada.
    Para mostrar el total de horas dedicadas por incidente, incluyendo la descripción y severidad, usaría una vista para encapsular una consulta que calcule la suma de horas por incidente. Esto permite consultar los datos fácilmente con una instrucción simple como SELECT * FROM vista_horas_incidente;, sin necesidad de repetir la consulta compleja.

    Consulta SQL para crear la vista:

    CREATE OR REPLACE VIEW vista_horas_incidente AS
    SELECT i.Descripcion, i.Severidad, SUM(a.Horas) AS TotalHoras
    FROM Incidentes i
    JOIN Asignaciones a ON i.IncidenteID = a.IncidenteID
    GROUP BY i.Descripcion, i.Severidad;

Criterios de Evaluación (10 puntos):

    Definición Correcta (3 puntos): Explicar que una vista es una tabla virtual basada en una consulta, que no almacena datos físicamente.
    Uso Adecuado (2 puntos): Describir cómo se usaría para mostrar el total de horas por incidente (por ejemplo, con una consulta simple).
    Consulta SQL Correcta (4 puntos):
        Usar CREATE OR REPLACE VIEW (1 punto).
        Incluir un JOIN entre Incidentes y Asignaciones con la condición correcta (1 punto).
        Usar SUM(a.Horas) y GROUP BY i.Descripcion, i.Severidad para calcular el total (2 puntos).
    Precisión y Claridad (1 punto): Redacción clara y consulta sin errores.

Pregunta 3: Excepciones Predefinidas en PL/SQL y Ejemplo con NO_DATA_FOUND (10 puntos)

Enunciado: ¿Qué es una excepción predefinida en PL/SQL y cómo se maneja? Da un ejemplo de cómo manejarías la excepción NO_DATA_FOUND en un bloque PL/SQL.

Respuesta Correcta:

    Una excepción predefinida en PL/SQL es un error identificado y nombrado por Oracle que se lanza automáticamente cuando ocurre una condición específica durante la ejecución del código. Estas excepciones se manejan en un bloque EXCEPTION dentro de un bloque PL/SQL, permitiendo al programador controlar el flujo del programa y evitar que el código falle abruptamente.
    La excepción NO_DATA_FOUND se lanza cuando una consulta SELECT INTO no devuelve ninguna fila. Para manejarla, se usa un bloque EXCEPTION con WHEN NO_DATA_FOUND para capturar el error y ejecutar una acción alternativa, como mostrar un mensaje al usuario.

    Ejemplo de manejo de NO_DATA_FOUND:

    DECLARE
        v_descripcion Incidentes.Descripcion%TYPE;
    BEGIN
        SELECT Descripcion INTO v_descripcion
        FROM Incidentes
        WHERE IncidenteID = 999; -- ID que no existe
        DBMS_OUTPUT.PUT_LINE('Incidente encontrado: ' || v_descripcion);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No se encontraron datos para el incidente especificado.');
    END;
    /

Criterios de Evaluación (10 puntos):

    Definición Correcta (3 puntos): Explicar que una excepción predefinida es un error identificado por Oracle y que se maneja en un bloque EXCEPTION.
    Uso de NO_DATA_FOUND (2 puntos): Describir que NO_DATA_FOUND se lanza cuando un SELECT INTO no devuelve datos.
    Ejemplo Correcto (4 puntos):
        Incluir un bloque PL/SQL completo (DECLARE, BEGIN, EXCEPTION, END) (2 puntos).
        Usar WHEN NO_DATA_FOUND para manejar la excepción (1 punto).
        Mostrar una acción adecuada, como un mensaje (1 punto).
    Precisión y Claridad (1 punto): Redacción clara y ejemplo funcional.

Pregunta 4: Cursor Explícito y Atributos (10 puntos)

Enunciado: Explica qué es un cursor explícito y cómo se usa en PL/SQL. Menciona al menos dos atributos de cursor (como %NOTFOUND) y su propósito.

Respuesta Correcta:

    Un cursor explícito en PL/SQL es un mecanismo que permite declarar una consulta SQL y procesar sus resultados fila por fila, controlando manualmente las operaciones de apertura, recorrido y cierre. Se usa cuando se necesita manejar múltiples filas de una consulta de manera programática, como en un bucle.
    Para usar un cursor explícito, se siguen estos pasos:

        Declarar el cursor: CURSOR nombre IS SELECT ...;
        Abrir el cursor: OPEN nombre;
        Recorrer las filas: Usar FETCH para recuperar datos y un bucle con %NOTFOUND para salir cuando no hay más filas.
        Cerrar el cursor: CLOSE nombre;

    Dos atributos de cursor y su propósito:

        %NOTFOUND: Devuelve TRUE si la última operación FETCH no recuperó ninguna fila, lo que indica que se han procesado todas las filas. Se usa para salir de un bucle.
        %ROWCOUNT: Devuelve el número de filas recuperadas hasta el momento por el cursor, útil para contar cuántas filas se han procesado.

Criterios de Evaluación (10 puntos):

    Definición Correcta (3 puntos): Explicar que un cursor explícito permite procesar filas de una consulta manualmente.
    Uso del Cursor (3 puntos): Describir los pasos: declarar, abrir, recorrer (FETCH con %NOTFOUND), cerrar.
    Atributos Correctos (3 puntos): Mencionar dos atributos como %NOTFOUND y %ROWCOUNT, con su propósito (1.5 puntos cada uno).
    Precisión y Claridad (1 punto): Redacción técnica y clara.

*/

/*
***PARTE 2 - PRACTICA (60 puntos)***
*/

/*
Ejercicio 1: Cursor Explícito para Listar Especialidades con Promedio de Horas Mayor a 30 (20 puntos)

Enunciado: Escribe un bloque PL/SQL con un cursor explícito que liste las especialidades de agentes cuyo promedio de horas asignadas a incidentes sea mayor a 30, mostrando la especialidad y el promedio de horas. Usa un JOIN entre Agentes y Asignaciones.
*/

DECLARE
    CURSOR c_especialidad_horas IS
        SELECT ag.Especialidad, AVG(a.Horas) AS promedio_horas
        FROM Agentes ag
        JOIN Asignaciones a ON ag.AgenteID = a.AgenteID
        GROUP BY ag.Especialidad
        HAVING AVG(a.Horas) > 30;
    v_especialidad Agentes.Especialidad%TYPE;
    v_promedio NUMBER;
BEGIN
    OPEN c_especialidad_horas;
    LOOP
        FETCH c_especialidad_horas INTO v_especialidad, v_promedio;
        EXIT WHEN c_especialidad_horas%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Especialidad: ' || v_especialidad || ' - Promedio Horas: ' || ROUND(v_promedio, 2));
    END LOOP;
    CLOSE c_especialidad_horas;
END;
/

/*
Explicación:

    Declara un cursor explícito que calcula el promedio de horas por especialidad, filtrando aquellas con promedio mayor a 30.
    Usa un JOIN entre Agentes y Asignaciones.
    Procesa las filas manualmente con OPEN, FETCH, EXIT WHEN %NOTFOUND, y CLOSE.
    Muestra la especialidad y el promedio de horas.

Resultado esperado con los datos de prueba:
    - Pentester: (40 + 35 + 25) / 3 = 33.33 -> SI cumple
    - Analista SOC: (35 + 20 + 25 + 30) / 4 = 27.5 -> NO cumple
    - Forense Digital: (45 + 20) / 2 = 32.5 -> SI cumple

    Especialidad: Pentester - Promedio Horas: 33.33
    Especialidad: Forense Digital - Promedio Horas: 32.5

Criterios de Evaluación (20 puntos):

    Definición del Cursor (5 puntos): Consulta correcta con JOIN, GROUP BY, y HAVING (2 puntos); seleccionar solo las columnas necesarias (Especialidad y promedio) (3 puntos).
    Uso del Cursor Explícito (5 puntos): Manejo manual con OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE (5 puntos). Nota: El uso de FOR ... LOOP es válido, pero se esperaba manejo manual (puede restar 1-2 puntos si se usa FOR ... LOOP).
    Salida Correcta (5 puntos): Mostrar la especialidad y el promedio (5 puntos).
    Estructura y Funcionalidad (5 puntos): Código bien estructurado y funcional (5 puntos).
*/

/*
Ejercicio 2: Cursor Explícito con FOR UPDATE para Aumentar Horas en Incidentes Critical (20 puntos)

Enunciado: Escribe un bloque PL/SQL con un cursor explícito que aumente en 10 las horas de todas las asignaciones asociadas a incidentes con severidad 'Critical'. Usa FOR UPDATE y maneja excepciones.
*/

DECLARE
    CURSOR c_critical IS
        SELECT a.AsignacionID, a.Horas
        FROM Asignaciones a
        JOIN Incidentes i ON a.IncidenteID = i.IncidenteID
        WHERE i.Severidad = 'Critical'
        FOR UPDATE OF a.Horas;
    v_asignacion_id Asignaciones.AsignacionID%TYPE;
    v_horas Asignaciones.Horas%TYPE;
BEGIN
    OPEN c_critical;
    LOOP
        FETCH c_critical INTO v_asignacion_id, v_horas;
        EXIT WHEN c_critical%NOTFOUND;
        UPDATE Asignaciones
        SET Horas = v_horas + 10
        WHERE CURRENT OF c_critical;
        DBMS_OUTPUT.PUT_LINE('Asignacion ID: ' || v_asignacion_id || ' actualizada de ' || v_horas || ' a ' || (v_horas + 10) || ' horas.');
    END LOOP;
    CLOSE c_critical;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/

/*
Explicación:

    Declara un cursor explícito que selecciona asignaciones asociadas a incidentes con severidad 'Critical', usando FOR UPDATE OF a.Horas.
    Procesa las filas manualmente y actualiza las horas sumando 10 con WHERE CURRENT OF.
    Maneja excepciones con WHEN OTHERS y revierte los cambios con ROLLBACK en caso de error.

Resultado esperado con los datos de prueba (Incidentes Critical: 201 y 204):
    Asignacion ID: 1 actualizada de 40 a 50 horas.   (Agente 101, Incidente 201)
    Asignacion ID: 2 actualizada de 35 a 45 horas.   (Agente 102, Incidente 201)
    Asignacion ID: 6 actualizada de 45 a 55 horas.   (Agente 104, Incidente 204)
    Asignacion ID: 7 actualizada de 35 a 45 horas.   (Agente 101, Incidente 204)
    Asignacion ID: 9 actualizada de 20 a 30 horas.   (Agente 104, Incidente 201)

Criterios de Evaluación (20 puntos):

    Definición del Cursor (5 puntos): Consulta correcta con JOIN a Incidentes, WHERE Severidad = 'Critical' y FOR UPDATE (5 puntos).
    Uso del Cursor Explícito (5 puntos): Manejo manual con OPEN, FETCH, EXIT WHEN %NOTFOUND, CLOSE (5 puntos).
    Actualización Correcta (5 puntos): Aumento de 10 horas usando WHERE CURRENT OF (5 puntos).
    Manejo de Excepciones (3 puntos): Usar WHEN OTHERS y mostrar el error (2 puntos); incluir ROLLBACK (1 punto).
    Estructura y Funcionalidad (2 puntos): Código funcional y bien estructurado (2 puntos).
*/

/*
Ejercicio 3: Tipo de Objeto, Tabla de Objetos, y Cursor Explícito (20 puntos)

Enunciado: Crea un tipo de objeto incidente_obj con atributos incidente_id, descripcion, y un método get_reporte. Luego, crea una tabla basada en ese tipo y transfiere los datos de Incidentes a esa tabla. Finalmente, escribe un cursor explícito que liste la información de los incidentes usando el método get_reporte.
*/

-- Crear el tipo de objeto
CREATE OR REPLACE TYPE incidente_obj AS OBJECT (
    incidente_id NUMBER,
    descripcion VARCHAR2(100),
    MEMBER FUNCTION get_reporte RETURN VARCHAR2
);
/

-- Crear el cuerpo del tipo
CREATE OR REPLACE TYPE BODY incidente_obj AS
    MEMBER FUNCTION get_reporte RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Incidente #' || incidente_id || ': ' || descripcion;
    END;
END;
/

-- Crear la tabla basada en el tipo
CREATE TABLE incidente_obj_tab OF incidente_obj (
    incidente_id PRIMARY KEY
);

-- Transferir los datos de Incidentes
INSERT INTO incidente_obj_tab (incidente_id, descripcion)
SELECT IncidenteID, Descripcion
FROM Incidentes;
COMMIT;

-- Listar los datos con un cursor explícito
DECLARE
    CURSOR c_incidentes IS
        SELECT VALUE(i) FROM incidente_obj_tab i;
    v_incidente incidente_obj;
BEGIN
    OPEN c_incidentes;
    LOOP
        FETCH c_incidentes INTO v_incidente;
        EXIT WHEN c_incidentes%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_incidente.get_reporte());
    END LOOP;
    CLOSE c_incidentes;
END;
/

/*
Explicación:

    Crea un tipo de objeto incidente_obj con los atributos incidente_id y descripcion, y el método get_reporte.
    Crea una tabla incidente_obj_tab basada en el tipo, con una clave primaria.
    Transfiere los datos de Incidentes a la tabla usando INSERT ... SELECT.
    Usa un cursor explícito con SELECT VALUE(i) para listar los datos, invocando el método get_reporte.

Resultado esperado:
    Incidente #201: Ransomware LockBit en servidor de archivos
    Incidente #202: Campaña de Phishing dirigida a RRHH
    Incidente #203: DDoS en portal web institucional
    Incidente #204: SQL Injection en API de pagos
    Incidente #205: Exfiltracion de datos via DNS tunneling

Criterios de Evaluación (20 puntos):

    Creación del Tipo (5 puntos): Sintaxis correcta con AS OBJECT y definición del método (3 puntos); implementación correcta del método get_reporte (2 puntos).
    Creación de la Tabla (3 puntos): Usar OF incidente_obj con clave primaria (3 puntos).
    Transferencia de Datos (4 puntos): Usar INSERT para transferir los datos de Incidentes (4 puntos).
    Uso del Cursor Explícito (5 puntos): Manejo manual con SELECT VALUE(i), FETCH, EXIT WHEN %NOTFOUND, y uso de get_reporte (5 puntos).
    Estructura y Funcionalidad (3 puntos): Código funcional y bien estructurado (3 puntos).
*/
