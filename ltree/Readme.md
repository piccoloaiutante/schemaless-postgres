
## Add extension 

First thing to do we need to install data type into db

```sql
CREATE EXTENSION IF NOT EXISTS ltree
```

## Import test data

Go to [dataset](../) folder.
Load `tud.sql` dataset into database by copying,pasting and executing it into pgadmin.

## Quick look at dataset

Let see what's in `tud` table.

```sql
SELECT * FROM tud
```

It contains the hierarchical representation of some university courses in form of: `University.School.Degree.Courses`

## Operators and functions

Let see what are the courses under College of Arts:

```sql
SELECT subpath(path, 3) FROM tud WHERE path <@ 'TUD.Art' and nlevel(path)=4
```

In this query we have been using 1 operator and 2 functions from ltree module:

- `subpath(field, offset)`: return a subpath of ltree field starting from an offset
- `nlevel(field)`: number of level in path
- `field1 <@ field2`: return if field1 is a descendant of field2 



Lets try another query now: let see the number of schools under each college.

```sql
SELECT subpath(path,1,1) AS "College",count(subpath(path,2,1)) AS "Number of Schools"
FROM tud
WHERE nlevel(path) = 3								   
GROUP BY subpath(path,1,1)
```

To achieve that we needed to:

- select the name of the College with `subpath(path,1,1)`: so getting `Art` from `TUD.Art.CreativeArts)` 
- select name of Schools with `subpath(path,2,1)`: so getting `CreativeArts` from `TUD.Art.CreativeArts)` 
- fiter path with 3 elements with `nlevel(path) = 3`
- group by College name with `subpath(path,1,1)`

## Exercise

- Find under which degree is the `ScientificProject` course. (You might want to check [here](https://www.postgresql.org/docs/13/ltree.html#id-1.11.7.30.8) how pattern matching operator works)
- Find how many courses are liste in `tud` dataset
- Find which faculty has the highset number of courses.


## Solution 

```SQL
SELECT subpath(path, 2,1) 
FROM tud
WHERE path  ~ '*.ScientificProject';
```

```SQL
SELECT count(subpath(path, 3)) 
FROM tud 
WHERE path <@ 'TUD' and nlevel(path)=4;
```

```SQL
SELECT subpath(path, 1,1), count(subpath(path, 3))
FROM tud 
WHERE path <@ 'TUD' and nlevel(path)=4
GROUP BY subpath(path, 1,1)
ORDER BY count(subpath(path, 3)) DESC
LIMIT 1
```