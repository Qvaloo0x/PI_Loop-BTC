-- PI_Loop BTC: BQML Model Evaluation SQL (Executed by n8n weekly for MLOps reporting)

SELECT
  *
FROM
  ML.EVALUATE(MODEL `pi_loop.churn_prediction_model`,
    (
      -- Re-select the features used for prediction, but use the most recent 30 days of data for validation.
      SELECT
        t1.days_since_last_login,
        t1.current_hash_power_ghs,
        t1.profit_withdrawal_count,
        t1.churn_30_day_label,
        t2.mining_profitability_index
      FROM
        `pi_loop_data.user_transaction_data` AS t1
      JOIN
        `pi_loop_data.global_mining_features` AS t2
      ON
        t2.feature_date = (SELECT MAX(feature_date) FROM `pi_loop_data.global_mining_features`)
      WHERE
        -- Assuming a 'date_added' column exists for proper time-slicing
        _PARTITIONTIME >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 30 DAY)
    )
  )