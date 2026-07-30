
SELECT * FROM FraudData.bronze.merchant_table;





 -- no duplicate found 

SELECT Merchant_ID , COUNT(*)
FROM FraudData.bronze.merchant_table
GROUP BY Merchant_ID
HAVING COUNT(*) > 1;

--no nulls or extra len

SELECT * 
FROM FraudData.bronze.merchant_table
WHERE Merchant_ID is Null or lEN(Merchant_ID) > 10 or lEN(Merchant_ID) < 10;



-- all the trans merchant exist in the merchant table

SELECT  DISTINCT tr.Merchant_ID
FROM FraudData.bronze.transaction_data AS tr
LEFT JOIN FraudData.bronze.merchant_table AS me
    ON me.Merchant_ID = tr.Merchant_ID
WHERE me.Merchant_ID IS NULL;




-- no space or nulls

SELECT * FROM FraudData.bronze.merchant_table WHERE Merchant_Name != TRIM(Merchant_Name) or Merchant_Name is NULL ;
SELECT * FROM FraudData.bronze.merchant_table WHERE Merchant_Category != TRIM(Merchant_Category) or Merchant_Category is NULL ;
SELECT * FROM FraudData.bronze.merchant_table WHERE State != TRIM(State) or State is NULL ;
SELECT * FROM FraudData.bronze.merchant_table WHERE City != TRIM(City) or City is NULL ;

SELECT DISTINCT Merchant_Risk_Level FROM FraudData.bronze.merchant_table;
SELECT * FROM FraudData.bronze.merchant_table WHERE Merchant_Risk_Level != TRIM(Merchant_Risk_Level) or Merchant_Risk_Level is NULL ;



-- no wrong rating data

SELECT * FROM FraudData.bronze.merchant_table WHERE  Merchant_Rating > 5 OR Merchant_Rating < 0 OR Merchant_Rating IS NULL;

-- no nulls or space 

SELECT DISTINCT Merchant_Status FROM FraudData.bronze.merchant_table;
SELECT * FROM FraudData.bronze.merchant_table WHERE Merchant_Status!= TRIM(Merchant_Status) or Merchant_Status is NULL ;


-- no wrong infos 

SELECT MIN(Merchant_Since) FROM FraudData.bronze.merchant_table;
SELECT MAX(Merchant_Since) FROM FraudData.bronze.merchant_table;


-- js incase
SELECT * FROM FraudData.bronze.merchant_table WHERE Merchant_Since > CAST(dwh_create_date AS  DATE)  or Merchant_Since is NULL; 



