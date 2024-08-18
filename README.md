SELECT * FROM ushouseholdincome;

SELECT * FROM ushouseholdincome_statistics;

alter table ushouseholdincome_statistics rename column `ï»¿id` to `id`;


select count(id) from ushouseholdincome;

select count(id) from ushouseholdincome_statistics;




SELECT * FROM ushouseholdincome;

SELECT * FROM ushouseholdincome_statistics;

select row_id, id, count(id) from 
ushouseholdincome
group by row_id,id
having count(id) >1;

SELECT * FROM ushouseholdincome;

# deleting duplicates

delete from ushouseholdincome
where row_id in(
	select * from(
		select row_id,id,
		row_number() over(PARTITION BY id order by id) as row_num
		from ushouseholdincome
		) as duplicates
	where row_num > 1
);


SELECT * FROM ushouseholdincome_statistics;


select distinct state_Name from 
ushouseholdincome
order by state_name
;


update ushouseholdincome
set state_name='Alabama'
where state_name='alabama'
;

SELECT * FROM ushouseholdincome;


select * from 
ushouseholdincome
where County='Autauga County';


update ushouseholdincome
set place = 'Autaugaville'
where County = 'Autauga County'
and city='Vinemont';

select type,count(type) from
ushouseholdincome
group by type;


update ushouseholdincome
set type='Borough'
where type = 'Boroughs';



select * from ushouseholdincome;

select ALand, Awater
from ushouseholdincome
where (Awater = 0 or Awater='' or Awater is null)
and (ALand = 0 or ALand='' or ALand is null) ;


# EDA



select state_name, sum(ALand),sum(AWater)
from ushouseholdincome
group by state_name
order by 3 desc
limit 10;


select * from ushouseholdincome u 
right join ushouseholdincome_statistics us
on u.id = us.id
where mean<>0;


select u.state_name, round(avg(mean),1), round(avg(median),1) from ushouseholdincome u 
inner join ushouseholdincome_statistics us
on u.id = us.id
where mean<>0
group by state_name
order by 3 desc
limit 10;



select type,count(type), round(avg(mean),1), round(avg(median),1) from ushouseholdincome u 
inner join ushouseholdincome_statistics us
on u.id = us.id
where mean<>0
group by type
order by 3 desc
limit 20;


select * from 
ushouseholdincome
where type = "Community";





select type,count(type), round(avg(mean),1), round(avg(median),1) from ushouseholdincome u 
inner join ushouseholdincome_statistics us
on u.id = us.id
where mean<>0
group by type
having count(type) >100
order by 3 desc
limit 20;




select u.state_name, u.City, round(avg(mean),1), round(avg(median),1) from ushouseholdincome u 
inner join ushouseholdincome_statistics us
on u.id = us.id
group by u.state_name, u.city
order by 3 desc
limit 10;
