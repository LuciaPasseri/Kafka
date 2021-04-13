CREATE TABLE questiong WITH (value_format='JSON') AS
SELECT ref, avg(value) AS average
FROM exploded_base WINDOW TUMBLING (SIZE 60 SECONDS)
WHERE name='device_temperature'
GROUP BY ref
HAVING (count(*) > 2 AND avg(value) > 25)
EMIT CHANGES;