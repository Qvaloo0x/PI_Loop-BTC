# 🧠 BTC Churn Prediction & MLOps Automation (n8n + BigQuery + Looker)

Este proyecto es una solución profesional sin código para predecir y monitorear la pérdida de usuarios (churn) en plataformas de minería de Bitcoin. Utiliza n8n, Google BigQuery y Looker Studio para automatizar análisis, predicciones, reportes y alertas.

## 🔹 ¿Qué hace este proyecto?

- Predice diariamente la probabilidad de abandono de usuarios.
- Entrena modelos de ML en BigQuery (manual o automatizado).
- Evalúa semanalmente el rendimiento del modelo.
- Envía reportes mensuales inteligentes por Slack y Email.
- Visualiza resultados en Looker Studio (enlace simulado).
- Todo 100% automatizado con n8n.

## ⚙️ Tecnologías usadas

- [n8n](https://n8n.io) – Automatización de flujos sin código.
- [Google BigQuery](https://cloud.google.com/bigquery) – Almacenamiento y entrenamiento de modelos ML.
- [Looker Studio](https://lookerstudio.google.com) – Visualización de datos y métricas.
- Slack + Email – Notificaciones automáticas al equipo.

## 📊 Flujos incluidos

| Nombre del Workflow | Frecuencia | Función |
|---------------------|------------|---------|
| `btc_monitor_workflow` | cada 6h | ETL de minería y rentabilidad |
| `pi_loop_prediction_workflow` | diario | Predicción de churn usando ML |
| `mlops_performance_reporter` | semanal | Evalúa el modelo y alerta |
| `train_model_workflow` | manual | Entrena el modelo desde n8n |
| `monthly_churn_report` | mensual | Reporte ejecutivo con métricas clave |

## ✅ Cómo usar

1. Importa los `.json` en tu instancia de n8n.
2. Configura tus credenciales de BigQuery, Slack y Email.
3. Crea las tablas simuladas en BigQuery (`monthly_churn_metrics`).
4. Conecta Looker Studio al dataset de BigQuery (opcional).
5. Disfruta de automatización profesional en minutos.

## 🔐 Requisitos

- Cuenta de Google Cloud con BigQuery habilitado.
- Slack App con acceso a los canales necesarios.
- Email SMTP o cuenta de Gmail para nodos de correo.

## 📁 Estructura

```
├── workflows/
│   ├── btc_monitor_workflow.json
│   ├── pi_loop_prediction_workflow.json
│   ├── mlops_performance_reporter.json
│   ├── train_model_workflow.json
│   └── monthly_churn_report.json
├── sql/
│   ├── create_model.sql
│   ├── evaluate_model.sql
│   └── predict_production.sql
```

## 👨‍💼 Ideal para

- Portafolios de automatización y ciencia de datos.
- Pruebas de concepto para equipos de analítica.
- Ejemplo de solución MLOps sin escribir código.

---

## 📝 License

Este proyecto es de código abierto bajo la licencia MIT. Consulta `LICENSE.md` para más información.