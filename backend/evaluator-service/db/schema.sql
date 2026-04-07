-- Schema for evaluator-service (Oracle)

-- EVALUATIONS table
DECLARE
    table_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO table_exists FROM user_tables WHERE table_name = 'EVALUATIONS';
    IF table_exists = 0 THEN
        EXECUTE IMMEDIATE '
            CREATE TABLE EVALUATIONS (
                id            NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                student_id    VARCHAR2(50)   NOT NULL,
                subtopic_id   NUMBER         NOT NULL,
                score         NUMBER(5,2)    NOT NULL,
                feedback      CLOB,
                created_at    TIMESTAMP      DEFAULT CURRENT_TIMESTAMP
            )
        ';
    END IF;
END;
/

-- Indexes on EVALUATIONS
DECLARE
    idx_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO idx_exists FROM user_indexes WHERE index_name = 'IDX_EVAL_STUDENT_ID';
    IF idx_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX IDX_EVAL_STUDENT_ID ON EVALUATIONS (student_id)';
    END IF;

    SELECT COUNT(*) INTO idx_exists FROM user_indexes WHERE index_name = 'IDX_EVAL_SUBTOPIC_ID';
    IF idx_exists = 0 THEN
        EXECUTE IMMEDIATE 'CREATE INDEX IDX_EVAL_SUBTOPIC_ID ON EVALUATIONS (subtopic_id)';
    END IF;
END;
/
