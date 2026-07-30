-- Which customer segment generated the highest transaction amount? 



SELECT  Customer_Segment ,SUM(transaction_amount) as transaction_amount
FROM gold.fact_transaction tr
LEFT JOIN  gold.dim_customers cu
on tr.customer_ID = cu.customer_ID
GROUP BY customer_segment
ORDER BY transaction_amount  DESC;

-- Which occupation generated the highest transaction amount?


SELECT  occupation ,SUM(transaction_amount) as transaction_amount
FROM gold.fact_transaction tr
LEFT JOIN  gold.dim_customers cu
on tr.customer_ID = cu.customer_ID
GROUP BY occupation
ORDER BY transaction_amount  DESC;


-- Which age group generated the highest transaction amount?


SELECT  age ,SUM(transaction_amount) as transaction_amount
FROM gold.fact_transaction tr
LEFT JOIN  gold.dim_customers cu
on tr.customer_ID = cu.customer_ID
GROUP BY age
ORDER BY transaction_amount  DESC;



-- Which account type generated the highest transaction amount?


SELECT  account_type  ,SUM(transaction_amount) as transaction_amount
FROM gold.fact_transaction tr
LEFT JOIN  gold.dim_customers cu
on tr.card_ID = cu.card_ID
GROUP BY account_type 
ORDER BY transaction_amount  DESC;

-- Which card type generated the highest transaction amount?

SELECT  Card_Type  ,SUM(transaction_amount) as transaction_amount
FROM gold.fact_transaction tr
LEFT JOIN  gold.dim_cards ca
on tr.card_ID= ca.card_ID
GROUP BY Card_Type 
ORDER BY transaction_amount  DESC;


-- Which card network generated the highest transaction amount?


SELECT  Card_Network  , SUM(transaction_amount) as transaction_amount
FROM gold.fact_transaction tr
LEFT JOIN  gold.dim_cards ca
on tr.card_ID = ca.card_ID
GROUP BY Card_Network
ORDER BY transaction_amount  DESC;

-- Which card status processed the most transactions?

SELECT  Card_status  , COUNT(transaction_amount) as transaction_amount
FROM gold.fact_transaction tr
LEFT JOIN  gold.dim_cards ca
on tr.card_ID= ca.card_ID
GROUP BY card_status
ORDER BY transaction_amount  DESC;

-- Which merchant generated the highest transaction amount?

SELECT TOP 1 merchant_name , SUM(transaction_amount) as transaction_amount
FROM gold.fact_transaction tr
LEFT JOIN  gold.dim_merchant me
on tr.Merchant_ID = me.Merchant_ID
GROUP BY merchant_name
ORDER BY transaction_amount  DESC
;


-- Which merchant rating generated the highest transaction amount?


SELECT TOP 1  merchant_name ,merchant_rating , SUM(transaction_amount) as transaction_amount
FROM gold.fact_transaction tr
LEFT JOIN  gold.dim_merchant me
on tr.Merchant_ID = me.Merchant_ID
GROUP BY merchant_name ,merchant_rating
ORDER BY transaction_amount  DESC
;

-- Which merchant status processed the most transactions?

SELECT   merchant_status , COUNT(transaction_amount) as transaction_amount
FROM gold.fact_transaction tr
LEFT JOIN  gold.dim_merchant me
on tr.Merchant_ID = me.Merchant_ID
GROUP BY  merchant_status
ORDER BY transaction_amount  DESC
;
 
-- Which payment method generated the highest transaction amount?

SELECT   Payment_Method , SUM(transaction_amount) as transaction_amount
FROM gold.fact_transaction 
GROUP BY  Payment_Method
ORDER BY transaction_amount  DESC
;

-- Which transaction channel generated the highest transaction amount?

SELECT   Transaction_Channel , SUM(transaction_amount) as transaction_amount
FROM gold.fact_transaction 
GROUP BY  Transaction_Channel
ORDER BY transaction_amount  DESC
;

-- Which device type generated the highest transaction amount? 

SELECT   device_type , SUM(transaction_amount) as transaction_amount
FROM gold.fact_transaction 
GROUP BY  device_type
ORDER BY transaction_amount  DESC
;
