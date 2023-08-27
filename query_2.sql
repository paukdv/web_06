SELECT
    s.student_name,
    subj.subject_name,
    cast(avg(g.grade) as integer) as avg_grade
FROM students as s
    LEFT JOIN grades as g ON s.id = g.student_id
    LEFT JOIN subjects as subj ON g.subject_id = subj.id
GROUP BY
    s.student_name,
    g.subject_id
ORDER BY avg_grade DESC
LIMIT 1;