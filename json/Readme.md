
## Create test data

Lets create our test table and add contraint on `name` and `surname`:

```sql
CREATE TABLE person_json (
    id serial primary key,
    attributes JSON,
    tax_code character varying
)
```

and add some basic data:
```sql
insert into person_json(tax_code, attributes) 
values(
  'F1111111', 
  '{
   "name":"michele",
   "surname":"capra",
   "birth":"15/12/83",
   "city":"Brescia",
   "state":"Italy"
  }')
```

a json with spaces:
```sql
insert into person_json(tax_code, attributes) 
values(
  'F1111112', 
  '{
   "name":"paul",
   "surname":"irish",
   "birth":"12/08/90",

   "city":"Galway",
   "state":"Ireland"
  }')
```

a json with double keys:
```sql
insert into person_json(tax_code, attributes) 
values(
  'F1111113', 
  '{
   "name":"john",
   "surname":"smith",
   "birth":"3/04/77",
   "city":"Boston",
   "state":"USA",
   "surname":"red"
  }')
```

pg-admin doesn't format correctly json. So lets use `psql` to see what's has been saved:

```
psql -d demo

[local] michele@demo=# select * from person_json;

```
spaces, properties and key order have been preserved.

Now lets create a table with jsonb field and see how it goes.

```sql
CREATE TABLE person_jsonb (
    id serial primary key,
    attributes JSONB,
    tax_code character varying
)
```

## Data validation

Let say that we want to make sure that name and surname cannot be null in our data:
```sql
    ALTER TABLE person_jsonb ADD CONSTRAINT validate_name CHECK (length(attributes->>'name') > 0 AND (attributes->>'name') IS NOT NULL );
    ALTER TABLE person_jsonb ADD CONSTRAINT validate_surname CHECK (length(attributes->>'surname') > 0  AND (attributes->>'surname') IS NOT NULL );
```

There are even [packages](https://github.com/gavinwahl/postgres-json-schema) that are already implementing `json` validation for you at db level.

## Manipulate jsonb

Lets select `tax_code` and `city` for each person:
```sql
SELECT attributes->'city' AS city, tax_code from person_jsonb
```
Lets select all person that were born in `Brescia` with `@>` operator
```sql
SELECT * FROM person_jsonb WHERE
 attributes::jsonb @> '{"city":"Brescia"}'::jsonb;
```

Lets try to update `city` field: 
```sql
UPDATE person_jsonb SET attributes = jsonb_set(attributes, '{city}', '"Roma"') WHERE tax_code= 'F1111111';
```

Now lets delete `birth` attribute inside hstore
```sql
UPDATE person SET attributes = attributes::jsonb - 'birth';
```

## Indexes


Let say that for improving performance we want to add some indexes on `name` and `surname`:
```sql
CREATE INDEX name_index ON person_jsonb((attributes->>'name'));
CREATE INDEX surname_index ON person_jsonb((attributes->>'surname'));
```

## SQL and NoSQL data

Lets create those three tables:

```sql
  CREATE TABLE person (
    id serial primary key,
    attributes JSON,
    tax_code character varying
)
```
