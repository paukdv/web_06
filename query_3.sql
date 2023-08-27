SELECT
    subj.subject_name,
    gr.group_name,
    cast(avg(g.grade) as integer) AS avg_grade
FROM students s
    LEFT JOIN grades g ON s.id = g.student_id
    LEFT JOIN subjects subj ON g.subject_id = subj.id
    LEFT JOIN groups as gr ON gr.id = s.group_id
GROUP BY
    subj.subject_name,
    gr.group_name;