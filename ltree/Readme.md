
## Add extension 

First thing to do we need to install data type into db

```sql
CREATE EXTENSION IF NOT EXISTS ltree
```

## Import test data

Load `dit.sql` dump from `dataset` folder.

## Quick look at dataset

Let see what's in `dit` table.

```sql
SELECT * FROM dit
```

## Operators and functions

Let see what are the courses under College of Arts:

```sql
SELECT subpath(path, 3) FROM dit WHERE path <@ 'DIT.Art' and nlevel(path)=4
```

In this query we have been using 1 operator and 2 functions from ltree module:

- `subpath(field, offset)`: return a subpath of ltree field starting from an offset
- `nlevel(field)`: number of level in path
- `field1 <@ field2`: return if field1 is a descendant of field2 



Lets try another query now: let see the number of schools under each college.

```sql
SELECT subpath(path,1,1) AS "College",count(subpath(path,2,1)) AS "Number of Schools"
FROM dit
WHERE nlevel(path) = 3								   
GROUP BY subpath(path,1,1)
```

To achieve that we needed to:

- select the name of the College with `subpath(path,1,1)`: so getting `Art` from `DIT.Art.CreativeArts)` 
- select name of Schools with `subpath(path,2,1)`: so getting `CreativeArts` from `DIT.Art.CreativeArts)` 
- fiter path with 3 elements with `nlevel(path) = 3`
- group by College name with `subpath(path,1,1)`
