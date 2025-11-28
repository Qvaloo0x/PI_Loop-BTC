-- PI_Loop BTC: BQML Production Prediction SQL (Executed by n8n daily)

SELECT
  t1.wallet_id,
  t1.current_hash_power_ghs,
  predictions.predicted_churn_30_day_label,
  predictions.probability_of_churn
FROM
  `pi_loop_data.user_transaction_data` AS t1
JOIN
  `pi_loop_data.global_mining_features` AS t2
ON
  t2.feature_date = (SELECT MAX(feature_date) FROM `pi_loop_data.global_mining_features`)
LEFT JOIN
  ML.PREDICT(MODEL `pi_loop.churn_prediction_model`, (
    -- The prediction input features must exactly match the features used for training:
    SELECT
      t1.days_since_last_login,
      t1.current_hash_power_ghs,
      t1.profit_withdrawal_count,
      t2.mining_profitability_index
    FROM
      `pi_loop_data.user_transaction_data` AS t1
    WHERE
      t1.contract_status = 'active'
  )) AS predictions
ON
  t1.wallet_id = predictions.wallet_id
WHERE
  predictions.predicted_churn_30_day_label = 1
  AND predictions.probability_of_churn > 0.75; -- Only alert for high-confidence churn predictions