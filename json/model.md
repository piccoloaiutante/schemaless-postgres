## Modeling SQL and NoSQL data

Let say that we have to model a situation wher we have 3 entities:

- company
- company sharedholder (can have multiple company shares)
- company employees

If we had to do it with json we would have something like this:

```json
{
   "companyName":"Company 1",
   "directors":[
      {
         "name":"Michele",
         "surname":"Capra",
         "taxCode":"F1111111",
         "numberOfShares":0.34,
         "address":"via settima 105, brescia, italy"
      }
   ],
   "employees":[
      {
         "taxCode":"F1111112",
         "name":"John",
         "surname":"Smith",
         "salarie":100000,
         "address":"34 park avenue, New York"
      },
      {
         "taxCode":"F1111113",
         "name":"Barry",
         "surname":"Red",
         "salarie":80000,
         "address":"13 8th street, New York"
      }
   ]
}
```

If model it as entity relation we would do something like this:

```sql
CREATE TABLE company (
	id serial PRIMARY KEY,
  companyName character varying,
)

CREATE TABLE employee (
	taxcode character varying PRIMARY KEY,
  company_id bigint REFERENCE compnay(id),
  name character varying,
  surname character varying,
  address character varying
)

CREATE TABLE director (
	taxcode character varying PRIMARY KEY,
  name character varying,
  surname character varying,
  address character varying
)

CREATE TABLE company_director (
	company_id bigint REFERENCE company(id),
  taxcode character varying REFERENCE director(taxcode),
  numberOfShares float
)
```

We could model it with `jsonb`:

```sql
CREATE TABLE company (
	id serial PRIMARY KEY,
  companyName character varying
);

CREATE TABLE employee (
	taxcode character varying PRIMARY KEY,
  company_id bigint REFERENCES company(id),
  attribute jsonb
);

CREATE TABLE director (
	taxcode character varying PRIMARY KEY,
  attribute jsonb
);

CREATE TABLE company_director (
	company_id bigint REFERENCES company(id),
  taxcode character varying REFERENCES director(taxcode),
  numberOfShares float
)
```

Let say that we want to collect all director's address from `company 1`:

```sql
SELECT director.attribute->'address' AS address FROM company 
INNER JOIN company_director ON company.id = company_director.company_id
INNER JOIN director ON director.taxcode = company_director.taxcode
WHERE companyname = 'Company 1'
```

Let say that we want to get employee mean salary by company:

```sql
SELECT company.companyname, AVG((employee.attribute->>'salary') :: bigint) FROM
company INNER JOIN employee ON company.id = employee.company_id
GROUP BY company.companyname
```
