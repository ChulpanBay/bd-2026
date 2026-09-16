CREATE TABLE Instructor (
	id SERIAL PRIMARY KEY,
	name VARCHAR
)

CREATE TABLE Student (
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(50)  NOT NULL,
    last_name  VARCHAR(50)  NOT NULL,
    email      VARCHAR(150) NOT NULL UNIQUE
)

CREATE TABLE Course (
	id SERIAL PRIMARY KEY,
	title VARCHAR NOT NULL UNIQUE,
	instructor_id INTEGER NOT NULL REFERENCES Instructor(id)
)

CREATE TABLE Assignment (
	id SERIAL PRIMARY KEY,
	course_id INTEGER NOT NULL REFERENCES Course(id),
	description TEXT NOT NULL
)

CREATE TABLE Enrollment (
	id SERIAL PRIMARY KEY,
	student_id INTEGER NOT NULL REFERENCES Student(id),
	course_id INTEGER NOT NULL REFERENCES Course(id),
	grade INTEGER,
	UNIQUE (student_id, course_id)
)