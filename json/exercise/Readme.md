
## Create test data

First create table:

```sql

CREATE TABLE country
(
    country_sk serial primary key NOT NULL ,
    data jsonb
)

CREATE TABLE edition
(
    edition_sk serial primary key NOT NULL ,
    data jsonb
)

CREATE TABLE medals
(
    edition_sk integer NOT NULL ,
    country_sk integer NOT NULL ,
    data jsonb,
    PRIMARY KEY(edition_sk,country_sk)
)

```

Import data into db:


```sql

\copy edition  FROM '/users/michele/Desktop/edition.csv' DELIMITER ',' CSV HEADER;
\copy country  FROM '/users/michele/Desktop/country.csv' DELIMITER ',' CSV HEADER;
\copy medals  FROM '/users/michele/Desktop/medals.csv' DELIMITER ',' CSV HEADER;
```

## Exercise

- select top 10 country ranked by total number of medal won
- select top 10 country ranked by total number of medal won by population
- select number of medals by continent in 2012 edition
