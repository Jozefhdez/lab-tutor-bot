-- Sample data for gap-detector-service (Oracle)

-- Subtopics
INSERT INTO SUBTOPICS (name, topic_id, course_id)
VALUES ('Recursion Basics', 1, 10);

INSERT INTO SUBTOPICS (name, topic_id, course_id)
VALUES ('Linked List Traversal', 1, 10);

INSERT INTO SUBTOPICS (name, topic_id, course_id)
VALUES ('Binary Tree Balancing', 2, 10);

INSERT INTO SUBTOPICS (name, topic_id, course_id)
VALUES ('SQL Joins', 3, 11);

INSERT INTO SUBTOPICS (name, topic_id, course_id)
VALUES ('Normalization', 3, 11);

-- Gaps
INSERT INTO GAPS (student_id, subtopic_id, severity, detected_at, resolved)
VALUES ('U-2024-001', 3, 'HIGH', TIMESTAMP '2026-02-18 11:45:00', 0);

INSERT INTO GAPS (student_id, subtopic_id, severity, detected_at, resolved)
VALUES ('U-2024-002', 2, 'MEDIUM', TIMESTAMP '2026-02-16 14:15:00', 0);

INSERT INTO GAPS (student_id, subtopic_id, severity, detected_at, resolved)
VALUES ('U-2024-003', 4, 'LOW', TIMESTAMP '2026-02-20 08:00:00', 1);

INSERT INTO GAPS (student_id, subtopic_id, severity, detected_at, resolved)
VALUES ('U-2024-001', 5, 'MEDIUM', TIMESTAMP '2026-02-21 10:30:00', 0);

INSERT INTO GAPS (student_id, subtopic_id, severity, detected_at, resolved)
VALUES ('U-2024-002', 1, 'LOW', TIMESTAMP '2026-02-22 13:00:00', 1);
