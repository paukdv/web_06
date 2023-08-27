SELECT
    subject_name,
    teacher_name
FROM subjects as subj
    LEFT JOIN teachers as t ON t.id = subj.teacher_id
GROUP BY subject_name;