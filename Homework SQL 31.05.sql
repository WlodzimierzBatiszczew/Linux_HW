create database hw;
use hw

DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(128) not null,
        age INTEGER
	);
    
    DROP TABLE IF EXISTS Teachers;
    
    CREATE TABLE Teachers (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(128) not null,
        age INTEGER
	);
DROP TABLE IF EXISTS Competencies;
CREATE TABLE Competencies (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128) not null
	);
    
    DROP TABLE IF EXISTS Teachers2Competencies;
    CREATE TABLE Teachers2Competencies (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  teachers_id integer,
  competencies_id integer
	);
    
    DROP TABLE IF EXISTS Courses;
    CREATE TABLE Courses (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  teachers_id integer,
  title VARCHAR(128) not null,
  headman_id integer
	);
    DROP TABLE IF EXISTS Students2Courses;
    CREATE TABLE Students2Courses (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  student_id  integer,
  course_id  integer
	);
    
    
    INSERT INTO Students  (name, age) VALUES ("Анатолий", 29 ),
											 ("Олег", 25),
											 ("Семен", 27),
											 ("Олеся", 28),
											 ("Ольга", 31),
											 ("Иван", 22);
                                             
   INSERT INTO  Teachers  (name, age) VALUES ("Петр", 39 ),
											 ("Максим", 35),
											 ("Антон", 37),
											 ("Всеволод", 38),
											 ("Егор", 41),
											 ("Светлана", 32);   
                                             
 INSERT INTO  Competencies  (title) VALUES ("Математика" ),
											 ("Информатика"),
											 ("Программирование"),
											 ("Графика");
                                             
INSERT INTO   Teachers2Competencies  (teachers_id, competencies_id) VALUES (1, 1),
											                               (2, 1),
																		   (2, 3),
											                               (3, 2),
																		   (4, 1),
											                               (5, 3);   
                                                                           
                                                                           
 INSERT INTO Courses  (teachers_id, title, headman_id) VALUES (1, "Алгебра логики", 2 ),
											 (2, "Математическая статистика", 3),
											 (4, "Высшая математика", 5),
											 (5, "Javascript", 1),
											 (5, "Базовый Pyhton", 1);
                                             
INSERT INTO   Students2Courses  (student_id , course_id) VALUES (1, 1),
																(2, 1),
																(3, 2),
																(3, 3),
																(4, 5); 
                                                                
                                                                
											  
 SELECT
    t1.id,
	t1.name,
  t3.title
FROM Students t1
INNER JOIN Students2Courses t2
ON t1.id = t2.student_id
inner join Courses t3
on t2.course_id = t3.id;


SELECT
    t1.id,
	t1.name,
  t2.competencies_id
FROM Teachers t1
JOIN Teachers2Competencies t2
ON t1.id = t2.teachers_id;

SELECT 
t1.id,
 t1.name,
 t3.title
FROM Teachers t1
INNER JOIN Teachers2Competencies t2
ON t1.id = t2.teachers_id
INNER JOIN Competencies t3
ON t2.competencies_id = t3.id;

SELECT 
t1.id,
 t1.name,
t2.competencies_id
FROM Teachers t1
LEFT JOIN Teachers2Competencies t2
ON t1.id = t2.teachers_id
WHERE competencies_id is null;

SELECT 
t1.id,
 t1.name,
t2.course_id
FROM Students t1
LEFT JOIN Students2Courses t2
ON t1.id = t2.id
WHERE course_id is null;

SELECT 
t2.id,
t2.title,
t1.course_id
FROM Courses t2
LEFT JOIN Students2Courses t1
ON t1.course_id = t2.id
WHERE course_id is null;


SELECT 
t2.title,
t1.name
FROM Students t1
JOIN Courses t2
ON t1.id = t2.headman_id;


SELECT
    t1.id,
	t1.name,
  t3.title,
  t3.headman_id,
  t4.name
FROM Students t1
INNER JOIN Students2Courses t2
ON t1.id = t2.student_id
inner join Courses t3
on t2.course_id = t3.id
inner join Students t4
on t3.headman_id = t4.id;









21:55:25	SELECT * FROM Students t1 LEFT JOIN Courses t ON t1.id = t2.headman_id LIMIT 0, 50000	Error Code: 1054. Unknown column 't2.headman_id' in 'on clause'	0.00074 sec











                                           

                                             
                                             
    
    
    
    
    
    