-- ============================================================
-- TutorBot Campus — V2  Bulk Seed Data  (idempotent)
-- Safe to run many times: catalogue uses MERGE, bulk rows
-- are only inserted when the table has fewer than the target.
-- Run as user ADOLFO against TESTDB.
-- ============================================================

-- =====================  CATALOGUE — COURSES  ================

MERGE INTO COURSES tgt USING (SELECT 1 AS ID, 'Programación Web' AS NAME, 'TC2005B' AS CODE FROM DUAL) src ON (tgt.ID = src.ID) WHEN NOT MATCHED THEN INSERT (ID,NAME,CODE) VALUES (src.ID,src.NAME,src.CODE);
MERGE INTO COURSES tgt USING (SELECT 2 AS ID, 'Estructura de Datos' AS NAME, 'TC1031' AS CODE FROM DUAL) src ON (tgt.ID = src.ID) WHEN NOT MATCHED THEN INSERT (ID,NAME,CODE) VALUES (src.ID,src.NAME,src.CODE);
MERGE INTO COURSES tgt USING (SELECT 3 AS ID, 'Bases de Datos' AS NAME, 'TC1032' AS CODE FROM DUAL) src ON (tgt.ID = src.ID) WHEN NOT MATCHED THEN INSERT (ID,NAME,CODE) VALUES (src.ID,src.NAME,src.CODE);
MERGE INTO COURSES tgt USING (SELECT 4 AS ID, 'Inteligencia Artificial' AS NAME, 'TC2008B' AS CODE FROM DUAL) src ON (tgt.ID = src.ID) WHEN NOT MATCHED THEN INSERT (ID,NAME,CODE) VALUES (src.ID,src.NAME,src.CODE);
MERGE INTO COURSES tgt USING (SELECT 5 AS ID, 'Redes de Computadoras' AS NAME, 'TC2007B' AS CODE FROM DUAL) src ON (tgt.ID = src.ID) WHEN NOT MATCHED THEN INSERT (ID,NAME,CODE) VALUES (src.ID,src.NAME,src.CODE);
MERGE INTO COURSES tgt USING (SELECT 6 AS ID, 'Ingeniería de Software' AS NAME, 'TC2006B' AS CODE FROM DUAL) src ON (tgt.ID = src.ID) WHEN NOT MATCHED THEN INSERT (ID,NAME,CODE) VALUES (src.ID,src.NAME,src.CODE);

-- =====================  CATALOGUE — TOPICS  =================

MERGE INTO TOPICS tgt USING (SELECT  1 AS ID, 'HTML y CSS'               AS NAME, 1 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT  2 AS ID, 'JavaScript'               AS NAME, 1 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT  3 AS ID, 'Spring Boot'              AS NAME, 1 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT  4 AS ID, 'Árboles Binarios'         AS NAME, 2 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT  5 AS ID, 'Listas Enlazadas'         AS NAME, 2 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT  6 AS ID, 'Grafos'                   AS NAME, 2 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT  7 AS ID, 'Tablas Hash'              AS NAME, 2 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT  8 AS ID, 'Modelo Relacional'        AS NAME, 3 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT  9 AS ID, 'SQL Avanzado'             AS NAME, 3 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT 10 AS ID, 'Normalización'            AS NAME, 3 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT 11 AS ID, 'PL/SQL'                   AS NAME, 3 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT 12 AS ID, 'Machine Learning'         AS NAME, 4 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT 13 AS ID, 'Redes Neuronales'         AS NAME, 4 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT 14 AS ID, 'NLP'                      AS NAME, 4 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT 15 AS ID, 'Protocolos TCP/IP'        AS NAME, 5 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT 16 AS ID, 'Seguridad en Redes'       AS NAME, 5 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT 17 AS ID, 'Patrones de Diseño'       AS NAME, 6 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT 18 AS ID, 'Metodologías Ágiles'      AS NAME, 6 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT 19 AS ID, 'Testing y QA'             AS NAME, 6 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);
MERGE INTO TOPICS tgt USING (SELECT 20 AS ID, 'React y Frameworks JS'    AS NAME, 1 AS CID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,COURSE_ID) VALUES(src.ID,src.NAME,src.CID);

-- =====================  CATALOGUE — SUBTOPICS  ==============

MERGE INTO SUBTOPICS tgt USING (SELECT  1 AS ID, 'Selectores CSS'            AS NAME, 1 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT  2 AS ID, 'Flexbox y Grid'            AS NAME, 1 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT  3 AS ID, 'Closures'                  AS NAME, 2 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT  4 AS ID, 'Promesas y Async/Await'    AS NAME, 2 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT  5 AS ID, 'REST Controllers'          AS NAME, 3 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT  6 AS ID, 'DOM Manipulation'          AS NAME, 2 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT  7 AS ID, 'Event Handling JS'         AS NAME, 2 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT  8 AS ID, 'Dependency Injection'      AS NAME, 3 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT  9 AS ID, 'JPA y Hibernate'           AS NAME, 3 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 10 AS ID, 'Spring Security'           AS NAME, 3 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 11 AS ID, 'Recorridos en árboles'     AS NAME, 4 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 12 AS ID, 'AVL y balanceo'            AS NAME, 4 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 13 AS ID, 'Listas simples'            AS NAME, 5 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 14 AS ID, 'Listas dobles'             AS NAME, 5 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 15 AS ID, 'BFS y DFS'                 AS NAME, 6 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 16 AS ID, 'Dijkstra'                  AS NAME, 6 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 17 AS ID, 'Colisiones en hash'        AS NAME, 7 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 18 AS ID, 'HashMap en Java'           AS NAME, 7 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 19 AS ID, 'Diagramas ER'              AS NAME, 8 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 20 AS ID, 'Cardinalidad'              AS NAME, 8 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 21 AS ID, 'Joins complejos'           AS NAME, 9 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 22 AS ID, 'Subconsultas'              AS NAME, 9 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 23 AS ID, 'Window Functions'          AS NAME, 9 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 24 AS ID, '1FN, 2FN, 3FN'            AS NAME,10 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 25 AS ID, 'BCNF'                      AS NAME,10 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 26 AS ID, 'Cursores PL/SQL'           AS NAME,11 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 27 AS ID, 'Triggers'                  AS NAME,11 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 28 AS ID, 'Regresión Lineal'          AS NAME,12 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 29 AS ID, 'Árboles de Decisión'       AS NAME,12 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 30 AS ID, 'SVM'                       AS NAME,12 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 31 AS ID, 'Perceptrón'                AS NAME,13 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 32 AS ID, 'CNN'                       AS NAME,13 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 33 AS ID, 'RNN y LSTM'                AS NAME,13 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 34 AS ID, 'Tokenización'              AS NAME,14 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 35 AS ID, 'Word Embeddings'           AS NAME,14 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 36 AS ID, 'Modelo OSI'                AS NAME,15 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 37 AS ID, 'Subnetting'                AS NAME,15 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 38 AS ID, 'Firewalls'                 AS NAME,16 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 39 AS ID, 'TLS/SSL'                   AS NAME,16 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 40 AS ID, 'Singleton y Factory'       AS NAME,17 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 41 AS ID, 'Observer y Strategy'       AS NAME,17 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 42 AS ID, 'Scrum'                     AS NAME,18 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 43 AS ID, 'Kanban'                    AS NAME,18 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 44 AS ID, 'JUnit y Mockito'           AS NAME,19 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 45 AS ID, 'TDD'                       AS NAME,19 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 46 AS ID, 'React Hooks'               AS NAME,20 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 47 AS ID, 'State Management'          AS NAME,20 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 48 AS ID, 'Responsive Design'         AS NAME, 1 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 49 AS ID, 'CSS Variables'             AS NAME, 1 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);
MERGE INTO SUBTOPICS tgt USING (SELECT 50 AS ID, 'Transformers'              AS NAME,14 AS TID FROM DUAL) src ON (tgt.ID=src.ID) WHEN NOT MATCHED THEN INSERT(ID,NAME,TOPIC_ID) VALUES(src.ID,src.NAME,src.TID);

-- =====================  BULK EVALUATIONS (300 rows)  ========
-- Only inserts if fewer than 300 evaluations exist.
-- Uses deterministic pseudo-random data based on row number.

DECLARE
    v_count   NUMBER;
    v_id      NUMBER;
    v_sid     VARCHAR2(20);
    v_sess    VARCHAR2(40);
    v_score   NUMBER;
    v_max     NUMBER := 100;
    v_topic   NUMBER;
    v_ts      TIMESTAMP;

    TYPE t_students IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    TYPE t_questions IS TABLE OF VARCHAR2(500) INDEX BY PLS_INTEGER;
    TYPE t_answers IS TABLE OF VARCHAR2(500) INDEX BY PLS_INTEGER;
    TYPE t_correct IS TABLE OF VARCHAR2(500) INDEX BY PLS_INTEGER;
    TYPE t_feedback IS TABLE OF VARCHAR2(1000) INDEX BY PLS_INTEGER;

    students  t_students;
    questions t_questions;
    answers   t_answers;
    corrects  t_correct;
    feedbacks t_feedback;
BEGIN
    SELECT COUNT(*) INTO v_count FROM EVALUATIONS;
    IF v_count >= 300 THEN
        DBMS_OUTPUT.PUT_LINE('EVALUATIONS already has ' || v_count || ' rows — skipping.');
        RETURN;
    END IF;

    -- 15 students (matrículas estilo Tec de Monterrey)
    students(1)  := 'A00835001'; students(2)  := 'A00835002';
    students(3)  := 'A00835003'; students(4)  := 'A00835004';
    students(5)  := 'A00835005'; students(6)  := 'A00835006';
    students(7)  := 'A00835007'; students(8)  := 'A00835008';
    students(9)  := 'A00835009'; students(10) := 'A00835010';
    students(11) := 'A00835011'; students(12) := 'A00835012';
    students(13) := 'A00835013'; students(14) := 'A00835014';
    students(15) := 'A00835015';

    -- 20 question templates
    questions(1)  := '¿Qué es el modelo de caja en CSS y cuáles son sus componentes?';
    questions(2)  := 'Explica la diferencia entre display: flex y display: grid.';
    questions(3)  := '¿Qué es un closure en JavaScript y para qué sirve?';
    questions(4)  := 'Describe el ciclo de vida de una Promise en JavaScript.';
    questions(5)  := '¿Cuál es la diferencia entre @Controller y @RestController en Spring?';
    questions(6)  := 'Explica qué es la inyección de dependencias y por qué es útil.';
    questions(7)  := '¿Cuáles son los recorridos posibles de un árbol binario?';
    questions(8)  := '¿Qué es un árbol AVL y cuándo se usa?';
    questions(9)  := 'Describe las diferencias entre una lista simple y una lista doble.';
    questions(10) := '¿Qué algoritmos se usan para recorrer grafos?';
    questions(11) := 'Explica el algoritmo de Dijkstra paso a paso.';
    questions(12) := '¿Cómo se resuelven colisiones en una tabla hash?';
    questions(13) := '¿Qué es la normalización y cuáles son sus formas normales?';
    questions(14) := 'Escribe un query con JOIN que obtenga estudiantes y sus calificaciones.';
    questions(15) := '¿Qué es un cursor en PL/SQL y cuándo conviene usarlo?';
    questions(16) := 'Describe cómo funciona una red neuronal convolucional (CNN).';
    questions(17) := '¿Qué es el tokenizado en procesamiento de lenguaje natural?';
    questions(18) := '¿Cuáles son las capas del modelo OSI?';
    questions(19) := 'Explica el patrón de diseño Singleton con un ejemplo en Java.';
    questions(20) := '¿Cuáles son las ceremonias de Scrum?';

    -- 20 student answer templates
    answers(1)  := 'El modelo de caja tiene content, padding, border y margin.';
    answers(2)  := 'Flex es unidimensional y Grid es bidimensional para layouts.';
    answers(3)  := 'Un closure es una función que recuerda el scope donde fue creada.';
    answers(4)  := 'Una Promise pasa por pending, fulfilled y rejected.';
    answers(5)  := '@RestController combina @Controller con @ResponseBody para APIs REST.';
    answers(6)  := 'Es un patrón donde las dependencias se pasan externamente al objeto.';
    answers(7)  := 'Preorder, inorder y postorder son los recorridos principales.';
    answers(8)  := 'Es un árbol balanceado que mantiene altura logarítmica con rotaciones.';
    answers(9)  := 'La lista simple tiene un puntero next, la doble tiene next y prev.';
    answers(10) := 'BFS usa cola y DFS usa pila o recursión para recorrer grafos.';
    answers(11) := 'Dijkstra encuentra la ruta más corta usando una cola de prioridad.';
    answers(12) := 'Se resuelven con chaining o open addressing como linear probing.';
    answers(13) := 'Normalización elimina redundancia. Las formas son 1FN, 2FN, 3FN y BCNF.';
    answers(14) := 'SELECT s.nombre, c.nota FROM estudiantes s JOIN calificaciones c ON s.id = c.estudiante_id;';
    answers(15) := 'Un cursor recorre filas una por una y se usa para lógica fila a fila.';
    answers(16) := 'Una CNN usa capas convolucionales con filtros para extraer features de imágenes.';
    answers(17) := 'Es dividir texto en tokens, como palabras o subpalabras, para procesarlo.';
    answers(18) := 'Son 7 capas: física, enlace, red, transporte, sesión, presentación, aplicación.';
    answers(19) := 'Singleton garantiza una sola instancia con constructor privado y método estático.';
    answers(20) := 'Sprint planning, daily standup, sprint review y retrospectiva.';

    -- 20 correct answer templates
    corrects(1)  := 'El box model se compone de content, padding, border y margin. El content es el área del elemento.';
    corrects(2)  := 'Flexbox es un layout unidimensional (fila o columna). Grid es bidimensional (filas y columnas simultáneas).';
    corrects(3)  := 'Un closure es una función junto con su entorno léxico. Permite acceder a variables del scope padre incluso después de que la función padre haya retornado.';
    corrects(4)  := 'Una Promise tiene 3 estados: pending (inicial), fulfilled (resuelto con valor) y rejected (rechazado con error). Se consume con .then() y .catch().';
    corrects(5)  := '@Controller retorna vistas. @RestController añade @ResponseBody implícitamente para retornar datos JSON/XML directamente.';
    corrects(6)  := 'La DI es un principio de IoC donde un contenedor inyecta dependencias. Facilita testing, bajo acoplamiento y mantenibilidad.';
    corrects(7)  := 'Preorder (raíz-izq-der), Inorder (izq-raíz-der), Postorder (izq-der-raíz) y Level-order (BFS por niveles).';
    corrects(8)  := 'Un AVL es un BST auto-balanceado donde la diferencia de alturas entre subárboles es máximo 1. Usa rotaciones simples y dobles.';
    corrects(9)  := 'Lista simple: nodos con dato y puntero next. Lista doble: nodos con dato, next y prev. La doble permite recorrido bidireccional.';
    corrects(10) := 'BFS (Breadth-First Search) usa cola, explora por niveles. DFS (Depth-First Search) usa pila, explora en profundidad.';
    corrects(11) := 'Dijkstra: 1) Inicializar distancias a infinito excepto origen. 2) Usar min-heap. 3) Relajar aristas adyacentes. 4) Repetir hasta visitar todos.';
    corrects(12) := 'Chaining: lista enlazada en cada bucket. Open addressing: linear probing, quadratic probing o double hashing para encontrar siguiente slot libre.';
    corrects(13) := '1FN: atributos atómicos. 2FN: sin dependencias parciales. 3FN: sin dependencias transitivas. BCNF: todo determinante es clave candidata.';
    corrects(14) := 'SELECT e.nombre, c.nota FROM estudiantes e INNER JOIN calificaciones c ON e.id = c.estudiante_id ORDER BY e.nombre;';
    corrects(15) := 'Un cursor es un puntero a un result set. Se usa con DECLARE, OPEN, FETCH, CLOSE para procesar filas individualmente.';
    corrects(16) := 'Una CNN usa capas convolucionales (filtros), pooling (reducción), y fully connected (clasificación). Se especializa en datos espaciales como imágenes.';
    corrects(17) := 'Tokenización divide texto en unidades mínimas. Puede ser por palabras, caracteres o subpalabras (BPE, WordPiece).';
    corrects(18) := 'Modelo OSI: 1-Física, 2-Enlace de datos, 3-Red, 4-Transporte, 5-Sesión, 6-Presentación, 7-Aplicación.';
    corrects(19) := 'public class Singleton { private static Singleton instance; private Singleton() {} public static synchronized Singleton getInstance() { if (instance == null) instance = new Singleton(); return instance; } }';
    corrects(20) := 'Sprint Planning, Daily Scrum (15 min), Sprint Review (demo) y Sprint Retrospective (mejora continua). El Sprint dura 1-4 semanas.';

    -- 10 feedback templates
    feedbacks(1)  := 'Respuesta correcta y bien estructurada. Demuestra comprensión sólida del tema.';
    feedbacks(2)  := 'Buena respuesta pero falta mencionar algunos detalles clave. Revisa la documentación oficial.';
    feedbacks(3)  := 'Respuesta parcialmente correcta. Te faltó profundizar en los conceptos fundamentales.';
    feedbacks(4)  := 'Excelente explicación con buen uso de terminología técnica.';
    feedbacks(5)  := 'Respuesta incompleta. Necesitas repasar este tema con más detalle.';
    feedbacks(6)  := 'Muy buena respuesta. Solo faltó mencionar un caso de uso práctico.';
    feedbacks(7)  := 'La respuesta es demasiado superficial. Intenta dar ejemplos concretos.';
    feedbacks(8)  := 'Correcto en lo general, pero hay imprecisiones en la terminología.';
    feedbacks(9)  := 'Respuesta sobresaliente. Cubre todos los puntos importantes del tema.';
    feedbacks(10) := 'Necesitas mejorar. La respuesta muestra confusión entre conceptos relacionados.';

    -- Insert 300 evaluations
    FOR i IN 1..300 LOOP
        v_id    := SEQ_EVALUATIONS.NEXTVAL;
        v_sid   := students(MOD(i - 1, 15) + 1);
        v_sess  := 'SESSION-' || LPAD(TO_CHAR(MOD(i - 1, 60) + 1), 4, '0');
        v_topic := MOD(i - 1, 20) + 1;
        v_score := CASE
                       WHEN MOD(i, 7) = 0 THEN TRUNC(DBMS_RANDOM.VALUE(20, 50))   -- bajo
                       WHEN MOD(i, 3) = 0 THEN TRUNC(DBMS_RANDOM.VALUE(50, 75))   -- medio
                       ELSE TRUNC(DBMS_RANDOM.VALUE(75, 100))                       -- alto
                   END;
        v_ts    := SYSTIMESTAMP - NUMTODSINTERVAL(DBMS_RANDOM.VALUE(0, 90 * 24 * 60), 'MINUTE');

        INSERT INTO EVALUATIONS (
            ID, SESSION_ID, STUDENT_ID, QUESTION_TEXT, STUDENT_ANSWER,
            CORRECT_ANSWER, SCORE, MAX_SCORE, FEEDBACK_SUMMARY, TOPIC_ID, EVALUATED_AT
        ) VALUES (
            v_id,
            v_sess,
            v_sid,
            questions(MOD(i - 1, 20) + 1),
            answers(MOD(i - 1, 20) + 1),
            corrects(MOD(i - 1, 20) + 1),
            v_score,
            v_max,
            feedbacks(MOD(i - 1, 10) + 1),
            v_topic,
            v_ts
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Inserted 300 evaluations.');
END;
/

-- =====================  BULK GAPS (200 rows)  ===============
-- Only inserts if fewer than 200 gaps exist.

DECLARE
    v_count      NUMBER;
    v_id         NUMBER;
    v_sid        VARCHAR2(20);
    v_topic      NUMBER;
    v_subtopic   NUMBER;
    v_ts         TIMESTAMP;
    v_resolved   NUMBER(1);

    TYPE t_students IS TABLE OF VARCHAR2(20)  INDEX BY PLS_INTEGER;
    TYPE t_concepts IS TABLE OF VARCHAR2(255) INDEX BY PLS_INTEGER;
    TYPE t_severity IS TABLE OF VARCHAR2(50)  INDEX BY PLS_INTEGER;

    students   t_students;
    concepts   t_concepts;
    severities t_severity;

    -- Mapping subtopic → topic for FK consistency
    TYPE t_sub2topic IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    sub2topic t_sub2topic;
BEGIN
    SELECT COUNT(*) INTO v_count FROM GAPS;
    IF v_count >= 200 THEN
        DBMS_OUTPUT.PUT_LINE('GAPS already has ' || v_count || ' rows — skipping.');
        RETURN;
    END IF;

    -- Students
    students(1)  := 'A00835001'; students(2)  := 'A00835002';
    students(3)  := 'A00835003'; students(4)  := 'A00835004';
    students(5)  := 'A00835005'; students(6)  := 'A00835006';
    students(7)  := 'A00835007'; students(8)  := 'A00835008';
    students(9)  := 'A00835009'; students(10) := 'A00835010';
    students(11) := 'A00835011'; students(12) := 'A00835012';
    students(13) := 'A00835013'; students(14) := 'A00835014';
    students(15) := 'A00835015';

    -- 40 concepts (linked to subtopic ideas)
    concepts(1)  := 'Especificidad de selectores CSS';
    concepts(2)  := 'Propiedades de Flexbox: justify-content';
    concepts(3)  := 'Scope léxico en closures';
    concepts(4)  := 'Manejo de errores con catch en Promises';
    concepts(5)  := 'Mapeo de rutas con @GetMapping';
    concepts(6)  := 'Constructor injection vs field injection';
    concepts(7)  := 'Configuración de @Entity y @Table';
    concepts(8)  := 'CSRF protection en Spring Security';
    concepts(9)  := 'Recorrido inorder iterativo';
    concepts(10) := 'Rotaciones dobles en AVL';
    concepts(11) := 'Inserción al final de lista simple';
    concepts(12) := 'Borrado en lista doblemente enlazada';
    concepts(13) := 'Implementación de BFS con cola';
    concepts(14) := 'Complejidad de Dijkstra con heap';
    concepts(15) := 'Chaining vs open addressing';
    concepts(16) := 'Implementación de hashCode en Java';
    concepts(17) := 'Identificación de entidades en ER';
    concepts(18) := 'Relaciones M:N con tabla puente';
    concepts(19) := 'LEFT JOIN vs INNER JOIN';
    concepts(20) := 'Correlación en subconsultas';
    concepts(21) := 'Uso de PARTITION BY';
    concepts(22) := 'Dependencias parciales en 2FN';
    concepts(23) := 'Determinación de BCNF';
    concepts(24) := 'Cursores explícitos vs implícitos';
    concepts(25) := 'Triggers BEFORE vs AFTER';
    concepts(26) := 'Overfitting en regresión';
    concepts(27) := 'Criterio de split en árboles de decisión';
    concepts(28) := 'Kernel trick en SVM';
    concepts(29) := 'Función de activación en perceptrón';
    concepts(30) := 'Stride y padding en CNN';
    concepts(31) := 'Vanishing gradient en RNN';
    concepts(32) := 'Tokenización BPE';
    concepts(33) := 'Similitud coseno en embeddings';
    concepts(34) := 'Mecanismo de atención en Transformers';
    concepts(35) := 'Diferencia entre capas OSI 3 y 4';
    concepts(36) := 'Cálculo de subredes con CIDR';
    concepts(37) := 'Reglas de firewall stateful';
    concepts(38) := 'Handshake TLS';
    concepts(39) := 'Diferencia entre Factory y Abstract Factory';
    concepts(40) := 'Estimación en Planning Poker';

    -- Severity levels
    severities(1) := 'LOW';
    severities(2) := 'MEDIUM';
    severities(3) := 'HIGH';
    severities(4) := 'CRITICAL';

    -- Subtopic → Topic mapping (must be referential-integrity safe)
    sub2topic(1)  := 1;  sub2topic(2)  := 1;  sub2topic(3)  := 2;
    sub2topic(4)  := 2;  sub2topic(5)  := 3;  sub2topic(6)  := 2;
    sub2topic(7)  := 2;  sub2topic(8)  := 3;  sub2topic(9)  := 3;
    sub2topic(10) := 3;  sub2topic(11) := 4;  sub2topic(12) := 4;
    sub2topic(13) := 5;  sub2topic(14) := 5;  sub2topic(15) := 6;
    sub2topic(16) := 6;  sub2topic(17) := 7;  sub2topic(18) := 7;
    sub2topic(19) := 8;  sub2topic(20) := 8;  sub2topic(21) := 9;
    sub2topic(22) := 9;  sub2topic(23) := 9;  sub2topic(24) := 10;
    sub2topic(25) := 10; sub2topic(26) := 11; sub2topic(27) := 11;
    sub2topic(28) := 12; sub2topic(29) := 12; sub2topic(30) := 12;
    sub2topic(31) := 13; sub2topic(32) := 13; sub2topic(33) := 13;
    sub2topic(34) := 14; sub2topic(35) := 14; sub2topic(36) := 15;
    sub2topic(37) := 15; sub2topic(38) := 16; sub2topic(39) := 16;
    sub2topic(40) := 17;

    -- Insert 200 gaps
    FOR i IN 1..200 LOOP
        v_id       := SEQ_GAPS.NEXTVAL;
        v_sid      := students(MOD(i - 1, 15) + 1);
        v_subtopic := MOD(i - 1, 40) + 1;
        v_topic    := sub2topic(v_subtopic);
        v_resolved := CASE WHEN MOD(i, 5) = 0 THEN 1 ELSE 0 END;  -- 20% resueltos
        v_ts       := SYSTIMESTAMP - NUMTODSINTERVAL(DBMS_RANDOM.VALUE(0, 90 * 24 * 60), 'MINUTE');

        INSERT INTO GAPS (
            ID, STUDENT_ID, TOPIC_ID, SUBTOPIC_ID, CONCEPT,
            SEVERITY, CONFIDENCE, DETECTED_AT, RESOLVED
        ) VALUES (
            v_id,
            v_sid,
            v_topic,
            v_subtopic,
            concepts(v_subtopic),
            severities(MOD(i - 1, 4) + 1),
            ROUND(DBMS_RANDOM.VALUE(0.3, 0.99), 2),
            v_ts,
            v_resolved
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Inserted 200 gaps.');
END;
/

-- =====================  ADVANCE SEQUENCES  ==================
-- Make sure sequences are past all manually-assigned catalogue IDs.

DECLARE
    v_val NUMBER;
    PROCEDURE advance_seq(p_seq VARCHAR2, p_target NUMBER) IS
        v_cur NUMBER;
    BEGIN
        EXECUTE IMMEDIATE 'SELECT ' || p_seq || '.CURRVAL FROM DUAL' INTO v_cur;
        FOR j IN 1..(p_target - v_cur) LOOP
            EXECUTE IMMEDIATE 'SELECT ' || p_seq || '.NEXTVAL FROM DUAL' INTO v_cur;
        END LOOP;
    EXCEPTION
        WHEN OTHERS THEN
            -- CURRVAL not available if sequence was never called; call NEXTVAL first
            EXECUTE IMMEDIATE 'SELECT ' || p_seq || '.NEXTVAL FROM DUAL' INTO v_cur;
            FOR j IN 1..(p_target - v_cur) LOOP
                EXECUTE IMMEDIATE 'SELECT ' || p_seq || '.NEXTVAL FROM DUAL' INTO v_cur;
            END LOOP;
    END;
BEGIN
    advance_seq('SEQ_COURSES',   10);
    advance_seq('SEQ_TOPICS',    25);
    advance_seq('SEQ_SUBTOPICS', 55);
END;
/

COMMIT;

-- =====================  VERIFY  =============================
SELECT 'COURSES'     AS TBL, COUNT(*) AS ROWS_CNT FROM COURSES     UNION ALL
SELECT 'TOPICS',              COUNT(*)             FROM TOPICS      UNION ALL
SELECT 'SUBTOPICS',           COUNT(*)             FROM SUBTOPICS  UNION ALL
SELECT 'EVALUATIONS',         COUNT(*)             FROM EVALUATIONS UNION ALL
SELECT 'GAPS',                COUNT(*)             FROM GAPS;
