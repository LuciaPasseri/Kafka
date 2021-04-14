CREATE TABLE questionc WITH (value_format='JSON') AS
SELECT ref, TIMESTAMPTOSTRING(WINDOWSTART,'yyyy-MM-dd HH:mm:ss','Europe/London') AS start_ts, count(*) AS count
FROM base_stream WINDOW TUMBLING (SIZE 60 SECONDS)
GROUP BY ref
EMIT CHANGES;