-- Run each statement separately in Athena (us-east-1).
-- Select your database and configure an S3 query-results location first.
CREATE EXTERNAL TABLE IF NOT EXISTS yemen_2020 (
    latitude FLOAT,
    longitude FLOAT,
    population FLOAT,
    adm1 STRING
)
PARTITIONED BY (type STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
LOCATION 's3://dsan6000-hrsl/yemen-2020/';

MSCK REPAIR TABLE yemen_2020;

-- Check the actual category names before writing demographic filters.
SHOW PARTITIONS yemen_2020;
