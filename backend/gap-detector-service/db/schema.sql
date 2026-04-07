-- Schema for gap-detector-service (Oracle)

-- SUBTOPICS table
DECLARE
    table_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO table_exists FROM user_tables WHERE table_name = 'SUBTOPICS';
    IF table_exists = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE SUBTOPICS (
                id        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                name      VARCHAR2(100)  NOT NULL,
                topic_id  NUMBER         NOT NULL,
                course_id NUMBER         NOT NULL
            )
        ';
    END IF;
END;
/

-- Indexes on SUBTOPICS
DECLARE
    idx_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO idx_exists FROM user_indexes WHERE index_name = 'IDX_SUBTOPICS_TOPIC_ID';
    IF idx_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX IDX_SUBTOPICS_TOPIC_ID ON SUBTOPICS (topic_id)';
    END IF;

    SELECT COUNT(*) INTO idx_exists FROM user_indexes WHERE index_name = 'IDX_SUBTOPICS_COURSE_ID';
    IF idx_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX IDX_SUBTOPICS_COURSE_ID ON SUBTOPICS (course_id)';
    END IF;
END;
/

-- GAPS table
DECLARE
    table_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO table_exists FROM user_tables WHERE table_name = 'GAPS';
    IF table_exists = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE GAPS (
                id          NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                student_id  VARCHAR2(50)   NOT NULL,
                subtopic_id NUMBER         NOT NULL,
                severity    VARCHAR2(20)   NOT NULL,
                detected_at TIMESTAMP      DEFAULT CURRENT_TIMESTAMP,
                resolved    NUMBER(1)      DEFAULT 0
            )
        ';
    END IF;
END;
/

-- Indexes on GAPS
DECLARE
    idx_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO idx_exists FROM user_indexes WHERE index_name = 'IDX_GAPS_STUDENT_ID';
    IF idx_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX IDX_GAPS_STUDENT_ID ON GAPS (student_id)';
    END IF;

    SELECT COUNT(*) INTO idx_exists FROM user_indexes WHERE index_name = 'IDX_GAPS_SUBTOPIC_ID';
    IF idx_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX IDX_GAPS_SUBTOPIC_ID ON GAPS (subtopic_id)';
    END IF;
END;
/
