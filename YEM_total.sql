-- Question 1.1: provided sanity check; expected population is 26,832,212.
SELECT
    MIN(latitude) AS min_latitude,
    MIN(longitude) AS min_longitude,
    MAX(latitude) AS max_latitude,
    MAX(longitude) AS max_longitude,
    CAST(SUM(population) AS INTEGER) AS population
FROM yemen_2020
WHERE type = 'total_population';
