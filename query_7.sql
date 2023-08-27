SELECT
    gr.group_name,
    s.student_name,
    g.grade
FROM grades as g
    LEFT JOIN students as s ON s.id = g.student_id
    LEFT JOIN groups as gr ON s.group_id = gr.id
    LEFT JOIN subjects as subj ON subj.id = g.subject_id
WHERE subject_name = 'Kikuyu'
GROUP BY
    gr.group_name,
    s.student_name;