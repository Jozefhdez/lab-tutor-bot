-- Sample data for evaluator-service (Oracle)

INSERT INTO EVALUATIONS (student_id, subtopic_id, score, feedback, created_at)
VALUES ('U-2024-001', 101, 85.50, 'Good understanding of recursion concepts. Review base-case edge cases.', TIMESTAMP '2026-02-15 10:30:00');

INSERT INTO EVALUATIONS (student_id, subtopic_id, score, feedback, created_at)
VALUES ('U-2024-002', 102, 72.00, 'Partial grasp of linked-list traversal. Practice pointer manipulation.', TIMESTAMP '2026-02-16 14:15:00');

INSERT INTO EVALUATIONS (student_id, subtopic_id, score, feedback, created_at)
VALUES ('U-2024-003', 101, 93.75, 'Excellent recursive problem solving. Ready for advanced topics.', TIMESTAMP '2026-02-17 09:00:00');

INSERT INTO EVALUATIONS (student_id, subtopic_id, score, feedback, created_at)
VALUES ('U-2024-001', 103, 60.25, 'Struggles with binary tree balancing. Review AVL rotations.', TIMESTAMP '2026-02-18 11:45:00');

INSERT INTO EVALUATIONS (student_id, subtopic_id, score, feedback, created_at)
VALUES ('U-2024-002', 103, 78.00, 'Adequate tree traversal skills. Needs work on deletion algorithms.', TIMESTAMP '2026-02-19 16:30:00');
