-- Script para crear y poblar la base de datos para la evaluación PAR de Tópicos Avanzados de Bases de Datos
-- Ejecutar en Oracle SQL Developer en el esquema del estudiante

SET SERVEROUTPUT ON;

-- Eliminar tablas si ya existen
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Asignaciones CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Incidentes CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Agentes CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Crear tabla Agentes
CREATE TABLE Agentes (
    AgenteID     NUMBER PRIMARY KEY,
    Nombre       VARCHAR2(50),
    Especialidad VARCHAR2(50),
    FechaIngreso DATE
);

-- Crear tabla Incidentes
CREATE TABLE Incidentes (
    IncidenteID    NUMBER PRIMARY KEY,
    Descripcion    VARCHAR2(100),
    Severidad      VARCHAR2(20),
    Estado         VARCHAR2(20),
    FechaDeteccion DATE
);

-- Crear tabla Asignaciones
CREATE TABLE Asignaciones (
    AsignacionID NUMBER PRIMARY KEY,
    AgenteID     NUMBER,
    IncidenteID  NUMBER,
    Horas        NUMBER,
    Rol          VARCHAR2(30),
    CONSTRAINT fk_asig_agente    FOREIGN KEY (AgenteID)    REFERENCES Agentes(AgenteID),
    CONSTRAINT fk_asig_incidente FOREIGN KEY (IncidenteID) REFERENCES Incidentes(IncidenteID)
);

-- Insertar datos en Agentes
INSERT INTO Agentes VALUES (101, 'Camila Reyes',     'Pentester',       TO_DATE('2023-03-15','YYYY-MM-DD'));
INSERT INTO Agentes VALUES (102, 'Diego Muñoz',      'Analista SOC',    TO_DATE('2022-07-01','YYYY-MM-DD'));
INSERT INTO Agentes VALUES (103, 'Valentina Soto',   'Analista SOC',    TO_DATE('2024-01-10','YYYY-MM-DD'));
INSERT INTO Agentes VALUES (104, 'Matías Fernández', 'Forense Digital', TO_DATE('2021-11-20','YYYY-MM-DD'));
INSERT INTO Agentes VALUES (105, 'Francisca López',  'Pentester',       TO_DATE('2023-08-05','YYYY-MM-DD'));

-- Insertar datos en Incidentes
INSERT INTO Incidentes VALUES (201, 'Ransomware LockBit en servidor de archivos', 'Critical', 'Abierto',  TO_DATE('2026-03-01','YYYY-MM-DD'));
INSERT INTO Incidentes VALUES (202, 'Campaña de Phishing dirigida a RRHH',        'High',     'Abierto',  TO_DATE('2026-03-03','YYYY-MM-DD'));
INSERT INTO Incidentes VALUES (203, 'DDoS en portal web institucional',            'High',     'Cerrado',  TO_DATE('2026-03-20','YYYY-MM-DD'));
INSERT INTO Incidentes VALUES (204, 'SQL Injection en API de pagos',               'Critical', 'Abierto',  TO_DATE('2026-04-05','YYYY-MM-DD'));
INSERT INTO Incidentes VALUES (205, 'Exfiltración de datos via DNS tunneling',     'Medium',   'Cerrado',  TO_DATE('2026-04-10','YYYY-MM-DD'));
INSERT INTO Incidentes VALUES (206, 'Acceso no autorizado a base de datos',        'Critical', 'Abierto',  TO_DATE('2026-05-02','YYYY-MM-DD'));
INSERT INTO Incidentes VALUES (207, 'Malware en estaciones de trabajo',            'Medium',   'Cerrado',  TO_DATE('2026-05-15','YYYY-MM-DD'));

-- Insertar datos en Asignaciones
INSERT INTO Asignaciones VALUES (1,  101, 201, 40, 'Lider');
INSERT INTO Asignaciones VALUES (2,  102, 201, 35, 'Apoyo');
INSERT INTO Asignaciones VALUES (3,  102, 202, 20, 'Lider');
INSERT INTO Asignaciones VALUES (4,  103, 202, 25, 'Apoyo');
INSERT INTO Asignaciones VALUES (5,  103, 203, 30, 'Lider');
INSERT INTO Asignaciones VALUES (6,  104, 204, 45, 'Lider');
INSERT INTO Asignaciones VALUES (7,  101, 204, 35, 'Apoyo');
INSERT INTO Asignaciones VALUES (8,  105, 205, 25, 'Lider');
INSERT INTO Asignaciones VALUES (9,  104, 201, 20, 'Apoyo');
INSERT INTO Asignaciones VALUES (10, 102, 206, 50, 'Lider');
INSERT INTO Asignaciones VALUES (11, 105, 206, 30, 'Apoyo');
INSERT INTO Asignaciones VALUES (12, 103, 207, 15, 'Lider');

COMMIT;

SELECT 'Tablas creadas y datos insertados correctamente.' AS mensaje FROM dual;

SELECT * FROM Agentes;
SELECT * FROM Incidentes;
SELECT * FROM Asignaciones;

/*
================================================================================
PAR - TÓPICOS AVANZADOS DE BASES DE DATOS
================================================================================

INSTRUCCIONES GENERALES:
- Tiempo: 90 minutos
- Puntaje total: 100 puntos
- Parte 1 (teórica): 40 puntos | Parte 2 (práctica): 60 puntos
- Ejecute el script de datos antes de comenzar la parte práctica
- En la parte teórica, la lógica y el concepto son lo que se evalúa;
  errores menores de sintaxis no penalizan si la idea es correcta

================================================================================
PARTE 1 - PREGUNTAS TEÓRICAS (40 puntos, 10 puntos cada una)
================================================================================

PREGUNTA 1 (10 puntos)
Explica qué es una transacción en Oracle y las propiedades ACID. Luego,
escribe un bloque PL/SQL que realice las siguientes operaciones usando
transacciones y savepoints:
  1) Insertar un nuevo agente en la tabla Agentes.
  2) Insertar un nuevo incidente en la tabla Incidentes.
  3) Insertar una asignación que vincule al agente con el incidente.
Si falla la inserción de la asignación, solo debe revertirse esa operación
(el agente y el incidente deben mantenerse). Si falla la inserción del
incidente, deben revertirse tanto el incidente como la asignación, pero
el agente debe mantenerse. Explica el flujo de ROLLBACK TO en cada caso.

PREGUNTA 2 (10 puntos)
¿Qué es un Data Warehouse y en qué se diferencia de una base de datos
transaccional? Diseña un modelo dimensional (esquema estrella) con una
tabla de hechos Fact_Rendimiento_Agente y al menos dos dimensiones para
analizar el rendimiento de los agentes según la severidad de los incidentes
y el período de tiempo. Explica por qué las tablas de un DW están
desnormalizadas y qué ventaja tiene esto para consultas de agregación
masiva frente a consultar las tablas OLTP directamente.

PREGUNTA 3 (10 puntos)
Explica cómo se implementa la herencia en Oracle usando tipos de objetos.
Da un ejemplo de una jerarquía de dos niveles: Agente → AgenteEspecialista →
AgentePentester, donde cada nivel agrega atributos y sobreescribe un método
calcular_prioridad(). ¿Qué implicancias tiene declarar un tipo como NOT
INSTANTIABLE y NOT FINAL?

PREGUNTA 4 (10 puntos)
Describe las ventajas y desventajas de usar índices y particiones en Oracle.
Luego, explica cómo combinarías una partición por rango sobre FechaDeteccion
(semestral para 2026) con un índice compuesto sobre (Estado, Severidad) en
la tabla Incidentes para optimizar consultas que filtren por Estado='Abierto'
y Severidad='Critical' en el primer semestre de 2026. Muestra el DDL de la
tabla particionada y del índice. Explica qué es el partition pruning y qué
operación aparecería en el plan de ejecución (EXPLAIN PLAN) al ejecutar
dicha consulta.

================================================================================
PARTE 2 - EJERCICIOS PRÁCTICOS (60 puntos)
================================================================================

EJERCICIO 1 (20 puntos)
Escribe un procedimiento cerrar_incidente que reciba un IncidenteID
(parámetro IN) y un parámetro OUT que retorne el total de horas invertidas.
El procedimiento debe:
  a) Validar que el incidente exista y esté en Estado 'Abierto'.
  b) Actualizar el Estado del incidente a 'Cerrado'.
  c) Calcular la suma total de horas de todas las asignaciones de ese
     incidente y retornarla en el parámetro OUT.
  d) Si el total de horas supera 80, registrar un mensaje de advertencia
     con DBMS_OUTPUT indicando que fue un incidente de alto esfuerzo.
  e) Usar savepoints para que si falla el cálculo de horas, la
     actualización del estado se mantenga.
  f) Manejar las excepciones con mensajes descriptivos.

EJERCICIO 2 (20 puntos)
Diseña las tablas Fact_Horas_Agente, Dim_Agente y Dim_Tiempo para un
Data Warehouse que permita analizar las horas trabajadas por agente a lo
largo del tiempo. Luego, escribe una consulta analítica sobre las tablas
transaccionales que muestre, para cada especialidad, el total de horas
trabajadas y el número de incidentes atendidos por agente, ordenado de
mayor a menor por total de horas.

EJERCICIO 3 (20 puntos)
Crea la tabla Asignaciones particionada por rango de Horas en 3 particiones:
baja (0-20), media (21-50) y alta (51+). Crea un índice compuesto sobre
(AgenteID, IncidenteID). Escribe una consulta que muestre los agentes con
asignaciones de carga alta (más de 50 horas) junto con la descripción del
incidente. Muestra el plan de ejecución con EXPLAIN PLAN y explica cómo
el partition pruning beneficia esta consulta específica.

================================================================================
*/
