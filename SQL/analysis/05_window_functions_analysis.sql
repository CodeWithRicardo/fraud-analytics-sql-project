USE FraudData;
SELECT * FROM gold.dim_cards;
SELECT * FROM gold.dim_customers;
SELECT * FROM gold.dim_merchant;
SELECT * FROM gold.fact_transaction;

-- 1. Rank customers by total transaction amount


SELECT DENSE_RANK() OVER (ORDER BY Transaction_amount DESC) as customer_rank , Customer_Name as name , Transaction_amount FROM (
SELECT 
    cu.Customer_Name,
    SUM(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_customers AS cu
    ON ta.Customer_ID = cu.Customer_ID
GROUP BY cu.Customer_Name)as t

 -- Compare ROW_NUMBER, RANK, and DENSE_RANK


SELECT 
DENSE_RANK() OVER (ORDER BY Transaction_amount DESC) as customer_rank , 
RANK() OVER (ORDER BY Transaction_amount DESC) as customer_rank , 
ROW_NUMBER() OVER (ORDER BY Transaction_amount DESC) as customer_rank , 

Customer_Name as name , Transaction_amount FROM (
SELECT 
    cu.Customer_Name,
    SUM(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_customers AS cu
    ON ta.Customer_ID = cu.Customer_ID
GROUP BY cu.Customer_Name)as t


-- Rank merchants by fraud amount

SELECT 
DENSE_RANK() OVER (ORDER BY Fraud_Transaction_Total DESC) as customer_rank , Merchant_name , Fraud_Transaction_Total FROM (

SELECT 
    me.Merchant_Name,
    SUM(Transaction_amount) AS Fraud_Transaction_Total
FROM gold.fact_transaction ta
JOIN gold.dim_merchant me
    ON ta.Merchant_ID = me.Merchant_ID
WHERE ta.Fraud_Flag = 1
GROUP BY me.Merchant_Name
) as t

 -- Running total transaction amount by date

SELECT month_number,transaction_month,total_transaction_amount, SUM(total_transaction_Amount) OVER (Order by month_number) 

FROM 
(
SELECT
    MONTH(Transaction_Date) AS month_number,
    DATENAME(MONTH, Transaction_Date) AS transaction_month,
    SUM(Transaction_Amount) AS total_transaction_amount
FROM gold.fact_transaction
GROUP BY
    MONTH(Transaction_Date),
    DATENAME(MONTH, Transaction_Date)

) as t ;


SELECT transaction_year,total_transaction_amount , SUM(total_transaction_Amount) OVER (Order by transaction_year ASC) 

FROM (

SELECT
    YEAR(Transaction_Date) AS transaction_year,
    SUM(Transaction_Amount) AS total_transaction_amount
FROM gold.fact_transaction
GROUP BY YEAR(Transaction_Date)
) as t;

-- Previous month's transaction amount

SELECT
    transaction_year,
    month_number,
    transaction_month,
    total_transaction_amount,
    LAG(total_transaction_amount) OVER (
        ORDER BY transaction_year, month_number
    ) AS previous_month_amount
FROM (
    SELECT
        YEAR(Transaction_Date) AS transaction_year,
        MONTH(Transaction_Date) AS month_number,
        DATENAME(MONTH, Transaction_Date) AS transaction_month,
        SUM(Transaction_Amount) AS total_transaction_amount
    FROM gold.fact_transaction
    GROUP BY
        YEAR(Transaction_Date),
        MONTH(Transaction_Date),
        DATENAME(MONTH, Transaction_Date)
) AS t;


SELECT
    transaction_year,
    month_number,
    transaction_month,
    total_transaction_amount,
    AVG(total_transaction_amount) OVER (
        ORDER BY transaction_year, month_number
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average_3_months
FROM (
    SELECT
        YEAR(Transaction_Date) AS transaction_year,
        MONTH(Transaction_Date) AS month_number,
        DATENAME(MONTH, Transaction_Date) AS transaction_month,
        SUM(Transaction_Amount) AS total_transaction_amount
    FROM gold.fact_transaction
    GROUP BY
        YEAR(Transaction_Date),
        MONTH(Transaction_Date),
        DATENAME(MONTH, Transaction_Date)
) AS t;