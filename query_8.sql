SELECT
    subj.subject_name,
    cast(avg(g.grade) as integer) AS avg_grade
FROM grades as g
    JOIN subjects as subj ON subj.id = g.subject_id
    JOIN teachers as s ON s.id = subj.teacher_id
WHERE
    s.teacher_name = 'Stanton Rebecca'
GROUP BY subj.subject_name;