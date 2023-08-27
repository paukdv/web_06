SELECT
    cast(avg(g.grade) as integer) AS avg_grade
FROM grades as g
    JOIN students as s ON s.id = g.student_id
    JOIN subjects as subj ON subj.id = g.subject_id
    JOIN teachers as t on t.id = subj.teacher_id
WHERE
    s.student_name = 'Victoria'
    and t.teacher_name = 'Parsons Scott';