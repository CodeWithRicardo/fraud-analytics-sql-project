SELECT * FROM FraudData.bronze.transaction_data;


-- checking if theres dup 

SELECT Transaction_ID, COUNT(*) 
FROM FraudData.bronze.transaction_data
GROUP BY  Transaction_ID
HAVING COUNT(*) > 1;

-- checking if theres nulls or extra len

SELECT * 
FROM FraudData.bronze.transaction_data
WHERE Transaction_ID is Null or lEN(Transaction_ID) > 10 or lEN(Transaction_ID) < 10;

SELECT * 
FROM FraudData.bronze.transaction_data
WHERE Customer_ID is Null or lEN(Customer_ID) > 10 or lEN(Customer_ID) < 10;


SELECT * 
FROM FraudData.bronze.transaction_data
WHERE Card_ID is Null or lEN(Card_ID) > 10 or lEN(Card_ID) < 10;

SELECT * 
FROM FraudData.bronze.transaction_data
WHERE Merchant_ID is Null or lEN(Merchant_ID) > 10 or lEN(Merchant_ID) < 10;


-- checking is all date is logic and no nulls

SELECT MIN(Transaction_Date) FROM FraudData.bronze.transaction_data;
SELECT MAX(Transaction_Date) FROM FraudData.bronze.transaction_data;



SELECT * FROM FraudData.bronze.transaction_data WHERE Transaction_Date > CAST(dwh_create_date AS  DATE)  or Transaction_Date is NULL; 




-- time null or transcation time is 0

SELECT *
FROM FraudData.bronze.transaction_data
WHERE Transaction_Time IS NULL;



SELECT
transaction_time , COUNT(*) 
FROM FraudData.bronze.transaction_data
GROUP BY  Transaction_Time
HAVING Transaction_Time = '00:00:00'
;



-- NULL or negative number
SELECT * FROM FraudData.bronze.transaction_data WHERE Transaction_Amount IS NULL OR Transaction_Amount < 0 ;

-- DISTINCT check confirmed valid categories and no NULLs
-- Trim check confirmed no leading/trailing spaces

SELECT DISTINCT Payment_Method FROM FraudData.bronze.transaction_data;
SELECT  * FROM FraudData.bronze.transaction_data WHERE Payment_Method != TRIM(Payment_Method) ;


SELECT DISTINCT Transaction_Channel FROM FraudData.bronze.transaction_data;
SELECT  * FROM FraudData.bronze.transaction_data WHERE Transaction_Channel != TRIM(Transaction_Channel) ;

SELECT DISTINCT Device_Type FROM FraudData.bronze.transaction_data;
SELECT  * FROM FraudData.bronze.transaction_data WHERE Device_Type != TRIM(Device_Type) ;

SELECT DISTINCT Transaction_Status FROM FraudData.bronze.transaction_data;
SELECT  * FROM FraudData.bronze.transaction_data WHERE Transaction_Status != TRIM(Transaction_Status) ;


-- only 0 and 1 no nulls too

SELECT *
FROM FraudData.bronze.transaction_data
WHERE Fraud_Flag NOT IN (0, 1)
   OR Fraud_Flag IS NULL;


SELECT *
FROM FraudData.bronze.transaction_data
WHERE Is_International NOT IN (0, 1)
   OR Is_International IS NULL;



-- DISTINCT check confirmed valid categories and no NULLs
-- Trim check confirmed no leading/trailing spaces

SELECT DISTINCT Merchant_Category FROM FraudData.bronze.transaction_data;
SELECT  * FROM FraudData.bronze.transaction_data WHERE Merchant_Category != TRIM(Merchant_Category) ;


SELECT DISTINCT Customer_State FROM FraudData.bronze.transaction_data;
SELECT  * FROM FraudData.bronze.transaction_data WHERE Customer_State != TRIM(Customer_State) ;

SELECT DISTINCT  Customer_City FROM FraudData.bronze.transaction_data;
SELECT  * FROM FraudData.bronze.transaction_data WHERE Customer_City  != TRIM(Customer_City) ;

SELECT DISTINCT Merchant_State FROM FraudData.bronze.transaction_data;
SELECT  * FROM FraudData.bronze.transaction_data WHERE Merchant_State != TRIM(Merchant_State) ;

SELECT DISTINCT Merchant_City FROM FraudData.bronze.transaction_data;
SELECT  * FROM FraudData.bronze.transaction_data WHERE Merchant_City != TRIM(Merchant_City) ;