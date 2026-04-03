-- Amazon Sales Data Analysis

-- 1. Total Revenue
SELECT 
SUM(CAST(NULLIF(TRIM(Amount), '') AS DECIMAL(10,2))) AS total_revenue
FROM amazon_sales;

-- 2. Top 5 Categories by Revenue
SELECT 
Category,
SUM(CAST(NULLIF(TRIM(Amount), '') AS DECIMAL(10,2))) AS revenue
FROM amazon_sales
GROUP BY Category
ORDER BY revenue DESC
LIMIT 5;

-- 3. Order Status Breakdown
SELECT 
Status,
COUNT(*) AS total_orders
FROM amazon_sales
GROUP BY Status;

-- 4. Top Cities by Revenue
SELECT 
`ship-city`,
SUM(CAST(NULLIF(TRIM(Amount), '') AS DECIMAL(10,2))) AS revenue
FROM amazon_sales
GROUP BY `ship-city`
ORDER BY revenue DESC
LIMIT 5;

-- 5. Most Sold Products
SELECT 
Style,
SUM(CAST(NULLIF(Qty, '') AS SIGNED)) AS total_sold
FROM amazon_sales
GROUP BY Style
ORDER BY total_sold DESC
LIMIT 5;