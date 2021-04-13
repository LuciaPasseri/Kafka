CREATE STREAM base_stream (ref varchar KEY, type varchar, m array<struct<k varchar, v double>>)
WITH (kafka_topic='mqtt', value_format='JSON_SR');

CREATE STREAM exploded_base AS
SELECT ref, type, EXPLODE(m)->k AS name, EXPLODE(m)->v AS value
FROM base_stream
EMIT CHANGES;