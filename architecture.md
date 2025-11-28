
# System Architecture

## Overview

The **Bitcoin Mining Churn Prediction & Monitoring Platform** is designed using a modular and scalable no-code architecture built on top of **n8n**. It orchestrates multiple workflows to manage data operations, prediction cycles, performance monitoring, and reporting. External services like **Google BigQuery** and **Looker Studio** are tightly integrated for data processing and visualization.

---

## Core Components

### 1. **n8n Workflows**

| Workflow Name                     | Purpose                                                                 |
|----------------------------------|-------------------------------------------------------------------------|
| `train_model_workflow.json`      | Automates training of churn prediction models using SQL + BigQuery     |
| `pi_loop_prediction_workflow.json`| Runs inference on production data using trained models                 |
| `mlops_performance_reporter.json`| Generates performance metrics and reports model health                 |
| `monthly_churn_report.json`      | Prepares and publishes monthly churn analysis                          |
| `btc_monitor_workflow.json`      | Monitors mining platform behavior and user signals                     |
| `error_handler_global.json`      | Centralized error handling and alerting pipeline                       |

---

### 2. **SQL Scripts**

These are executed via BigQuery integration within n8n:

| Script Name              | Description                                                  |
|--------------------------|--------------------------------------------------------------|
| `create_model.sql`       | SQL logic to train a churn prediction model                 |
| `evaluate_model.sql`     | Evaluates model accuracy, precision, recall, etc.           |
| `predict_production.sql` | Runs the model on production user data for predictions      |

---

## Workflow Orchestration

```plaintext
+-----------------------+         +------------------------+         +------------------------+
|  BTC Monitor Workflow |  --->   | Train Model Workflow   |  --->   | Prediction Inference   |
+-----------------------+         +------------------------+         +------------------------+
         |                                  |                                     |
         |                                  v                                     v
         |                        +--------------------+               +--------------------------+
         +---------------------> |  Performance Report |  <----------  | Monthly Churn Reporting |
                                 +--------------------+               +--------------------------+
                                           |
                                           v
                                 +--------------------+
                                 | Global Error Handler|
                                 +--------------------+
```

---

## Data Flow

1. **Data Source**: Bitcoin mining platform sends user data into BigQuery.
2. **Model Training**: `train_model_workflow.json` uses `create_model.sql` to generate a model.
3. **Prediction**: `pi_loop_prediction_workflow.json` applies model via `predict_production.sql`.
4. **Evaluation**: Model metrics calculated with `evaluate_model.sql` and visualized in Looker Studio.
5. **Reporting**: Monthly summaries generated for stakeholders.
6. **Monitoring**: BTC activity is monitored for anomaly detection or early churn signals.
7. **Alerts**: Failures or drift events are piped to `error_handler_global.json`.

---

## Integration Points

| System             | Role                                      |
|--------------------|-------------------------------------------|
| **Google BigQuery**| Storage, processing, model training       |
| **Looker Studio**  | Reporting and dashboarding                |
| **n8n (Self-hosted)** | Workflow automation and orchestration |

---

## Security Considerations

- Service Account credentials should be stored securely in n8n’s encrypted credential store.
- Access to BigQuery should be permission-scoped to minimize risks.
- Workflow triggers and webhooks should use authentication or IP restrictions.

---

## Extensibility

- Additional data sources (e.g., Firebase, Stripe) can be connected using n8n nodes.
- Model logic can be extended via custom JavaScript in `Function` nodes.
- Additional monitoring metrics or dashboards can be integrated seamlessly.

---

## Maintenance

- Schedule regular runs of the performance reporter to detect model degradation.
- Review and update Looker dashboards quarterly.
- Monitor for BigQuery job cost and optimize SQL queries where possible.

