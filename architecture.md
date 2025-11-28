# 🧠 Churn Prediction MLOps System Architecture

This diagram shows the overall architecture of the churn prediction system using **n8n**, **BigQuery**, **Slack**, **Email**, and **Looker Studio**.

All workflows are fully automated to run continuously with no additional code required. Ideal for production environments or as a professional portfolio project.

```mermaid
graph TD
  %% ETL Workflow
  A1[Schedule (6h)] --> A2[Fetch Mining Data]
  A2 --> A3[Profitability Calc]
  A3 --> A4[BigQuery Load]

  %% Daily Prediction Workflow
  B1[Schedule (24h)] --> B2[ML.PREDICT()]
  B2 --> B3[Filter >75% Churn]
  B3 --> B4[Slack Alert (Daily)]

  %% Weekly Evaluation Workflow
  C1[Schedule (weekly)] --> C2[ML.EVALUATE()]
  C2 --> C3[Slack Alert (Eval)]

  %% Manual Training Workflow
  D1[Manual Trigger] --> D2[Train Model]
  D2 --> D3[Slack Train Notify]

  %% Monthly Report Workflow
  E1[Schedule (monthly)] --> E2[Get Churn Metrics]
  E2 --> E3[Markdown Report]
  E3 --> E4[Slack + Email Report]
  E2 --> F1[Looker Studio (Dashboard)]

  style F1 fill:#fcebb5,stroke:#d6ad29,stroke-width:2px
  style A1,A2,A3,A4 fill:#aed6f1,stroke:#3498db
  style B1,B2,B3,B4 fill:#d5f5e3,stroke:#27ae60
  style C1,C2,C3 fill:#fdebd0,stroke:#e67e22
  style D1,D2,D3 fill:#e8daef,stroke:#8e44ad
  style E1,E2,E3,E4 fill:#f9e79f,stroke:#b7950b
```

> You can visualize this diagram directly in GitHub or any Mermaid-compatible viewer.