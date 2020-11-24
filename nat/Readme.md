
## Create test data

Lets create our test table:

```sql
CREATE TABLE network_addresses (
    id serial primary key,
    ip cidr
)
```
## Import test data

Go to [dataset](../) folder.
Load `data.sql` dataset into database by copying,pasting and executing it into pgadmin.

## Quick look at dataset

Let see what's in `network_addresses` table.

```sql
SELECT * FROM network_addresses
```

It contains a list of ips.

## Operators and functions

Lets look at couple of examples to explore some operators and functions of this data type.

As first example le't try to see if there are ip addresses that are included in `94.23.0.0/16` range:

```sql
SELECT ip FROM network_addresses WHERE ip << '94.23.0.0/16'
```
In this query we have been using the `<<` that look for ip ranges contained in another one.


As second example lets look now for the biggest ip range contained in this dataset:

```sql
SELECT ip FROM network_addresses WHERE masklen(ip) = (SELECT min(masklen(ip)) FROM network_addresses);
```

In this query we used `masklen` function that return the length of the netmask for an ip address. 

These are just two examples but to show you how to play a bit with Network Address data type. Further information about network address operators and functions can be found [here](https://www.postgresql.org/docs/13/functions-net.html).
