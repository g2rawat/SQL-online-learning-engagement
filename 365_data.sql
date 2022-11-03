use 365_database;

/*
Aim: To find course_rating for every student with course_id
*/
SELECT ci.course_title,cr.*,DATE_FORMAT(`date_rated`, '%m') `month` FROM 365_course_info ci
join 365_course_ratings cr on ci.course_id=cr.course_id;

/*
Aim: To find the average rating of each course with respect to every months
or
Aim: To find the average rating movement every month for each course
*/
with table_1 as (
SELECT ci.course_title,cr.* FROM 365_course_info ci
join 365_course_ratings cr on ci.course_id=cr.course_id)
select course_id,course_title, round(avg(course_rating),2) avg_rating, date_format(`date_rated`,"%m") Month from table_1 t1
group by month, course_id
order by month asc, avg_rating desc;
/*
Aim: To find student purchase data
*/
 select si.student_country, sp.* from 365_student_info si 
join 365_student_purchases sp on sp.student_id=si.student_id;

/*
Aim: Find number of each purchase_type from every country
*/
with table_2 as (
 select si.student_country, sp.* from 365_student_info si 
join 365_student_purchases sp on sp.student_id=si.student_id)
select count(student_id) student_count, student_country,purchase_type from table_2 t2
group by student_country, purchase_type
order by student_country,student_count desc;




