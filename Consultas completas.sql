

CREATE TABLE students(
	id_students serial PRIMARY KEY,
	name_students varchar(100) NOT NULL,
	age_students integer NOT NULL,
	course varchar(100) NOT NULL	
);

SELECT * FROM students;

ALTER TABLE students
DROP COLUMN course;

ALTER TABLE students ADD COLUMN course integer;

INSERT INTO students(name_students, age_students, course)
VALUES('João', 20, 1),
('Maria', 22, 2),
('Pedro',  21, 1);

CREATE TABLE course(
	id_course serial PRIMARY KEY,
	name_course varchar(150) NOT NULL,
	duration_year integer NOT NULL,
	professor_id integer NOT NULL
);

SELECT * FROM course;

INSERT INTO course(name_course, duration_year, professor_id)
VALUES('Ciência da Computação', 4, 1),
('Engenharia Civil', 5, 2);


CREATE TABLE teachers(
	id_teacher serial PRIMARY KEY,
	name_teacher varchar(100) NOT NULL,
	specialty varchar(100) NOT NULL
);

SELECT * FROM teachers;

INSERT INTO teachers(name_teacher, specialty)
VALUES('Carlos', 'Algoritimos'),
('Ana',  'fEngenharia de Estruturas');

SELECT name_students, age_students FROM
students WHERE age_students > 20 and course = 1;

SELECT name_course FROM course 
WHERE duration_year >= 4 and professor_id = 2;

SELECT course.professor_id, teachers.name_teacher, course.name_course, 
FROM course
INNER JOIN teachers
ON course.professor_id=teachers.id_teacher;

CREATE TABLE registration(
	id_registration serial PRIMARY KEY,
	id_student integer NOT NULL,
	id_course integer NOT NULL
);

INSERT INTO registration(id_student, id_course)
VALUES (1, 1), (2, 2), (3, 3);

SELECT * FROM registration;

SELECT registration.id_student, students.name_students, course.name_course
FROM registration
INNER JOIN students
ON registration.id_student=students.id_students
INNER JOIN course
ON registration.id_course=course.id_course;





