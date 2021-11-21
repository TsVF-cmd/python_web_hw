CREATE TABLE student_groups(
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(10),
	CONSTRAINT unique_group_id UNIQUE (group_id)
);

CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    student_name TEXT,
    student_surname TEXT,
    group_id INT,
	-- one student can be only in one group
	CONSTRAINT unique_student_group UNIQUE (student_id, group_id),
	--relations
	CONSTRAINT fk_group_id FOREIGN KEY(group_id) REFERENCES student_groups(group_id)
    ON DELETE NO ACTION
    ON UPDATE cascade
);

CREATE TABLE lecturers (
    lecturer_id SERIAL PRIMARY KEY,
    lecturer_name TEXT,
    lecturer_surname TEXT,
   	CONSTRAINT unique_lecturer_id UNIQUE (lecturer_id)
);

CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name TEXT,
    lecturer_id INT,
	CONSTRAINT unique_course UNIQUE (course_id),
	--relations
	CONSTRAINT fk_lecturer_id FOREIGN KEY(lecturer_id) REFERENCES lecturers(lecturer_id)
    ON DELETE NO ACTION
    ON UPDATE cascade
);
	
CREATE TABLE marks(
    mark_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
	mark_date DATE, --DEFAULT (CURRENT_DATE),
    mark_value SMALLINT,
    CONSTRAINT unique_mark UNIQUE (mark_id, student_id, course_id, mark_date, mark_value),
	--relations
	CONSTRAINT fk_student_id FOREIGN KEY(student_id) REFERENCES students(student_id),
	CONSTRAINT fkcourse_id FOREIGN KEY(course_id) REFERENCES courses(course_id)
    ON DELETE NO ACTION
    ON UPDATE cascade
);

CREATE TABLE student_courses(
	student_course_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
	CONSTRAINT unique_student_course UNIQUE (student_course_id),
	--relations
    CONSTRAINT fk_student_id FOREIGN KEY(student_id) REFERENCES students(student_id),
	CONSTRAINT fkcourse_id FOREIGN KEY(course_id) REFERENCES courses(course_id)
    ON DELETE NO ACTION
    ON UPDATE cascade
);

INSERT INTO student_groups(group_name)
VALUES('A10'), ('B10'), ('C10')
RETURNING *;

INSERT INTO lecturers (lecturer_name, lecturer_surname)
VALUES('Adam', 'Smith'), ('John', 'Doe'), ('Jane', 'Doe')
RETURNING *;

INSERT INTO courses (course_name, lecturer_id)
VALUES('Math', '1'), ('Biology', '2'), ('Chemistry', '2'), ('Physics', '3'), ('Geography', '3')
RETURNING *;

INSERT INTO students (student_name, student_surname, group_id)
VALUES ('Ad', 'Perillio', 1), ('Ira', 'Spinozzi', 1), ('Mathew', 'Dallender', 1), ('Alysia', 'Patron', 1), ('Angela', 'Perche', 1), ('Regine', 'Dargue', 1), ('Kerk', 'Clutton', 1), ('Maribel', 'Bonwell', 1), ('Edna', 'Fearick', 1), ('Jerrome', 'Natwick', 1), ('Derrek', 'Enochsson', 2), ('Hermina', 'Zanneli', 2), ('Bobina', 'Hunting', 2), ('Fredelia', 'Grzelak', 2), ('Raffaello', 'Watford', 2), ('Kerby', 'Enevoldsen', 2), ('Sigfrid', 'Sandwick', 2), ('Steffi', 'Sheldon', 2), ('Brit', 'Feldfisher', 2), ('Cecilia', 'Domeney', 2), ('Blanche', 'Rimington', 3), ('Griff', 'Welfair', 3), ('Doroteya', 'Garlic', 3), ('Nickie', 'Tattersill', 3), ('Frants', 'Berrie', 3), ('Liesa', 'Spinke', 3), ('Sarina', 'Lapides', 3), ('Maryanne', 'Rigard', 3), ('Ilyssa', 'Evesque', 3), ('Brenden', 'Dodson', 3)
RETURNING *;

INSERT INTO student_courses (student_id, course_id)
VALUES ('1', '1'), ('1', '2'), ('1', '3'), ('1', '4'), ('1', '5'), ('2', '1'), ('2', '2'), ('2', '3'), ('2', '4'), ('2', '5'), ('3', '3'), ('3', '2'), ('3', '3'), ('3', '4'), ('3', '5'), ('4', '1'), ('4', '2'), ('4', '3'), ('4', '4'), ('4', '5'), ('5', '1'), ('5', '2'), ('5', '3'), ('5', '4'), ('5', '5'), ('6', '1'), ('6', '2'), ('6', '3'), ('6', '4'), ('6', '5'), ('7', '1'), ('7', '2'), ('7', '3'), ('7', '4'), ('7', '5'), ('8', '1'), ('8', '2'), ('8', '3'), ('8', '4'), ('8', '5'), ('9', '1'), ('9', '2'), ('9', '3'), ('9', '4'), ('9', '5'), ('10', '1'), ('10', '2'), ('10', '3'), ('10', '4'), ('10', '5'), ('11', '1'), ('11', '2'), ('11', '3'), ('11', '4'), ('11', '5'), ('12', '1'), ('12', '2'), ('12', '3'), ('12', '4'), ('12', '5'), ('13', '1'), ('13', '2'), ('13', '3'), ('13', '4'), ('13', '5'), ('14', '1'), ('14', '2'), ('14', '3'), ('14', '4'), ('14', '5'), ('15', '1'), ('15', '2'), ('15', '3'), ('15', '4'), ('15', '5'), ('16', '1'), ('16', '2'), ('16', '3'), ('16', '4'), ('16', '5'), ('17', '1'), ('17', '2'), ('17', '3'), ('17', '4'), ('17', '5'), ('18', '1'), ('18', '2'), ('18', '3'), ('18', '4'), ('18', '5'), ('19', '1'), ('19', '2'), ('19', '3'), ('19', '4'), ('19', '5'), ('20', '1'), ('20', '2'), ('20', '3'), ('20', '4'), ('20', '5'), ('21', '1'), ('21', '2'), ('21', '3'), ('21', '4'), ('21', '5'), ('22', '1'), ('22', '2'), ('22', '3'), ('22', '4'), ('22', '5'), ('23', '1'), ('23', '2'), ('23', '3'), ('23', '4'), ('23', '5'), ('24', '1'), ('24', '2'), ('24', '3'), ('24', '4'), ('24', '5'), ('25', '1'), ('25', '2'), ('25', '3'), ('25', '4'), ('25', '5'), ('26', '1'), ('26', '2'), ('26', '3'), ('26', '4'), ('26', '5'), ('27', '1'), ('27', '2'), ('27', '3'), ('27', '4'), ('27', '5'), ('28', '1'), ('28', '2'), ('28', '3'), ('28', '4'), ('28', '5'), ('29', '1'), ('29', '2'), ('29', '3'), ('29', '4'), ('29', '5'), ('30', '1'), ('30', '2'), ('30', '3'), ('30', '4'), ('30', '5')
RETURNING *;

insert into marks (student_id, course_id, mark_date, mark_value) values (1, 3, '2020-11-27 22:19:54', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (2, 3, '2021-03-06 03:27:53', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (3, 1, '2021-10-18 00:06:39', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (4, 4, '2021-03-03 15:07:45', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (5, 2, '2020-11-29 16:03:00', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (6, 1, '2020-12-23 02:28:46', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (7, 2, '2021-07-26 12:35:07', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (8, 3, '2020-12-15 02:58:42', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (9, 1, '2021-02-09 10:30:34', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (10, 1, '2021-03-15 17:03:17', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (11, 4, '2021-09-02 02:16:50', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (12, 1, '2021-01-08 13:25:31', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (13, 2, '2021-07-18 05:32:09', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (14, 3, '2020-11-21 06:39:44', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (15, 5, '2021-07-09 15:52:20', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (16, 5, '2021-03-03 03:56:47', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (17, 5, '2021-10-20 00:48:20', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (18, 1, '2021-03-06 18:54:03', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (19, 4, '2020-12-09 04:21:38', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (20, 4, '2021-04-11 05:33:02', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (21, 2, '2020-12-22 05:13:15', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (22, 4, '2021-07-11 06:49:28', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (23, 1, '2021-03-08 08:41:01', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (24, 3, '2021-05-28 21:55:55', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (25, 3, '2021-05-01 05:02:31', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (26, 2, '2021-05-30 17:35:29', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (27, 2, '2021-09-05 10:14:11', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (28, 3, '2021-04-09 08:26:50', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (29, 1, '2021-02-06 17:21:24', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (30, 1, '2021-10-14 16:31:14', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (1, 1, '2021-08-14 20:55:46', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (2, 2, '2021-01-27 02:48:27', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (3, 1, '2021-07-19 01:23:19', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (4, 1, '2021-01-30 06:01:23', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (5, 3, '2021-09-14 01:03:54', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (6, 4, '2021-04-27 05:22:55', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (7, 1, '2021-03-01 21:57:33', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (8, 3, '2021-05-13 12:43:07', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (9, 5, '2021-10-31 12:54:01', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (10, 1, '2020-12-28 11:18:25', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (11, 3, '2021-07-04 16:43:15', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (12, 3, '2020-11-20 09:35:07', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (13, 4, '2021-11-03 01:51:48', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (14, 4, '2021-08-20 07:46:14', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (15, 2, '2021-10-24 05:45:25', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (16, 5, '2021-01-16 19:07:47', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (17, 5, '2021-01-15 10:09:09', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (18, 4, '2021-11-07 09:20:03', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (19, 3, '2020-12-10 04:56:24', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (20, 4, '2021-03-14 18:15:10', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (21, 1, '2021-03-30 08:10:20', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (22, 1, '2021-03-15 09:00:53', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (23, 5, '2021-04-16 00:44:49', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (24, 2, '2021-04-08 04:12:38', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (25, 1, '2020-11-22 05:24:14', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (26, 5, '2021-01-25 14:12:07', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (27, 5, '2021-11-07 18:47:35', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (28, 2, '2021-08-21 06:58:29', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (29, 1, '2020-12-29 20:54:00', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (30, 2, '2021-08-03 00:29:41', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (1, 2, '2021-11-06 19:58:19', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (2, 5, '2021-09-21 12:15:47', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (3, 2, '2021-01-12 02:59:11', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (4, 4, '2021-04-17 09:54:11', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (5, 4, '2021-07-07 18:59:37', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (6, 5, '2021-01-23 08:26:33', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (7, 1, '2021-10-17 02:38:18', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (8, 3, '2021-05-09 12:21:48', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (9, 5, '2021-05-21 08:00:04', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (10, 4, '2021-01-26 06:56:34', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (11, 4, '2020-12-12 15:29:20', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (12, 4, '2021-03-18 18:23:52', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (13, 5, '2020-12-19 03:23:53', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (14, 5, '2021-03-22 07:24:02', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (15, 4, '2021-09-20 04:04:15', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (16, 3, '2021-06-02 20:54:42', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (17, 3, '2021-04-07 03:10:08', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (18, 3, '2021-09-23 01:13:18', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (19, 5, '2021-03-28 18:45:28', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (20, 5, '2021-03-24 03:59:42', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (21, 5, '2021-07-29 01:34:05', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (22, 3, '2021-02-06 15:27:33', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (23, 3, '2021-08-26 17:12:43', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (24, 1, '2021-02-25 03:03:41', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (25, 3, '2020-11-20 04:11:26', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (26, 5, '2021-03-20 04:27:58', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (27, 2, '2021-05-21 00:08:52', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (28, 1, '2021-07-19 10:36:56', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (29, 2, '2021-10-17 17:02:52', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (30, 3, '2021-05-14 12:58:57', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (1, 5, '2021-05-27 01:13:45', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (2, 5, '2020-12-03 12:34:45', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (3, 1, '2021-04-02 14:43:00', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (4, 1, '2021-02-18 22:25:56', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (5, 3, '2021-09-23 10:12:59', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (6, 2, '2021-07-11 07:15:47', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (7, 4, '2020-12-15 04:04:29', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (8, 1, '2021-03-17 22:11:25', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (9, 1, '2021-08-15 14:06:40', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (10, 2, '2021-02-04 00:21:15', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (11, 4, '2021-11-11 12:33:52', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (12, 5, '2021-02-13 11:58:37', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (13, 4, '2021-02-25 22:52:49', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (14, 3, '2021-03-07 12:34:33', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (15, 2, '2021-09-20 14:00:22', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (16, 2, '2021-11-19 04:47:28', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (17, 2, '2021-02-21 03:12:54', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (18, 2, '2021-06-20 19:01:50', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (19, 4, '2020-12-01 21:25:39', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (20, 3, '2021-10-27 17:29:28', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (21, 5, '2021-02-22 13:05:32', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (22, 1, '2021-01-24 11:27:21', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (23, 5, '2021-09-04 11:04:52', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (24, 3, '2021-04-16 09:23:05', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (25, 4, '2020-12-03 15:38:36', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (26, 4, '2020-12-29 21:16:53', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (27, 3, '2021-04-01 09:35:28', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (28, 4, '2021-05-10 19:44:26', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (29, 4, '2020-12-16 22:34:05', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (30, 2, '2021-10-02 18:45:16', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (1, 2, '2021-11-05 06:54:38', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (2, 2, '2021-08-06 10:45:54', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (3, 2, '2021-11-03 15:49:17', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (4, 4, '2021-06-24 11:38:58', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (5, 3, '2020-12-18 13:42:45', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (6, 4, '2021-01-15 17:03:50', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (7, 5, '2021-08-20 05:16:07', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (8, 5, '2021-04-02 07:44:33', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (9, 1, '2021-02-09 18:28:18', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (10, 1, '2021-01-13 13:02:38', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (11, 5, '2021-04-25 15:44:37', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (12, 1, '2021-07-03 00:14:18', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (13, 5, '2021-09-18 12:13:42', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (14, 2, '2021-04-20 01:32:50', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (15, 2, '2021-05-03 18:14:37', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (16, 4, '2021-02-15 05:48:55', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (17, 1, '2021-04-03 16:04:21', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (18, 3, '2021-08-20 07:38:19', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (19, 5, '2021-10-01 00:25:20', 5);
insert into marks (student_id, course_id, mark_date, mark_value) values (20, 5, '2021-08-09 23:33:53', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (21, 1, '2021-04-29 21:26:13', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (22, 1, '2021-09-18 07:10:50', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (23, 5, '2021-11-06 19:06:39', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (24, 5, '2021-11-12 11:48:40', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (25, 4, '2021-10-30 10:19:23', 3);
insert into marks (student_id, course_id, mark_date, mark_value) values (26, 1, '2020-12-15 23:08:12', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (27, 3, '2021-01-26 16:45:29', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (28, 5, '2021-03-25 11:01:02', 4);
insert into marks (student_id, course_id, mark_date, mark_value) values (29, 5, '2021-06-27 12:19:23', 2);
insert into marks (student_id, course_id, mark_date, mark_value) values (30, 1, '2021-02-10 15:18:19', 2);
