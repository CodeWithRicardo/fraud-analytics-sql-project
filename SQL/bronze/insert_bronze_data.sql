
TRUNCATE TABLE silver.cards_data;

INSERT INTO silver.cards_data
(Card_ID, Customer_ID, Card_Type, Card_Network, Credit_Limit, Card_Status, Contactless, Card_Mode, Issue_Date, Expiry_Date)

SELECT Card_ID, Customer_ID, Card_Type, Card_Network, Credit_Limit, Card_Status, Contactless, Card_Mode, Issue_Date, Expiry_Date
FROM FraudData.bronze.cards_data;

TRUNCATE TABLE silver.customers_data;

INSERT INTO silver.customers_data 
( Customer_ID, Customer_Name, Gender, Age, Marital_Status, Occupation,
Annual_Income, Customer_Segment, State, City, Account_Type, Customer_Since)

SELECT Customer_ID, Customer_Name, Gender, Age, Marital_Status, Occupation, Annual_Income, Customer_Segment, State, City, Account_Type, Customer_Since
FROM FraudData.bronze.customers_data;

TRUNCATE TABLE silver.merchant_table;

INSERT INTO silver.merchant_table
( Merchant_ID, Merchant_Name, Merchant_Category, State, City, Merchant_Risk_Level, Merchant_Rating, Merchant_Status, Merchant_Since)

SELECT Merchant_ID, Merchant_Name, Merchant_Category, State, City, Merchant_Risk_Level, Merchant_Rating, Merchant_Status, Merchant_Since
FROM FraudData.bronze.merchant_table;

TRUNCATE TABLE silver.transaction_data;

INSERT INTO silver.transaction_data(Transaction_ID, Customer_ID, Card_ID, Merchant_ID, Transaction_Date, Transaction_Time, Transaction_Amount, Payment_Method, Transaction_Channel, Device_Type, Transaction_Status, Is_International, Fraud_Flag, Fraud_Reason, Merchant_Risk_Level, Merchant_Category, Customer_State, Customer_City, Merchant_State, Merchant_City)
SELECT Transaction_ID, Customer_ID, Card_ID, Merchant_ID, Transaction_Date, Transaction_Time, Transaction_Amount, Payment_Method, Transaction_Channel, Device_Type, Transaction_Status, Is_International, Fraud_Flag, Fraud_Reason, Merchant_Risk_Level, Merchant_Category, Customer_State, Customer_City, Merchant_State, Merchant_City
FROM FraudData.bronze.transaction_data;


SELECT COUNT(*) FROM silver.cards_data;
SELECT COUNT(*) FROM silver.customers_data;
SELECT COUNT(*) FROM silver.merchant_table;
SELECT COUNT(*) FROM silver.transaction_data;