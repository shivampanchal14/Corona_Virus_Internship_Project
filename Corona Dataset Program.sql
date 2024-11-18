show databases;

use test;

select * from corona_virus_dataset cvd;


-- Q1. Write a code to check NULL values
select *
from corona_virus_dataset cvd
where Province is null;

select *
from corona_virus_dataset cvd
where `Country/Region` is null;

------ OR -------

select province, `country/region`, latitude, longitude,`date`, confirmed, deaths, recovered,
       case
	        when province is null then 1
            when `country/region` is null then 1
            when latitude is null then 1
            when longitude is null then 1
            when `date` is null then 1
            when confirmed is null then 1
            when deaths is null then 1
            when recovered is null then 1
            else 'No Change'
       end as Modified_Values
       from corona_virus_dataset cvd;

-- Q2. If NULL values are present, update them with zeros for all columns
-- No null values found --

-- Q3. check total number of rows
select count(*) as total_rows
from corona_virus_dataset cvd;

-- Q4. Check what is start_date and end_date


-- Q5. Number of month present in dataset
select count(distinct(Date)) as number_of_months
from corona_virus_dataset cvd;

-- Q6. Find monthly average for confirmed, deaths, recovered
select
    extract(year from `date`) as year,
    extract(month from `date`) as month,
    avg(confirmed) as avg_confirmed,
    avg(deaths) AS avg_deaths,
    avg(recovered) AS avg_recovered
from corona_virus_dataset cvd
group by year, month
order by year, month;

-- Q7. Find most frequent value for confirmed, deaths, recovered each month
select 
    month(`Date`) as `month`,
    mod(confirmed) as most_frequent_confirmed,
    mod(deaths) as most_frequent_deaths,
    mod(recovered) as most_frequent_recovered
from corona_virus_dataset cvd
group by month(`Date`);

-- Q8. Find minimum values for confirmed, deaths, recovered per year
select min(confirmed) 
from corona_virus_dataset cvd;

select min(Deaths) 
from corona_virus_dataset cvd;

select min(Recovered) 
from corona_virus_dataset cvd;

----- or -----

select
    year(date) as year,
    min(confirmed) AS min_confirmed,
    min(deaths) AS min_deaths,
    min(recovered) AS min_recovered
from corona_virus_dataset cvd
group by year(date);


-- Q9. Find maximum values of confirmed, deaths, recovered per year
select max(confirmed) 
from corona_virus_dataset cvd;

select max(Deaths) 
from corona_virus_dataset cvd;

select max(Recovered) 
from corona_virus_dataset cvd;

----- or ------

select
    year(date) as year,
    max(confirmed) as max_confirmed,
    max(deaths) as max_deaths,
    max(recovered) as max_recovered
from corona_virus_dataset cvd
group by year(date);

-- Q10. The total number of case of confirmed, deaths, recovered each month
select count(confirmed) 
from corona_virus_dataset cvd;

select count(Deaths) 
from corona_virus_dataset cvd;

select count(Recovered) 
from corona_virus_dataset cvd;

----- or -------

select
    month(date) as `month`,
    count(confirmed) as total_confirmed,
    count(deaths) as total_deaths,
    count(recovered) as total_recovered
from corona_virus_dataset cvd
group by month(date);

-- Q11. Check how corona virus spread out with respect to confirmed case
-- (Eg.: total confirmed cases, their average, variance & STDEV )
select 
      sum(confirmed) as total_confirmed_cases,
      avg(confirmed) as avg_confirmed,
      round(var_pop(Confirmed)) as total_variance,
      round(stddev(Confirmed)) as total_std_dev
from corona_virus_dataset cvd;

-- Q12. Check how corona virus spread out with respect to death case per month
-- (Eg.: total confirmed cases, their average, variance & STDEV )
select 
      sum(Deaths) as total_confirmed_deaths,
      avg(Deaths) as avg_deaths,
      round(var_pop(Deaths)) as total_variance,
      round(stddev(Deaths)) as total_std_dev
from corona_virus_dataset cvd;

-- Q13. Check how corona virus spread out with respect to recovered case
-- (Eg.: total confirmed cases, their average, variance & STDEV )
select 
      sum(Recovered) as total_confirmed_recovered,
      avg(Recovered) as avg_ecovered,
      round(var_pop(Recovered)) as total_variance,
      round(stddev(Recovered)) as total_std_dev
from corona_virus_dataset cvd;

-- Q14. Find Country having highest number of the Confirmed case
select `Country/Region`, 
max(confirmed) as highest_confirmed_cases
from corona_virus_dataset cvd
group by `Country/Region` 
order by highest_confirmed_cases desc
limit 1;

-- Q15. Find Country having lowest number of the death case
select `Country/Region`, 
min(Deaths) as lowest_deaths_cases
from corona_virus_dataset cvd
group by `Country/Region` 
order by lowest_deaths_cases desc
limit 1;

-- Q16. Find top 5 countries having highest recovered case
select `Country/Region`, 
max(Recovered) as highest_recovered_cases
from corona_virus_dataset cvd
group by `Country/Region` 
order by highest_recovered_cases desc
limit 5;




