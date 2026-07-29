-- table command
FROM FraudData.bronze.cards_data;



SELECT * FROM FraudData.bronze.cards_data;


 -- no duplicate found 

SELECT Card_id , COUNT(*)
FROM FraudData.bronze.cards_data 
GROUP BY Card_id 
HAVING COUNT(*) > 1;

-- no need to trim and theres no NULLS 

SELECT * 
FROM FraudData.bronze.cards_data
WHERE Card_ID is Null or lEN(Card_ID) > 10 or lEN(Card_ID) < 10;

-- its fine to have duplicates cuz its a FK

SELECT Customer_ID , COUNT(*)
FROM FraudData.bronze.cards_data 
GROUP BY Customer_ID 
HAVING COUNT(*) > 1;

-- theres no NULLS 

SELECT * 
FROM FraudData.bronze.cards_data
WHERE Customer_ID is Null 


-- Check that every Customer_ID exists in the customers table

SELECT c.Customer_ID
FROM FraudData.bronze.cards_data AS c
LEFT JOIN FraudData.bronze.customers_data AS cu
    ON c.Customer_ID = cu.Customer_ID
WHERE cu.Customer_ID IS NULL;

-- only 4 types no free space or null but let make sure

SELECT DISTINCT Card_type FROM FraudData.bronze.cards_data;

-- no need to trim and making sure from the card and customer

SELECT * FROM FraudData.bronze.cards_data Where card_type != TRIM(Card_type);
SELECT * FROM FraudData.bronze.cards_data Where Card_id != TRIM(Card_id);
SELECT * FROM FraudData.bronze.cards_data Where Customer_ID  != TRIM(Customer_ID);


-- no space or nulls theres 4 network

SELECT DISTINCT Card_Network FROM FraudData.bronze.cards_data;
SELECT * FROM FraudData.bronze.cards_data Where Card_Network  != TRIM(Card_Network);



-- no nulls or negative numbers

SELECT *
FROM FraudData.bronze.cards_data
WHERE Credit_Limit IS NULL or Credit_Limit < 0 ;




--  STATUS losy active expired or blocked no nulls or free space also no need to trim 

SELECT DISTINCT Card_Status FROM FraudData.bronze.cards_data ;
SELECT * FROM FraudData.bronze.cards_data Where Card_Status  != TRIM(Card_Status);

-- 2 contactless either yes or no  also no need to trim

SELECT DISTINCT Contactless FROM FraudData.bronze.cards_data;
SELECT * FROM FraudData.bronze.cards_data Where Contactless  != TRIM(Contactless);

-- physical or virual no nulls or free space also no need to trim

SELECT DISTINCT Card_Mode FROM FraudData.bronze.cards_data;
SELECT * FROM FraudData.bronze.cards_data Where Card_Mode != TRIM(Card_Mode);



-- veriying if any errors

SELECT MIN(Issue_Date) FROM FraudData.bronze.cards_data;
SELECT MAX(Issue_Date) FROM FraudData.bronze.cards_data;
SELECT MIN(Expiry_Date) FROM FraudData.bronze.cards_data;
SELECT MAX(Expiry_Date) FROM FraudData.bronze.cards_data;


-- checking  if theres any impossible cas

SELECT * FROM FraudData.bronze.cards_data WHERE Issue_Date > Expiry_Date ; 


-- good no wrong dates
-- Check for nulls 
SELECT *
FROM FraudData.bronze.cards_data
WHERE Issue_Date IS NULL
   OR Expiry_Date IS NULL;
