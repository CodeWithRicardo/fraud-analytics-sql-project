/*
=============================================================
Create Bronze Layer
=============================================================
Purpose:
    Creates the Bronze schema and its four raw-data tables.

Tables:
    - bronze.customers_data
    - bronze.cards_data
    - bronze.merchants_data
    - bronze.transactions_data
=============================================================
*/

USE FraudData;


-- Create Bronze Schema
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'bronze'
)
BEGIN
    EXEC('CREATE SCHEMA bronze AUTHORIZATION dbo');
END;



-- Cards Table
CREATE TABLE bronze.cards_data (
    Card_ID             VARCHAR(20),
    Customer_ID         VARCHAR(20),
    Card_Type           VARCHAR(20),
    Card_Network        VARCHAR(30),
    Credit_Limit        INT,
    Card_Status         VARCHAR(20),
    Contactless         VARCHAR(3),
    Card_Mode           VARCHAR(20),
    Issue_Date          DATE,
    Expiry_Date         DATE,
    dwh_create_date     DATETIME DEFAULT GETDATE()
);



-- Customers Table
CREATE TABLE bronze.customers_data (
    Customer_ID         VARCHAR(20),
    Customer_Name       VARCHAR(50),
    Gender              VARCHAR(10),
    Age                 INT,
    Marital_Status      VARCHAR(10),
    Occupation          VARCHAR(50),
    Annual_Income       INT,
    Customer_Segment    VARCHAR(20),
    State               VARCHAR(50),
    City                VARCHAR(50),
    Account_Type        VARCHAR(20),
    Customer_Since      DATE,
    dwh_create_date     DATETIME DEFAULT GETDATE()
);



-- Merchants Table
CREATE TABLE bronze.merchants_data (
    Merchant_ID          VARCHAR(20),
    Merchant_Name        VARCHAR(50),
    Merchant_Category    VARCHAR(20),
    State                VARCHAR(30),
    City                 VARCHAR(30),
    Merchant_Risk_Level  VARCHAR(20),
    Merchant_Rating      DECIMAL(2,1),
    Merchant_Status      VARCHAR(20),
    Merchant_Since       DATE,
    dwh_create_date      DATETIME DEFAULT GETDATE()
);



-- Transactions Table
CREATE TABLE bronze.transaction_data (
    Transaction_ID        VARCHAR(20),
    Customer_ID           VARCHAR(20),
    Card_ID               VARCHAR(20),
    Merchant_ID           VARCHAR(20),
    Transaction_Date      DATE,
    Transaction_Time      TIME,
    Transaction_Amount    DECIMAL(10,2),
    Payment_Method        VARCHAR(20),
    Transaction_Channel   VARCHAR(20),
    Device_Type           VARCHAR(20),
    Transaction_Status    VARCHAR(20),
    Is_International      BIT,
    Fraud_Flag            BIT,
    Fraud_Reason          VARCHAR(50),
    Merchant_Risk_Level   VARCHAR(20),
    Merchant_Category     VARCHAR(20),
    Customer_State        VARCHAR(50),
    Customer_City         VARCHAR(50),
    Merchant_State        VARCHAR(50),
    Merchant_City         VARCHAR(50),
    dwh_create_date       DATETIME DEFAULT GETDATE()
);


