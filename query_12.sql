SELECT
    gr.group_name,
    s.student_name,
    g.grade,
    g.date_grade
FROM students s
    JOIN grades g ON s.id = g.student_id
    JOIN subjects subj ON subj.id = g.subject_id
    JOIN groups gr ON gr.id = s.group_id
WHERE (gr.group_name, g.date_grade) IN (
        SELECT
            gr.group_name,
            MAX(g.date_grade)
        FROM grades g
            JOIN students s ON s.id = g.student_id
            JOIN groups gr ON gr.id = s.group_id
            JOIN subjects subj ON subj.id = g.subject_id
        WHERE
            subj.subject_name = 'Kikuyu'
        GROUP BY
            gr.group_name
    )
    AND subj.subject_name = 'Kikuyu';