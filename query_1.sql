SELECT
    s.student_name,
    cast(avg(g.grade) as integer) as average_grade
FROM students as s
    LEFT JOIN grades as g ON s.id = g.student_id
GROUP BY s.id
ORDER BY average_grade DESC
LIMIT 5;