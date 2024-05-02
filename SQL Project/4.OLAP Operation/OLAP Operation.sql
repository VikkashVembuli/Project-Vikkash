CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(50),
    Sale_Date DATE,
    Sales_Amount NUMERIC(10, 2)
);

INSERT INTO sales_sample (Product_Id, Region, Sale_Date, Sales_Amount)
VALUES
    (1, 'East', '2024-01-01', 100),
    (2, 'West', '2024-01-02', 200),
    (3, 'North', '2024-01-03', 300),
    (4, 'South', '2024-01-04', 400),
    (1, 'East', '2024-01-05', 150),
    (2, 'West', '2024-01-06', 250),
    (3, 'North', '2024-01-07', 350),
    (4, 'South', '2024-01-08', 450),
    (1, 'East', '2024-01-09', 120),
    (2, 'West', '2024-01-10', 230);

SELECT Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region, Product_Id;

Select Case When Product_Id Is Null Then 'Total' Else Region End As Region,Sum(Sales_Amount) AS total_sales
From sales_sample GROUP BY ROLLUP (Region, Product_Id) ORDER BY Region;

SELECT Product_Id, Region, Sale_Date, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY CUBE (Product_Id, Region, Sale_Date)
ORDER BY Product_Id, Region, Sale_Date;

SELECT Product_Id, Region, Sale_Date, Sales_Amount
FROM sales_sample
WHERE Product_Id = 1
  AND Region = 'East'
  AND Sale_Date BETWEEN '2024-01-01' AND '2024-01-09'
ORDER BY Sale_Date;


