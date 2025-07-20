-- EXCEPT identifica los registros que esten en una tabla, pero no la otra

SELECT monarch, country
FROM monarchs
EXCEPT
SELECT prime_minister, country
FROM prime_ministers;

/* 
You run a music streaming service
and have a list of songs a user has
listened to. You want to show them
new songs they haven't heard before.
*/