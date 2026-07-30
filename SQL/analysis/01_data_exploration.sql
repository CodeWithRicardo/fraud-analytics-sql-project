USE FraudData;

-- =====================================================
-- DATA EXPLORATION
-- =====================================================

SELECT * FROM gold.dim_cards;
SELECT * FROM gold.dim_customers;
SELECT * FROM gold.dim_merchant;
SELECT * FROM gold.fact_transactions;


-- =====================================================
-- CARD DIMENSION EXPLORATION
-- =====================================================

-- Total cards: 32,457
SELECT COUNT(*) AS total_cards
FROM gold.dim_cards;


-- Total customers: 32 457
SELECT COUNT(customer_id)  AS total_customers 
FROM gold.dim_cards ;


-- Customers who have at least one card
SELECT COUNT(DISTINCT Customer_ID) AS customers_with_cards
FROM gold.dim_cards;


-- Four card types: Classic, Gold, Platinum, Silver
SELECT DISTINCT Card_Type
FROM gold.dim_cards;



-- Four card networks:
-- American Express, Visa, Mastercard, RuPay
SELECT DISTINCT Card_Network
FROM gold.dim_cards;


-- Minimum and maximum credit limits
SELECT
    MIN(Credit_Limit) AS minimum_credit_limit,
    MAX(Credit_Limit) AS maximum_credit_limit
FROM gold.dim_cards;


-- Card status values:
-- Active, Expired, Blocked, Lost
SELECT DISTINCT Card_Status
FROM gold.dim_cards;


-- Number of cards by status 
SELECT
    Card_Status,
    COUNT(*) AS total_cards
FROM gold.dim_cards
GROUP BY Card_Status
ORDER BY total_cards DESC;


-- Number of contactless and non-contactless cards
SELECT
    Contactless,
    COUNT(*) AS total_cards
FROM gold.dim_cards
GROUP BY Contactless
ORDER BY total_cards DESC;


-- Card modes: Physical and Virtual
SELECT DISTINCT Card_Mode
FROM gold.dim_cards;


-- Number of cards by mode
SELECT
    Card_Mode,
    COUNT(*) AS total_cards
FROM gold.dim_cards
GROUP BY Card_Mode
ORDER BY total_cards DESC;


-- Minimum and maximum card lifespan in years
SELECT
    MIN(DATEDIFF(MONTH, Issue_Date, Expiry_Date)) / 12.0 AS minimum_lifespan_years,
    MAX(DATEDIFF(MONTH, Issue_Date, Expiry_Date)) / 12.0 AS maximum_lifespan_years
FROM gold.dim_cards;





-- =====================================================
-- CUSTOMER DIMENSION EXPLORATION
-- =====================================================

SELECT *
FROM gold.dim_customers;


-- Total customers: 25,000
-- This equals the number of distinct customers in the cards table.
SELECT COUNT(*) AS total_customers
FROM gold.dim_customers;


-- Customers by gender
-- Male: 12,478
-- Female: 12,522
SELECT
    Gender,
    COUNT(*) AS total_customers
FROM gold.dim_customers
GROUP BY Gender
ORDER BY total_customers DESC;


-- Customer age statistics
-- Minimum age: 18
-- Maximum age: 70
-- Average age: approximately 41
SELECT
    MIN(Age) AS minimum_age,
    MAX(Age) AS maximum_age,
    AVG(CAST(Age AS DECIMAL(10,2))) AS average_age
FROM gold.dim_customers;


-- Marital status values:
-- Married, Divorced, Single
SELECT DISTINCT Marital_Status
FROM gold.dim_customers;


-- Customers by marital status
-- Married: 17,671
-- Divorced: 2,539
-- Single: 4,790
SELECT
    Marital_Status,
    COUNT(*) AS total_customers
FROM gold.dim_customers
GROUP BY Marital_Status
ORDER BY total_customers DESC;


-- There are 11 occupations
SELECT DISTINCT Occupation
FROM gold.dim_customers;


-- Customers by occupation
SELECT
    Occupation,
    COUNT(*) AS total_customers
FROM gold.dim_customers
GROUP BY Occupation
ORDER BY total_customers DESC;


-- Annual income statistics
-- Minimum: 2
-- Maximum: 9,999,931
-- Average: 1,611,153.23
SELECT
    MIN(Annual_Income) AS minimum_annual_income,
    MAX(Annual_Income) AS maximum_annual_income,
    CAST(
        AVG(CAST(Annual_Income AS DECIMAL(18,2)))
        AS DECIMAL(18,2)
    ) AS average_annual_income
FROM gold.dim_customers;


-- Customer segment values:
-- Gold, Standard, Platinum, Basic
SELECT DISTINCT Customer_Segment
FROM gold.dim_customers;


-- Customers by segment
-- Platinum: 8,347
-- Gold: 8,069
-- Standard: 6,189
-- Basic: 2,395
SELECT
    Customer_Segment,
    COUNT(*) AS total_customers
FROM gold.dim_customers
GROUP BY Customer_Segment
ORDER BY total_customers DESC;


-- Account type values:
-- Student, Current, Salary, Savings
SELECT DISTINCT Account_Type
FROM gold.dim_customers;


-- Customers by account type
-- Savings: 11,407
-- Salary: 10,503
-- Student: 2,046
-- Current: 1,044
SELECT
    Account_Type,
    COUNT(*) AS total_customers
FROM gold.dim_customers
GROUP BY Account_Type
ORDER BY total_customers DESC;


-- Customer relationship date range
-- First customer date: 2016-07-19
-- Latest customer date: 2026-07-19
SELECT
    MIN(Customer_Since) AS first_customer_date,
    MAX(Customer_Since) AS latest_customer_date
FROM gold.dim_customers;


-- Making sure no future dates
SELECT
    COUNT(*) AS future_dated_customers
FROM gold.dim_customers
WHERE Customer_Since > CAST(GETDATE() AS DATE);






-- =====================================================
-- MERCHANT DIMENSION EXPLORATION
-- =====================================================

SELECT *
FROM gold.dim_merchant;


-- Total merchants: 500
SELECT COUNT(*) AS total_merchants
FROM gold.dim_merchant;


-- Merchant rating statistics
-- Minimum: 3.50
-- Maximum: 5.00
-- Average: 4.29
SELECT
    MIN(Merchant_Rating) AS minimum_rating,
    MAX(Merchant_Rating) AS maximum_rating,
    ROUND(AVG(Merchant_Rating), 2) AS average_rating
FROM gold.dim_merchant;


-- Merchant status values
SELECT DISTINCT Merchant_Status
FROM gold.dim_merchant;


-- Number of merchants by status
SELECT
    Merchant_Status,
    COUNT(*)
FROM gold.dim_merchant
GROUP BY Merchant_Status
ORDER BY COUNT(*) DESC;


-- Merchant registration date range
-- First merchant: 2006-07-22
-- Latest merchant: 2026-07-18
SELECT
    MIN(Merchant_Since) AS first_merchant_date,
    MAX(Merchant_Since) AS latest_merchant_date
FROM gold.dim_merchant;



-- =====================================================
-- TRANSACTION FACT EXPLORATION
-- =====================================================

SELECT *
FROM gold.fact_transaction;


-- Total transactions
SELECT COUNT(*)
FROM gold.fact_transaction;


-- Transaction amount statistics
-- Minimum
-- Maximum
-- Average
-- Total
SELECT
    MIN(Transaction_Amount),
    MAX(Transaction_Amount),
    AVG(Transaction_Amount),
    SUM(Transaction_Amount)
FROM gold.fact_transaction;


-- Transaction date range
SELECT
    MIN(Transaction_Date),
    MAX(Transaction_Date)
FROM gold.fact_transaction;


-- Transaction status values
SELECT DISTINCT Transaction_Status
FROM gold.fact_transaction;

-- Transactions by status
SELECT
    Transaction_Status,
    COUNT(*)
FROM gold.fact_transaction
GROUP BY Transaction_Status
ORDER BY COUNT(*) DESC;


-- Payment methods
SELECT DISTINCT Payment_Method
FROM gold.fact_transaction;

SELECT
    Payment_Method,
    COUNT(*)
FROM gold.fact_transaction
GROUP BY Payment_Method
ORDER BY COUNT(*) DESC;


-- Transaction channels
SELECT DISTINCT Transaction_Channel
FROM gold.fact_transaction;

SELECT
    Transaction_Channel,
    COUNT(*)
FROM gold.fact_transaction
GROUP BY Transaction_Channel
ORDER BY COUNT(*) DESC;


-- Device types
SELECT DISTINCT Device_Type
FROM gold.fact_transaction;

SELECT
    Device_Type,
    COUNT(*)
FROM gold.fact_transaction
GROUP BY Device_Type
ORDER BY COUNT(*) DESC;


-- Domestic vs International
SELECT
    Is_International,
    COUNT(*)
FROM gold.fact_transaction
GROUP BY Is_International
ORDER BY COUNT(*) DESC;


-- Fraud vs Non-Fraud
SELECT
    Fraud_Flag,
    COUNT(*)
FROM gold.fact_transaction
GROUP BY Fraud_Flag
ORDER BY COUNT(*) DESC;


-- Fraud reasons
SELECT DISTINCT Fraud_Reason
FROM gold.fact_transaction;

SELECT
    Fraud_Reason,
    COUNT(*)
FROM gold.fact_transaction
GROUP BY Fraud_Reason
ORDER BY COUNT(*) DESC;


