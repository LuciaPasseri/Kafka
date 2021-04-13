CREATE TABLE questiond WITH (value_format='JSON') AS
SELECT ref, name, MIN(value) AS min, MAX(value) AS max, AVG(value) AS average
FROM exploded_base WINDOW TUMBLING (SIZE 5 MINUTES)
WHERE value > 0
GROUP BY ref, name
EMIT CHANGES;