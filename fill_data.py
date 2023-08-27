from datetime import datetime
import faker
from random import randint
import sqlite3

NUMBER_STUDENTS = 30
NUMBER_TEACHERS = 5
NUMBER_SUBJECTS = 5
NUMBER_GROUPS = 3


def generate_fake_data(number_students, number_teachers, number_subjects, number_groups) -> tuple:
    fake_students = []
    fake_teachers = []
    fake_subjects = []
    fake_groups = []

    fake = faker.Faker()

    for _ in range(NUMBER_STUDENTS):
        fake_students.append(fake.first_name())

    for _ in range(NUMBER_TEACHERS):
        fake_teachers.append(fake.last_name() + " " + fake.first_name())

    for _ in range(NUMBER_SUBJECTS):
        fake_subjects.append(fake.language_name())

    for _ in range(NUMBER_GROUPS):
        fake_groups.append(fake.word())

    return fake_students, fake_teachers, fake_subjects, fake_groups


def prepare_data(students, teachers, subjects, groups) -> tuple():

    for_students = []
    for student in students:
        for_students.append((student, randint(1, NUMBER_GROUPS)))

    for_teachers = []
    for teacher in teachers:
        for_teachers.append((teacher, ))

    for_subjects = []
    for subject in subjects:
        for_subjects.append((subject, randint(1, NUMBER_TEACHERS)))

    for_groups = []
    for group in groups:
        for_groups.append((group, ))

    for_grades = []
    for student_id in range(1, NUMBER_STUDENTS + 1):
        for subject_id in range(1, NUMBER_SUBJECTS + 1):
            grade_data = datetime(2023, randint(9, 12), randint(10, 20)).date()
            for_grades.append(
                (student_id, subject_id, randint(1, 12), grade_data))

    return for_students, for_teachers, for_subjects, for_groups, for_grades


def insert_data_to_db(students, teachers, subjects, groups, grades) -> None:

    with sqlite3.connect('database.db') as con:

        cur = con.cursor()

    sql_to_students = """INSERT INTO students(student_name, group_id)
                    VALUES (?, ?)"""
    cur.executemany(sql_to_students, students)

    sql_to_teachers = """INSERT INTO teachers(teacher_name)
                    VALUES (?)"""
    cur.executemany(sql_to_teachers, teachers)

    sql_to_subjects = """INSERT INTO subjects(subject_name, teacher_id)
                    VALUES (?, ?)"""
    cur.executemany(sql_to_subjects, subjects)

    sql_to_groups = """INSERT INTO groups(group_name)
                    VALUES (?)"""
    cur.executemany(sql_to_groups, groups)

    sql_to_grades = """INSERT INTO grades(student_id, subject_id, grade, date_grade)
                    VALUES (?, ?, ?, ? )"""
    cur.executemany(sql_to_grades, grades)

    con.commit()


if __name__ == "__main__":
    students, teachers, subjects, groups, grades = prepare_data(
        *generate_fake_data(NUMBER_STUDENTS, NUMBER_TEACHERS, NUMBER_SUBJECTS, NUMBER_GROUPS))
    insert_data_to_db(students, teachers, subjects, groups, grades)
