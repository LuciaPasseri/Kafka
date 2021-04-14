CREATE TABLE questiona WITH (value_format='JSON') AS
SELECT 1, TIMESTAMPTOSTRING(WINDOWSTART,'yyyy-MM-dd HH:mm:ss','Europe/London') AS start_ts, count(*) AS count
FROM base_stream WINDOW TUMBLING (SIZE 60 SECONDS)
GROUP BY 1
EMIT CHANGES;