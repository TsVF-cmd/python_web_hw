-- 5 студентов с наибольшим средним баллом по всем предметам.

select student_id, avg(mark_value) as average_mark
from marks
group by student_id
order by average_mark desc
limit 5;

-- 1 студент с наивысшим средним баллом по одному предмету.

select student_id, course_id, avg(mark_value) as average_mark
from marks
where course_id = '2'
group by student_id, course_id
order by average_mark desc
limit 1;

-- Средний балл в группе по одному предмету.

select avg(m.mark_value)
from marks m
join students s on m.student_id=s.student_id
where m.course_id=1 and s.group_id=3;

-- Средний балл в потоке.

select avg(m.mark_value)
from marks m
join courses c on m.course_id=c.course_id
where m.course_id=2;

-- Какие курсы читает преподаватель.

select lecturer_name, lecturer_surname, course_name
from lecturers l
join courses c on l.lecturer_id=c.lecturer_id;

-- Список студетов в группе

select student_name, student_surname, group_name
from students S
join student_groups sg on s.group_id=sg.group_id;

-- Оценки студентов в группе по предмету.

select student_name, student_surname, course_name, mark_value
from students S
join marks m on s.student_id=m.student_id
join courses c on m.course_id=c.course_id;


-- Оценки студентов в группе по предмету на последнем занятии.

select student_name, student_surname, group_name, course_name, mark_value, max(mark_date) as LastLecture
from students S
join marks m on s.student_id=m.student_id
join courses c on m.course_id=c.course_id
join student_groups sg on s.group_id=sg.group_id
where c.course_id=1 and sg.group_id=1
group by student_name, student_surname, group_name, course_name, mark_value
order by max(mark_date);

-- Список курсов, которые посещает студент.

select s.student_name, s.student_surname, c.course_name
from students S
join student_courses sc on s.student_id=sc.student_id
join courses c on sc.course_id=c.course_id
group by s.student_name, s.student_surname, c.course_name
order by s.student_name;

-- Список курсов, которые студенту читает преподаватель.

select distinct(c.course_name)
from courses c 
join lecturers l on c.lecturer_id=l.lecturer_id
join student_courses sc on c.course_id=sc.course_id
where student_id=8 and l.lecturer_id=2;

-- Средний балл, который преподаватель ставит студенту.

select avg(mark_value) as avg_mark
from marks m 
join courses c on m.course_id=c.course_id
join student_courses sc on c.course_id=sc.course_id
where sc.student_id=5 and c.lecturer_id=2 
group by c.course_id;

-- Средний балл, который ставит преподаватель.

select avg(mark_value) as avg_mark
from marks m
join courses c on m.course_id=c.course_id
where c.Lecturer_id=2;