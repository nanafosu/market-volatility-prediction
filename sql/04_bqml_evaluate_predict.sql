SELECT * FROM ML.EVALUATE(
  MODEL `media_vix.vix_reg`,
  (SELECT tone_lag1, tone_lag2, vix, vix_lag1, dvix, vix_next
   FROM `media_vix.model_frame`
   WHERE day >= '2025-01-01')
);

CREATE OR REPLACE TABLE `media_vix.predictions` AS
SELECT day, vix_next AS actual_next, predicted_vix_next
FROM ML.PREDICT(
  MODEL `media_vix.vix_reg`,
  (SELECT day, tone_lag1, tone_lag2, vix, vix_lag1, dvix
   FROM `media_vix.model_frame`
   WHERE day >= '2025-01-01')
);
