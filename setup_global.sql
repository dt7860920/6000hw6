-- Run each statement separately in the same Athena database as Part 1.
CREATE EXTERNAL TABLE IF NOT EXISTS full_2020 (
    latitude FLOAT,
    longitude FLOAT,
    population FLOAT
)
PARTITIONED BY (month STRING, country STRING, type STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
LOCATION 's3://dataforgood-fb-data/csv/';

MSCK REPAIR TABLE full_2020;
