## Install extension

Enable hstore extension on your db:

```sql
CREATE EXTENSION hstore;
```

## Create test data

Lets create our test table

```sql
CREATE TABLE person
(
    id serial primary key,
    tax_number character varying,
    attributes hstore
)
```

and add some basic data:

```sql
insert into person(tax_number, attributes) 
values(
  'F1111111', 
  '"name"=>"michele", "surname"=>"capra",
  "age": 18,
  "city"=>"Brescia",
  "state"=>"Italy",'::hstore)
```

## Manipulate hstore

Lets select `fiscal_code` and `city` for each person:
```sql
SELECT attributes->'city' AS city, fiscal_code from person
```
Lets select all person that were born in `Brescia` with `@>` operator
```sql
SELECT * FROM person WHERE
 attributes @> '"city"=>"Brescia"' :: hstore;
```

with this and other operators you can use GiST and GIN index to have your query performing better. `=` operator supports also btree indexes is we need to do comparison on the entire hstore field.

Let select all people aged betwee 18 and 30 years.
```sql
SELECT * FROM person WHERE
 attributes @> '"age"=>' :: hstore;
```

Lets try to update `city` field in hstore 
```sql
UPDATE person SET attributes = attributes || '"city"=>"Roma"'::hstore WHERE fiscal_code= 'F1111111';
```

Now lets delete `birth` attribute inside hstore
```sql
UPDATE person SET attributes = delete(attributes, 'birth');
```
