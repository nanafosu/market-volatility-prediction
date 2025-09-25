CREATE OR REPLACE MODEL `media_vix.vix_reg`
OPTIONS(model_type='linear_reg', input_label_cols=['vix_next']) AS
SELECT tone_lag1, tone_lag2, vix, vix_lag1, dvix, vix_next
FROM `media_vix.model_frame`
WHERE day < '2025-01-01';
