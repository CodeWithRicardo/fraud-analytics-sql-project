SELECT * FROM FraudData.bronze.customers_data;


-- no need to trim and theres no NULLS 

SELECT * 
FROM FraudData.bronze.customers_data
WHERE Customer_ID is Null or lEN(Customer_ID) > 10 or lEN(Customer_ID) < 10;


-- NO NULLS 


SELECT * 
FROM FraudData.bronze.customers_data
WHERE Customer_ID is Null 

-- no dup

SELECT Customer_ID, COUNT(*)
FROM FraudData.bronze.customers_data
GROUP BY Customer_ID
HAVING COUNT(*) > 1;



-- Verify that every Customer_ID in cards_data exists in customers_data and customers exist in transaction table





SELECT DISTINCT t.Customer_ID
FROM FraudData.bronze.cards_data   AS t
LEFT JOIN FraudData.bronze.customers_data  AS c
    ON t.Customer_ID = c.Customer_ID
WHERE c.Customer_ID IS NULL;

SELECT DISTINCT tr.Customer_ID
FROM FraudData.bronze.transaction_data AS tr
LEFT JOIN FraudData.bronze.customers_data AS cu
    ON tr.Customer_ID = cu.Customer_ID
WHERE cu.Customer_ID IS NULL;

-- no space or nulls

SELECT * FROM FraudData.bronze.customers_data WHERE Customer_Name != TRIM(Customer_Name) or Customer_Name is NULL ;


-- only male and femaly no spaces or nulls etc

SELECT DISTINCT Gender FROM FraudData.bronze.customers_data;

-- no nulls no random age 

SELECT * FROM FraudData.bronze.customers_data WHERE Age > 120 or Age < 0 OR Age is NUll;


-- only 3 no nulls or errors

SELECT DISTINCT Marital_Status  FROM FraudData.bronze.customers_data;

-- no extra spaces

SELECT * FROM FraudData.bronze.customers_data WHERE Marital_Status != TRIM(Marital_Status) ;

-- no nulls or errors also no spaces

SELECT DISTINCT Occupation  FROM FraudData.bronze.customers_data;
SELECT * FROM FraudData.bronze.customers_data WHERE Occupation  != TRIM(Occupation ) ;

-- no errors or nulls

SELECT * FROM FraudData.bronze.customers_data where Annual_Income < 0 or Annual_Income is NULL ;

-- all good no nulls or extra space or erros

SELECT DISTINCT Customer_Segment  FROM FraudData.bronze.customers_data;
SELECT * FROM FraudData.bronze.customers_data WHERE Customer_Segment  != TRIM(Customer_Segment ) ;

SELECT DISTINCT State  FROM FraudData.bronze.customers_data;
SELECT * FROM FraudData.bronze.customers_data WHERE State  != TRIM(State ) ;

SELECT DISTINCT City FROM FraudData.bronze.customers_data;
SELECT * FROM FraudData.bronze.customers_data WHERE City  != TRIM(City) ;

SELECT DISTINCT Account_Type FROM FraudData.bronze.customers_data;
SELECT * FROM FraudData.bronze.customers_data WHERE Account_Type != TRIM(Account_Type) ;


-- checking earliest and last customer

SELECT MIN(Customer_Since) FROM FraudData.bronze.customers_data;
SELECT MAX(Customer_Since) FROM FraudData.bronze.customers_data;

-- js incase

SELECT * FROM FraudData.bronze.customers_data WHERE Customer_Since > CAST(dwh_create_date AS  DATE)  or customer_since is NULL; 


