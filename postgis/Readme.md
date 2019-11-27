
## Import test data

Load dump from `dataset` folder.

## Quick look at data

Let see what's in those tables.

```sql
SELECT * FROM nycstation
```

There is a binary column called `geom` where we have stored gis info. Let's make it readable using `ST_AsText` gis function:

```sql
SELECT *,ST_AsText(geom) FROM nycstation
```
Lets do the same for the other tables.

## Working with points

Let try to get the the tube station that are less than 500mt from Grand Central Station exit on Park avenue:

```sql
SELECT name, cross_st
FROM nycstation
WHERE ST_Distance(
  geom, 
  (select geom from nycstation 
  where name ='Grand Central' 
  and cross_st = 'Park Ave')
  ) <= 500
```

We are using `ST_Distance` function because tube station data are saved as `GEOMERTY`.
The result from that function is in meter.
We could have used `ST_Distance_Sphere` if data were saved as `GEOGRAPHY`.

## Working with lines

Let try go get the name of the street crossing `Park Ave S`:

```sql
select name from nycstreet where 
ST_Crosses(geom, (select geom from nycstreet where name like '%Park Ave S%'))
order by name
```

We can also try visualize resluts from this query in QGIS.
We can select first `nycstreet` layout from `filter` function.

```
name = 'Park Ave S' 
```

Then we can add the outcome from the pgAdmin query.

```
name = 'Park Ave S' or name in ('E 18th St',
'E 19th St',
'E 20th St',
'E 21st St',
'E 22nd St',
'E 23rd St',
'E 24th St',
'E 25th St',
'E 26th St',
'E 27th St',
'E 28th St',
'E 29th St',
'E 30th St',
'E 31st St')
```
## Exercise

Here are some exercise that we could do:

- find the street that are inside or crossing the East village
- find the neighbourhood with most tube station
- find the longest road 
- finde the smallest neighbourhood
