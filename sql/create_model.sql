-- PI_Loop BTC: BQML Model Training SQL (Low-Code Solution)

CREATE OR REPLACE MODEL
  `pi_loop.churn_prediction_model` OPTIONS (
    model_type = 'LOGISTIC_REG',
    input_label_cols = ['churn_30_day_label'],
    auto_class_weights = TRUE 
  ) AS
SELECT
  t1.wallet_id,
  t1.days_since_last_login,
  t1.current_hash_power_ghs,
  t1.profit_withdrawal_count,
  t1.churn_30_day_label,
  -- Macroeconomic Feature from BTC Monitor ETL: This is the external feature joining the model.
  t2.mining_profitability_index
FROM
  `pi_loop_data.user_transaction_data` AS t1 
JOIN
  `pi_loop_data.global_mining_features` AS t2 
ON
  -- Join on the most recent feature data to apply the current macro context to all users
  t2.feature_date = (SELECT MAX(feature_date) FROM `pi_loop_data.global_mining_features`)
WHERE
  t1.contract_status = 'active';