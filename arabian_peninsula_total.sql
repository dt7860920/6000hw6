-- Question 2.1: combined population of Yemen, Oman, and Saudi Arabia.
SELECT
    CAST(SUM(population) AS BIGINT) AS population
FROM full_2020
WHERE month = '2019-06'
  AND country IN ('YEM', 'OMN', 'SAU')
  AND type = 'total_population';
