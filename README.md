
# Bitcoin Mining Churn Prediction & Monitoring Platform

## Overview

This repository provides a **professional no-code solution** to **predict and monitor user churn** on Bitcoin mining platforms. Leveraging the power of [n8n](https://n8n.io), Google BigQuery, and Looker Studio, the system automates:

- Data ingestion and transformation
- Predictive churn modeling
- Performance tracking
- Reporting and alerting workflows

This platform is designed for scalability and ease of deployment using **n8n (self-hosted)**, providing a fully automated, end-to-end MLOps lifecycle.

---

## Features

- 🧠 **Predictive Modeling**: Automates training, evaluation, and deployment of churn models.
- 📈 **Performance Monitoring**: Automatically generates and distributes performance metrics.
- 📊 **Reporting**: Generates churn reports and visualizes them using Looker Studio.
- 🔔 **Alerting**: Sends notifications for anomalies or performance degradation.
- 🧩 **Modular Workflows**: Designed as reusable n8n workflows with SQL-based data operations.

---

## Tech Stack

- [n8n (Self-hosted)](https://docs.n8n.io/)
- Google BigQuery
- Looker Studio
- SQL for model evaluation and prediction
- JavaScript for advanced data processing in n8n

---

## Repository Structure

```
.
├── workflows/                  # n8n JSON workflows
│   ├── btc_monitor_workflow.json
│   ├── error_handler_global.json
│   ├── mlops_performance_reporter.json
│   ├── monthly_churn_report.json
│   ├── pi_loop_prediction_workflow.json
│   └── train_model_workflow.json
├── sql/                        # SQL scripts for BigQuery operations
│   ├── create_model.sql
│   ├── evaluate_model.sql
│   └── predict_production.sql
├── LICENSE.md
└── .gitignore
```

---

## Setup Instructions

### 1. Prerequisites

- A running instance of **n8n (self-hosted)**
- Google Cloud Project with:
  - BigQuery dataset & tables
  - Service Account credentials (JSON)
- Looker Studio account for dashboarding

---

### 2. Import Workflows into n8n

1. Open your n8n instance.
2. Navigate to **Workflows → Import from File**.
3. Import each `.json` file from the `workflows/` directory.

---

### 3. Configure Credentials

In n8n:

- Create new credentials for:
  - **Google Cloud** (Service Account with BigQuery access)
  - **Looker Studio** (Webhooks or connected apps if needed)
- Assign credentials to the appropriate nodes in each workflow.

---

### 4. Setup Environment Variables (Optional)

Use `n8n` environment variables or `Set` nodes to define:

- Project ID
- Dataset & Table names
- Report thresholds or alert criteria

---

### 5. Run and Monitor

- Start workflows manually or trigger via schedules (Cron node).
- Monitor execution results directly in n8n.
- Review Looker Studio dashboards for churn and performance insights.

---

## License

This project is licensed under the MIT License. See [LICENSE.md](./LICENSE.md) for details.
