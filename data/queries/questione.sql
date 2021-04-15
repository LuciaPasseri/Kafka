CREATE STREAM questione WITH (value_format='JSON') AS
SELECT ref, name, value
FROM exploded_base
WHERE name='device_temperature' AND value > 30;