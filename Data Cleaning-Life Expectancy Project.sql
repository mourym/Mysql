
#Data Cleaning Project

SELECT * FROM world_life_expectancy;

#identifying duplicates in the dataset
#Removing duplicates if anything availabe

#so combining county and year column to make unique column


SELECT Country, year, concat(country, year),count(concat(country, year))
from world_life_expectancy
group by Country, year, concat(country, year)
having count(concat(Country, year)) > 1;


# identifying row_id's to remove the data from the dataset

select *
from(
select row_id, concat(Country, year),
ROW_NUMBER() over(PARTITION BY concat(Country, year) order by concat(country, year)) as row_num
from world_life_expectancy) as row_table
where row_num > 1;


#deleting the data from the dataset

delete from world_life_expectancy
where row_id in (
select row_id
from(
select row_id, concat(Country, year),
ROW_NUMBER() over(PARTITION BY concat(Country, year) order by concat(country, year)) as row_num
from world_life_expectancy) as row_table
where row_num > 1);


#checking for blanks or duplicates in status column

select * from world_life_expectancy
where Status = '';


select distinct Country
from world_life_expectancy
where Status = 'Developing';

update world_life_expectancy
set Status='Developing'
where Country in (select distinct Country
				from world_life_expectancy
				where Status = 'Developing');

#joining tables to itself

update world_life_expectancy t1
join world_life_expectancy t2
on t1.Country = t2.Country
set t1.Status="Developing"
where t1.status=''
and t2.status<>''
and t2.status='Developing';


#only one is remaingin blank in status
select * from world_life_expectancy
where status='';


select * from world_life_expectancy
where Country='United States of America';




#joining tables to itself

update world_life_expectancy t1
join world_life_expectancy t2
on t1.Country = t2.Country
set t1.Status="Developed"
where t1.status=''
and t2.status<>''
and t2.status='Developed';

select * from world_life_expectancy
where status is  null;


select * from world_life_expectancy;

select country, year, `Life expectancy`
from world_life_expectancy;



select * from world_life_expectancy
where `Life expectancy` = '' ;

#joining table to itself 

select t1.Country, t1.year, t1.`Life expectancy`,
t2.Country, t2.year, t2.`Life expectancy`,
t3.Country, t3.year, t3.`Life expectancy`,
round((t2.`Life expectancy` + t3.`Life expectancy` )/2,1)
from world_life_expectancy t1
join world_life_expectancy t2
on t1.Country = t2.Country
and t1.year = t2.year - 1
join world_life_expectancy t3
on t1.Country = t3.Country
and t1.year = t3.year + 1
where t1.`Life expectancy` = '';


update  world_life_expectancy t1
join world_life_expectancy t2
on t1.Country = t2.Country
and t1.year = t2.year - 1
join world_life_expectancy t3
on t1.Country = t3.Country
and t1.year = t3.year + 1
set t1.`Life expectancy` = round((t2.`Life expectancy` + t3.`Life expectancy` )/2,1)
where t1.`Life expectancy` = '' ;



select * from world_life_expectancy;





