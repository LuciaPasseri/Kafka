CREATE STREAM questione WITH (value_format='JSON') AS
SELECT ref, name, value
FROM exploded_base
WINDOW TUMBLING (SIZE 60 SECONDS)
WHERE name='device_temperature' AND value > 35;