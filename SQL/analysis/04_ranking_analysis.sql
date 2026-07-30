USE FraudData;

SELECT * FROM gold.dim_cards;
SELECT * FROM gold.dim_customers;
SELECT * FROM gold.dim_merchant;
SELECT * FROM gold.fact_transaction;




-- Top 10 customers by total transaction amount


SELECT TOP 10
    cu.Customer_Name,
    SUM(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_customers AS cu
    ON ta.Customer_ID = cu.Customer_ID
GROUP BY cu.Customer_Name
ORDER BY Transaction_amount DESC ;

--Top 10 customers by number of transactions

SELECT TOP 10
    cu.Customer_Name,
    COUNT(*) AS Transaction_Count
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_customers AS cu
    ON ta.Customer_ID = cu.Customer_ID
GROUP BY cu.Customer_Name
ORDER BY Transaction_Count DESC;

-- Bottom 10 customers by total transaction amount

SELECT TOP 10
    cu.Customer_Name,
    SUM(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_customers AS cu
    ON ta.Customer_ID = cu.Customer_ID
GROUP BY cu.Customer_Name
ORDER BY Transaction_amount ASC ;

-- Customers with the highest average transaction amount

SELECT TOP 10
    cu.Customer_Name,
    AVG(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_customers AS cu
    ON ta.Customer_ID = cu.Customer_ID
GROUP BY cu.Customer_Name
ORDER BY Transaction_amount DESC ;




-- Top 10 merchants by transaction amount

SELECT TOP 10
    me.merchant_name,
    SUM(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_merchant AS me
    ON ta.merchant_ID = me.merchant_ID
GROUP BY me.merchant_name
ORDER BY Transaction_amount DESC
;

-- Top 10 merchants by transaction count


SELECT TOP 10
    me.merchant_name,
    COUNT(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_merchant AS me
    ON ta.merchant_ID = me.merchant_ID
GROUP BY me.merchant_name
ORDER BY Transaction_amount DESC
;

--Top 10 merchants by fraud transaction amount

SELECT TOP 10
    me.Merchant_Name,
    SUM(ta.Transaction_Amount) AS Fraud_Amount
FROM gold.fact_transaction ta
JOIN gold.dim_merchant me
    ON ta.Merchant_ID = me.Merchant_ID
WHERE ta.Fraud_Flag = 1
GROUP BY me.Merchant_Name
ORDER BY Fraud_Amount DESC;

--Top 10 merchants by fraud transaction count

SELECT TOP 10
    me.Merchant_Name,
    COUNT(*) AS Fraud_Transaction_Count
FROM gold.fact_transaction ta
JOIN gold.dim_merchant me
    ON ta.Merchant_ID = me.Merchant_ID
WHERE ta.Fraud_Flag = 1
GROUP BY me.Merchant_Name
ORDER BY Fraud_Transaction_Count DESC;


-- Top card types by transaction amount


SELECT 
    ca.card_type,
    SUM(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_cards AS ca
    ON ta.Card_ID = ca.Card_ID
GROUP BY  ca.card_type
ORDER BY Transaction_amount DESC ;

-- Bottom card types by transaction amount


SELECT 
    ca.card_type,
    SUM(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_cards AS ca
    ON ta.Card_ID = ca.Card_ID
GROUP BY  ca.card_type
ORDER BY Transaction_amount ASC ;

--Top card types by transaction count

SELECT 
    ca.card_type,
    COUNT(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_cards AS ca
    ON ta.Card_ID = ca.Card_ID
GROUP BY  ca.card_type
ORDER BY Transaction_amount DESC ;

--Bottom card types by transaction count

SELECT 
    ca.card_type,
    COUNT(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_cards AS ca
    ON ta.Card_ID = ca.Card_ID
GROUP BY  ca.card_type
ORDER BY Transaction_amount ASC;



--Top card networks by transaction amount

SELECT 
    ca.card_network,
    SUM(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_cards AS ca
    ON ta.Card_ID = ca.Card_ID
GROUP BY   ca.card_network
ORDER BY Transaction_amount DESC;

-- Bottom card networks by transaction amount

SELECT 
    ca.card_network,
    SUM(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_cards AS ca
    ON ta.Card_ID = ca.Card_ID
GROUP BY   ca.card_network
ORDER BY Transaction_amount ASC;

--Top card networks by transaction count

SELECT 
    ca.card_network,
    COUNT(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_cards AS ca
    ON ta.Card_ID = ca.Card_ID
GROUP BY   ca.card_network
ORDER BY Transaction_amount DESC;

-- Bottom card networks by transaction count

SELECT 
    ca.card_network,
    COUNT(transaction_amount) AS Transaction_amount
FROM gold.fact_transaction AS ta
LEFT JOIN gold.dim_cards AS ca
    ON ta.Card_ID = ca.Card_ID
GROUP BY   ca.card_network
ORDER BY Transaction_amount DESC;

-- Payment methods ranked by transaction amount

SELECT
    Payment_Method,
    SUM(Transaction_Amount) AS Transaction_Amount
FROM gold.fact_transaction
GROUP BY Payment_Method
ORDER BY Transaction_Amount ASC;




-- Payment methods ranked by transaction count

SELECT
    Payment_Method,
    COUNT(*) AS Transaction_Count
FROM gold.fact_transaction
GROUP BY Payment_Method
ORDER BY Transaction_Count DESC;



-- Transaction channels ranked by transaction amount

SELECT
    Transaction_Channel,
    SUM(Transaction_Amount) AS Transaction_Amount
FROM gold.fact_transaction
GROUP BY Transaction_Channel
ORDER BY Transaction_Amount DESC;



--Transaction channels ranked by transaction count
SELECT
    Transaction_Channel,
    COUNT(*) AS Transaction_Count
FROM gold.fact_transaction
GROUP BY Transaction_Channel
ORDER BY Transaction_Count DESC;





-- Device types ranked by transaction amount
SELECT
    Device_Type,
    SUM(Transaction_Amount) AS Transaction_Amount
FROM gold.fact_transaction
GROUP BY Device_Type
ORDER BY Transaction_Amount DESC;


-- Device types ranked by transaction count

SELECT
    Device_Type,
    COUNT(*) AS Transaction_Count
FROM gold.fact_transaction
GROUP BY Device_Type
ORDER BY Transaction_Count DESC;



-- Top 10 largest transactions

SELECT TOP 10
    Transaction_ID,
    Customer_ID,
    Merchant_ID,
    Transaction_Amount
FROM gold.fact_transaction
ORDER BY Transaction_Amount DESC;


-- Top 10 international transactions

SELECT TOP 10
    Transaction_ID,
    Customer_ID,
    Merchant_ID,
    Transaction_Amount
FROM gold.fact_transaction
WHERE Is_International = 1
ORDER BY Transaction_Amount DESC;




-- Top 10 fraudulent transactions

SELECT TOP 10
    Transaction_ID,
    Customer_ID,
    Merchant_ID,
    Transaction_Amount,
    Fraud_Reason
FROM gold.fact_transaction
WHERE Fraud_Flag = 1
ORDER BY Transaction_Amount DESC;



