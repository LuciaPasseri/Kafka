CREATE TABLE questionf WITH (value_format='JSON') AS
SELECT ref, name, value, count(*) AS count
FROM exploded_base
WINDOW TUMBLING (SIZE 60 SECONDS)
WHERE name='device_temperature' AND value > 35
GROUP BY ref, name, value
HAVING count(*) > 5;