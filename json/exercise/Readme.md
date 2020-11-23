
## Create test data

First create those tables:

```sql

CREATE TABLE country
(
    country_sk serial primary key NOT NULL ,
    data jsonb
);

CREATE TABLE edition
(
    edition_sk serial primary key NOT NULL ,
    data jsonb
);

CREATE TABLE medals
(
    edition_sk integer NOT NULL ,
    country_sk integer NOT NULL ,
    data jsonb,
    PRIMARY KEY(edition_sk,country_sk)
);

```

Open exported sql files and copy all inserts into pgadmin and run them.

## Exercise

- select top 10 country ranked by total number of medal won
- select top 10 country ranked by total number of medal won by population
- select number of medals by continent in 2012 edition


## Solution

```SQL
select distinct CAST(c.data::json->'country_name'  as character varying) as name, sum(CAST(m.data->'gold' as int) + CAST(m.data->'silver' as int) + CAST(m.data->'bronze' as int))  as all_medals from country as c inner join medals as m on c.country_sk = m.country_sk
group by CAST(c.data::json->'country_name' as character varying)
order by all_medals DESC
limit 10
```

```SQL
select distinct CAST(c.data::json->'country_name'  as character varying) as name, sum(CAST(m.data->'gold' as float) + CAST(m.data->'silver' as float) + CAST(m.data->'bronze' as float))/CAST(c.data->'population' as float) as all_medals 
from country as c inner join medals as m on c.country_sk = m.country_sk
group by CAST(c.data::json->'country_name' as character varying), CAST(c.data->'population' as float)
order by (sum(CAST(m.data->'gold' as float) + CAST(m.data->'silver' as float) + CAST(m.data->'bronze' as float)) /CAST(c.data->'population' as float)) DESC
limit 10
```

```SQL
select c.data->'continent', sum(CAST(m.data->'gold' as int) + CAST(m.data->'silver' as int) + CAST(m.data->'bronze' as int))  as all_medals
from edition e inner join medals m on m.edition_sk=e.edition_sk inner join country c on c.country_sk = m.country_sk 
where e.data->'editionyear' ='2012'
group by c.data->'continent'
```