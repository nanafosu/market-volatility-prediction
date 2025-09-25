CREATE OR REPLACE TABLE `media_vix.model_frame` AS
WITH cal AS (SELECT day FROM `media_vix.vix_raw`),
j AS (
  SELECT cal.day, t.tone_mean, t.doc_count, v.vix
  FROM cal
  LEFT JOIN `media_vix.gkg_tone_daily` t USING(day)
  LEFT JOIN `media_vix.vix_raw`        v USING(day)
),
ff AS (
  SELECT
    day,
    LAST_VALUE(tone_mean IGNORE NULLS) OVER (ORDER BY day) AS tone_mean_ff,
    LAST_VALUE(doc_count IGNORE NULLS) OVER (ORDER BY day) AS doc_count_ff,
    vix
  FROM j
)
SELECT
  *,
  vix - LAG(vix) OVER (ORDER BY day)                    AS dvix,
  LAG(tone_mean_ff, 1) OVER (ORDER BY day)              AS tone_lag1,
  LAG(tone_mean_ff, 2) OVER (ORDER BY day)              AS tone_lag2,
  LAG(vix, 1)        OVER (ORDER BY day)                AS vix_lag1,
  LEAD(vix, 1)       OVER (ORDER BY day)                AS vix_next
FROM ff
WHERE day >= '2018-01-02'
ORDER BY day;
