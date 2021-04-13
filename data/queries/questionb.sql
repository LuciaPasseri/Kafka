CREATE TABLE questionb WITH (value_format='JSON') AS
SELECT type, TIMESTAMPTOSTRING(WINDOWSTART,'yyyy-MM-dd HH:mm:ss','Europe/London') AS start_ts, count(*) AS count
FROM exploded_base WINDOW TUMBLING (SIZE 60 SECONDS)
GROUP BY type
EMIT CHANGES;