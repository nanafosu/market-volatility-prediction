-- Evaluate on holdout
SELECT *
FROM ML.EVALUATE(
  MODEL `media_vix.vix_reg`,
  (
    SELECT tone_lag1, tone_lag2, vix, vix_lag1, dvix, vix_next
    FROM `media_vix.model_frame`
    WHERE day >= '2025-01-01' AND vix_next IS NOT NULL
  )
);

-- Save predictions with actuals for easy plotting
CREATE OR REPLACE TABLE `media_vix.predictions` AS
SELECT
  day,
  vix_next AS actual_next,
  predicted_vix_next
FROM ML.PREDICT(
  MODEL `media_vix.vix_reg`,
  (
    SELECT
      day,
      tone_lag1, tone_lag2, vix, vix_lag1, dvix,
      vix_next   -- pass-through so it's available in the output
    FROM `media_vix.model_frame`
    WHERE day >= '2025-01-01'
  )
);
