CREATE OR REPLACE TABLE `media_vix.gkg_tone_daily` AS
WITH g AS (
  SELECT
    DATE(TIMESTAMP(PARSE_TIMESTAMP('%Y%m%d%H%M%S', CAST(date AS STRING)))) AS day,
    CAST(SPLIT(v2tone, ',')[OFFSET(0)] AS FLOAT64) AS tone
  FROM `gdelt-bq.gdeltv2.gkg`
  WHERE DATE(TIMESTAMP(PARSE_TIMESTAMP('%Y%m%d%H%M%S', CAST(date AS STRING))))
        BETWEEN '2018-01-01' AND CURRENT_DATE()
)
SELECT day, AVG(tone) AS tone_mean, COUNT(*) AS doc_count
FROM g GROUP BY day ORDER BY day;