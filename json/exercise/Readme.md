
## Create test data

First create table:

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
