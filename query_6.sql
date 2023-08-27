SELECT
    gr.group_name,
    s.student_name
FROM students as s
    LEFT JOIN groups as gr ON s.group_id = gr.id
ORDER BY group_name