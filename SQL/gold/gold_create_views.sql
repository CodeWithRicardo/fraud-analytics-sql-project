USE FraudData;

-- ============================================
-- GOLD LAYER
-- ============================================

CREATE VIEW gold.fact_transactions AS
SELECT
    Transaction_ID,
    Customer_ID,
    Card_ID,
    Merchant_ID,
    Transaction_Date,
    Transaction_Time,
    Transaction_Amount,
    Payment_Method,
    Transaction_Channel,
    Device_Type,
    Transaction_Status,
    Is_International,
    Fraud_Flag,
    Fraud_Reason
FROM silver.transaction_data;

CREATE VIEW gold.dim_cards AS
SELECT
    Card_ID,
    Customer_ID,
    Card_Type,
    Card_Network,
    Credit_Limit,
    Card_Status,
    Contactless,
    Card_Mode,
    Issue_Date,
    Expiry_Date
FROM silver.cards_data;

CREATE VIEW gold.dim_customers AS
SELECT
    Customer_ID,
    Customer_Name,
    Gender,
    Age,
    Marital_Status,
    Occupation,
    Annual_Income,
    Customer_Segment,
    Account_Type,
    Customer_Since
FROM silver.customers_data;

CREATE VIEW gold.dim_merchant AS
SELECT
    Merchant_ID,
    Merchant_Name,
    Merchant_Rating,
    Merchant_Status,
    Merchant_Since
FROM silver.merchant_table;

-- ============================================
-- VALIDATION
-- ============================================

SELECT *
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'gold';

SELECT TOP (10) * FROM gold.fact_transactions;
SELECT TOP (10) * FROM gold.dim_cards;
SELECT TOP (10) * FROM gold.dim_customers;
SELECT TOP (10) * FROM gold.dim_merchant;
