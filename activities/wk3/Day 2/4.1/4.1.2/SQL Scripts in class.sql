-- Investigate the data for any inconsistencies, missing values, or outliers in SQL


SELECT count(*) from claims where zipcode is null;

SELECT count(distinct claimid) from claims;
SELECT count(distinct zipcode) from locations;
SELECT count(distinct policyholderid) from policyholder;

SELECT count(*) - count(distinct zipcode) from locations;


select l.city, count(claimid)
from claims as c
join locations as l on c.zipcode = l.zipcode
group by l.city
order by count(claimid) desc;

select count(claimid)
from claims as c
join locations as l on c.zipcode = l.zipcode
order by count(claimid) desc;

select count(claimid) as count_claims
from claims;

select count(policyholderid) from policyholder; 

select sum(claimamount) as total_claim_amount from claims;

select a.accidenttype, sum(c.claimamount) as claim_amount
from claims as c
join accidenttype as a  on c.accidenttypeid = a.accidenttypeid
group by a.accidenttype;

select avg(claimamount) from claims;

select round(avg(policyholderage)) from policyholder;

select avg(claimamount) as avg_claim_amount, 
     round(avg(policyholderage)) as avg_age,
     min(claimamount) as min_claim_amount,
     max(claimamount) as max_claim_amount,
     min(policyholderage) as youngest,
     max(policyholderage) as oldest
from claims as c
join policyholder as p on c.policyholderid = p.policyholderid;


with cte_1 as 
(
select c.*, p.*
from claims as c
join policyholder as p on c.policyholderid = p.policyholderid)

select avg(claimamount), avg(policyholderage), min(claimamount)
from cte_1;

create view claim_ph as 
(select c.* , p.policyholderage, p.policyholdergender
from claims as c
join policyholder as p on c.policyholderid = p.policyholderid);

select avg(claimamount), avg(policyholderage), min(claimamount)
from claim_ph; 


with flat_data as
(
select
    c.claimid,
    c.claimamount,
    c.claimdate,
    c.fault,
    c.vehicleage,
    l.city,
    l.state,
    l.zipcode,
    p.policyholderage,
    p.policyholdergender,
    a.accidenttype,
    v.vehicletype,
    d.claimdayofweek,
    d.claimmonth,
    d.claimyear,
    d.claimquarter
from
    claims as c
    join accidenttype as a on c.accidenttypeid = a.accidenttypeid
    join date as d on c.claimdate = d.claimdate
    join locations as l on c.zipcode = l.zipcode
    join policyholder as p on c.policyholderid = p.policyholderid
    join vehicletype as v on c.vehicletypeid = v.vehicletypeid)

select * from flat_data;


select a.accidenttype, count(c.claimid) 
from claims as c
join accidenttype as a on c.accidenttypeid = a.accidenttypeid
group by a.accidenttype;



