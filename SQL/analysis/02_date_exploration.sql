USE FraudData;

-- =====================================================
-- TRANSACTION & DATE EXPLORATION
-- =====================================================

SELECT *
FROM gold.fact_transaction;


-- =====================================================
-- TRANSACTION OVERVIEW
-- =====================================================

-- Total transactions: 250,000
SELECT COUNT(*) AS total_transactions
FROM gold.fact_transaction;


-- Transaction date range
SELECT
    MIN(Transaction_Date) AS first_transaction_date,
    MAX(Transaction_Date) AS latest_transaction_date
FROM gold.fact_transaction;


-- =====================================================
-- TRANSACTIONS OVER TIME
-- =====================================================

-- Number of transactions by year
SELECT
    YEAR(Transaction_Date) AS transaction_year,
    COUNT(*) AS total_transactions
FROM gold.fact_transaction
GROUP BY YEAR(Transaction_Date)
ORDER BY transaction_year;


-- Number of transactions by month
SELECT
    MONTH(Transaction_Date) AS month_number,
    DATENAME(MONTH, Transaction_Date) AS transaction_month,
    COUNT(*) AS total_transactions
FROM gold.fact_transaction
GROUP BY
    MONTH(Transaction_Date),
    DATENAME(MONTH, Transaction_Date)
ORDER BY month_number;


-- Number of transactions by weekday
SELECT
    DATENAME(WEEKDAY, Transaction_Date) AS transaction_weekday,
    COUNT(*) AS total_transactions
FROM gold.fact_transaction
GROUP BY DATENAME(WEEKDAY, Transaction_Date)
ORDER BY COUNT(*) DESC;


-- Number of transactions by hour
SELECT
    DATEPART(HOUR, Transaction_Time) AS transaction_hour,
    COUNT(*) AS total_transactions
FROM gold.fact_transaction
GROUP BY DATEPART(HOUR, Transaction_Time)
ORDER BY transaction_hour;


-- Morning transactions (06:00 - 11:59)
SELECT
    COUNT(*) AS morning_transactions
FROM gold.fact_transaction
WHERE DATEPART(HOUR, Transaction_Time) >= 6
  AND DATEPART(HOUR, Transaction_Time) < 12;


-- Afternoon transactions (12:00 - 17:59)
SELECT
    COUNT(*) AS afternoon_transactions
FROM gold.fact_transaction
WHERE DATEPART(HOUR, Transaction_Time) >= 12
  AND DATEPART(HOUR, Transaction_Time) < 18;


-- Evening transactions (18:00 - 20:59)
SELECT
    COUNT(*) AS evening_transactions
FROM gold.fact_transaction
WHERE DATEPART(HOUR, Transaction_Time) >= 18
  AND DATEPART(HOUR, Transaction_Time) < 21;


-- Night transactions (21:00 - 05:59)
SELECT
    COUNT(*) AS night_transactions
FROM gold.fact_transaction
WHERE DATEPART(HOUR, Transaction_Time) >= 21
   OR DATEPART(HOUR, Transaction_Time) < 6;


-- Average monthly transactions
SELECT
    AVG(CAST(total_transactions AS DECIMAL(18,2))) AS average_monthly_transactions
FROM
(
    SELECT
        YEAR(Transaction_Date) AS transaction_year,
        MONTH(Transaction_Date) AS transaction_month,
        COUNT(*) AS total_transactions
    FROM gold.fact_transaction
    GROUP BY
        YEAR(Transaction_Date),
        MONTH(Transaction_Date)
) AS t;


-- Average yearly transactions
SELECT
    AVG(CAST(total_transactions AS DECIMAL(18,2))) AS average_yearly_transactions
FROM
(
    SELECT
        YEAR(Transaction_Date) AS transaction_year,
        COUNT(*) AS total_transactions
    FROM gold.fact_transaction
    GROUP BY YEAR(Transaction_Date)
) AS t;


-- =====================================================
-- TRANSACTION AMOUNT ANALYSIS
-- =====================================================

-- Transaction amount statistics
SELECT
    MIN(Transaction_Amount) AS minimum_transaction_amount,
    MAX(Transaction_Amount) AS maximum_transaction_amount,
    CAST(AVG(Transaction_Amount) AS DECIMAL(18,2)) AS average_transaction_amount,
    SUM(Transaction_Amount) AS total_transaction_amount
FROM gold.fact_transaction;


-- Total transaction amount by year
SELECT
    YEAR(Transaction_Date) AS transaction_year,
    SUM(Transaction_Amount) AS total_transaction_amount
FROM gold.fact_transaction
GROUP BY YEAR(Transaction_Date)
ORDER BY transaction_year;


-- Total transaction amount by month
SELECT
    MONTH(Transaction_Date) AS month_number,
    DATENAME(MONTH, Transaction_Date) AS transaction_month,
    SUM(Transaction_Amount) AS total_transaction_amount
FROM gold.fact_transaction
GROUP BY
    MONTH(Transaction_Date),
    DATENAME(MONTH, Transaction_Date)
ORDER BY month_number;


-- =====================================================
-- TRANSACTION CATEGORIES
-- =====================================================

-- Transactions by status
SELECT
    Transaction_Status,
    COUNT(*) AS total_transactions
FROM gold.fact_transaction
GROUP BY Transaction_Status
ORDER BY COUNT(*) DESC;


-- Transactions by payment method
SELECT
    Payment_Method,
    COUNT(*) AS total_transactions
FROM gold.fact_transaction
GROUP BY Payment_Method
ORDER BY COUNT(*) DESC;


-- Transactions by channel
SELECT
    Transaction_Channel,
    COUNT(*) AS total_transactions
FROM gold.fact_transaction
GROUP BY Transaction_Channel
ORDER BY COUNT(*) DESC;


-- Transactions by device type
SELECT
    Device_Type,
    COUNT(*) AS total_transactions
FROM gold.fact_transaction
GROUP BY Device_Type
ORDER BY COUNT(*) DESC;


-- Domestic vs International transactions
SELECT
    Is_International,
    COUNT(*) AS total_transactions
FROM gold.fact_transaction
GROUP BY Is_International
ORDER BY COUNT(*) DESC;


-- Fraud vs Non-Fraud transactions
SELECT
    Fraud_Flag,
    COUNT(*) AS total_transactions
FROM gold.fact_transaction
GROUP BY Fraud_Flag
ORDER BY COUNT(*) DESC;


-- Fraud reasons
SELECT
    Fraud_Reason,
    COUNT(*) AS total_transactions
FROM gold.fact_transaction
GROUP BY Fraud_Reason
ORDER BY COUNT(*) DESC;
