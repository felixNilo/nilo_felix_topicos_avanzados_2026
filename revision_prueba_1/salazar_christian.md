# Revisión Prueba 1 - Christian Salazar

## Parte 1 - Teórica (40 pts)

### Pregunta 1 - Relación Muchos a Muchos (10 pts)
**Puntaje: 7/10**

**Retroalimentación:**
- Define correctamente que "ambas partes pueden contener muchos elementos" (2/3 definición).
- Explica que se usa tabla intermediaria como puente, convirtiendo en relaciones 1 a N, correcto (3/3 implementación).
- No da ejemplo específico del esquema de la prueba (1/3 ejemplo).
- Redacción clara (1/1 precisión).

---

### Pregunta 2 - Vistas (10 pts)
**Puntaje: 4/10**

**Retroalimentación:**
- Define como "manera de simplificar una consulta SQL", correcto (2/3 definición).
- Describe que facilita buscar información (1/2 uso).
- No entrega la consulta SQL (0/4 consulta).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 3 - Excepciones Predefinidas (10 pts)
**Puntaje: 6/10**

**Retroalimentación:**
- Define como "excepciones que trae Oracle por defecto", correcto (2/3 definición).
- Menciona que se manejan con IF, no es la forma estándar pero muestra comprensión del concepto (1/2 uso NO_DATA_FOUND).
- El ejemplo usa RAISE NO_DATA_FOUND dentro de un IF, forma válida aunque no estándar. Demuestra conocimiento del mecanismo (2/4 ejemplo).
- Redacción aceptable (1/1 precisión).

---

### Pregunta 4 - Cursores Explícitos (10 pts)
**Puntaje: 8/10**

**Retroalimentación:**
- Define correctamente como "puntero que recorre filas uno por uno con objetivo personalizable" (3/3 definición).
- Menciona FETCH pero no describe el ciclo completo explícitamente (1/3 uso).
- Menciona %NOTFOUND y %ISOPEN con propósitos correctos (3/3 atributos).
- Redacción clara (1/1 precisión).

---

## Parte 2 - Práctica (60 pts)

### Ejercicio 1 - Cursor con Promedio > 30 (20 pts)
**Puntaje: 11/20**

**Retroalimentación:**
- El cursor tiene JOIN correcto, calcula AVG. Usa WHERE en vez de HAVING y tiene error de sintaxis (`.` en vez de `,`), pero la lógica es correcta en intención. Falta GROUP BY (3/5 definición cursor).
- Usa OPEN, FETCH, EXIT WHEN %NOTFOUND. Falta CLOSE (3/5 uso cursor).
- Salida con DBMS_OUTPUT presente (3/5 salida).
- Código con errores de sintaxis menores (2/5 estructura).

---

### Ejercicio 2 - Cursor FOR UPDATE (20 pts)
**Puntaje: 5/20**

**Retroalimentación:**
- El cursor tiene JOIN y WHERE severidad, incluye FOR UPDATE. Pero usa 'critical' en minúscula y no declara variables (2/5 definición cursor).
- Copia el código del ejercicio 1 sin adaptarlo (usa nombre de cursor equivocado) (0/5 uso cursor).
- No realiza UPDATE ni suma de 10 horas (0/5 actualización).
- No tiene bloque EXCEPTION (0/3 excepciones).
- Estructura parcial (3/2 estructura).

---

### Ejercicio 3 - Tipo de Objeto (20 pts)
**Puntaje: 10/20**

**Retroalimentación:**
- Crea el tipo con CREATE OR REPLACE TYPE y MEMBER FUNCTION. Body tiene errores menores de tipo de retorno pero la estructura es correcta (3/5 tipo).
- Crea tabla con sintaxis parcialmente correcta (1/3 tabla).
- Transfiere datos con INSERT SELECT, correcto en concepto (3/4 transferencia).
- El cursor usa SELECT VALUE correctamente, tiene FETCH y EXIT WHEN %NOTFOUND. Llama get_reporte() pero no lo imprime con DBMS_OUTPUT (2/5 cursor).
- Código con errores de sintaxis pero demuestra comprensión (1/3 estructura).

---

## Resumen

| Pregunta | Puntaje |
|----------|---------|
| P1 Teórica - Muchos a Muchos | 7/10 |
| P2 Teórica - Vistas | 4/10 |
| P3 Teórica - Excepciones | 6/10 |
| P4 Teórica - Cursores | 8/10 |
| E1 Práctica - Cursor Promedio | 11/20 |
| E2 Práctica - FOR UPDATE | 5/20 |
| E3 Práctica - Tipo Objeto | 10/20 |
| **TOTAL** | **51/100** |
