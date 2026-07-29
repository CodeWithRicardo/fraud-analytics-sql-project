# Fraud Analytics SQL Project

An end-to-end SQL Data Warehouse project for fraud analytics using SQL Server.

The goal of this project is to build a modern data warehouse by loading raw CSV data into a Bronze layer, cleaning and transforming it in the Silver layer, modeling it in the Gold layer, and performing analytical queries to generate business insights.

---

## Project Architecture

```
CSV Files
    │
    ▼
 Bronze
    │
    ▼
 Silver
    │
    ▼
  Gold
    │
    ▼
EDA & SQL Analysis
    │
    ▼
Power BI Dashboard
```

---

## Dataset

This project uses a synthetic financial fraud dataset containing:

- Customers
- Cards
- Merchants
- Transactions

---

## Project Structure

```
fraud-analytics-sql-project/
│
├── README.md
├── LICENSE
│
├── data/
│
├── diagrams/
│   ├── bronze_erd.drawio
│   └── bronze_erd.png
│
├── screenshots/
│   └── bronze_tables.png
│
└── sql/
    ├── bronze/
    │   └── create_bronze.sql
    ├── silver/
    ├── gold/
    └── analysis/
```

---

## Bronze Layer

The Bronze layer stores the raw data exactly as it was received from the source CSV files.

### Tables

- customers_data
- cards_data
- merchants_data
- transactions_data

### Completed

- Created Bronze schema
- Designed four raw data tables
- Imported CSV data into SQL Server
- Created ER Diagram
- Documented the project structure

---

## Technologies Used

- SQL Server 2022
- DBeaver
- Draw.io
- Git & GitHub

---

## Project Status

✅ Bronze Layer Complete

⬜ Silver Layer

⬜ Gold Layer

⬜ SQL Analysis

⬜ Power BI Dashboard
