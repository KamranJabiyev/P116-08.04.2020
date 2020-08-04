Select Firstname from Students

Select distinct Firstname from Students

Select Firstname,Count(Firstname) 'Count' from Students
Group by Firstname
having Count(Firstname)>1

Select Count(Firstname) from Students

Select Firstname,Lastname from Students where Firstname='Hesen'

Select COUNT(distinct Firstname) from Students

create table OldStudents(
	Id int identity primary key,
	Firstname nvarchar(100) not null,
	Lastname nvarchar(100)
)

Select Firstname,Lastname from Students
union
Select Firstname,Lastname from OldStudents

Select Firstname,Lastname from Students
union all
Select Firstname,Lastname from OldStudents

select Firstname,Lastname from Students
except
select Firstname,Lastname from OldStudents

select Firstname,Lastname from OldStudents
except
select Firstname,Lastname from Students

select Firstname,Lastname from Students
intersect
select Firstname,Lastname from OldStudents

create view usv_GetStudentDetail
as
Select Firstname,Lastname,g.Name 'Group',gt.Name 'Type',Email,Age,Grade,Letter from Students st

join StudentGroups stg
on st.Id=stg.StudentsId

join Groups g
on stg.GroupsId=g.Id

join GroupTypes gt
on g.GroupTypesId=gt.Id

join Grades gr
on st.Grade Between gr.MinGrade and gr.MaxGrade

select * from usv_GetStudentDetail

create procedure usp_GetStudentGrade @Grade int
as
select * from Students
where Grade>=@Grade

exec usp_GetStudentGrade 70

exec usp_GetStudentGrade 80

create procedure usp_GetStudentGradeAge (@Grade int,@Age int)
as
select * from Students
where Grade>=@Grade and Age>=@Age

exec usp_GetStudentGradeAge 80,18

exec usp_GetStudentGradeAge 70,20

create procedure usp_GetStudentGradeAgeDefault (@Grade int,@Age int=18)
as
select * from Students
where Grade>=@Grade and Age>=@Age

exec usp_GetStudentGradeAgeDefault 70