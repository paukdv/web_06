SELECT subj.subject_name
FROM grades as g
    JOIN students as s ON s.id = g.student_id
    JOIN subjects as subj ON subj.id = g.subject_id
WHERE
    s.student_name = 'Victoria';