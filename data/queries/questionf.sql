CREATE STREAM questionf WITH (value_format='JSON') AS
SELECT ref, name, value
FROM exploded_base
WHERE name='device_temperature' AND value > 35
HAVING count(*) > 5;