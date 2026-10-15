-- Question 1.3: use the assignment's approximate historical mapping.
-- Verified S3 partition spelling: elderly_60_plus.
WITH historical_regions AS (
    SELECT
        type,
        population,
        CASE
            WHEN adm1 IN (
                'Al Bayda''', 'Sana''a', 'Al Dali''', 'Al Hudaydah',
                'Al Jawf', 'Al Mahwit', 'Amanat Al Asimah', 'Amran',
                'Dhamar', 'Hajjah', 'Ibb', 'Ma''rib', 'Raymah',
                'Sa''dah', 'Ta''izz'
            ) THEN 'YAR'
            WHEN adm1 IN (
                'Aden', 'Abyan', 'Al Mahrah', 'Hadramawt', 'Lahij', 'Shabwah'
            ) THEN 'PDRY'
        END AS former_country
    FROM yemen_2020
    WHERE type IN ('elderly_60_plus', 'youth_15_24')
)
SELECT
    type,
    former_country,
    CAST(SUM(population) AS INTEGER) AS population
FROM historical_regions
WHERE former_country IS NOT NULL
GROUP BY type, former_country
ORDER BY type, former_country;
