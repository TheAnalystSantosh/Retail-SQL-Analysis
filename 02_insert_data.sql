
-- 02_insert_data.sql

-- Insert Customers
INSERT IGNORE INTO Customers (customer_id, customer_name, segment, city, state, postal_code, region)
SELECT DISTINCT `Customer ID`, `Customer Name`, `Segment`, `City`, `State`, `Postal Code`, `Region`
FROM superstore_raw;

-- Insert Products
INSERT IGNORE INTO Products (product_id, product_name, category, sub_category)
SELECT DISTINCT `Product ID`, `Product Name`, `Category`, `Sub-Category`
FROM superstore_raw;

-- Insert Orders
INSERT IGNORE INTO Orders (order_id, order_date, ship_date, ship_mode, customer_id)
SELECT DISTINCT `Order ID`, STR_TO_DATE(`Order Date`, '%m/%d/%Y'), STR_TO_DATE(`Ship Date`, '%m/%d/%Y'), `Ship Mode`, `Customer ID`
FROM superstore_raw;

-- Insert Order_Items
INSERT INTO Order_Items (order_id, product_id, quantity, discount, sales, profit)
SELECT `Order ID`, `Product ID`, `Quantity`, `Discount`, `Sales`, `Profit`
FROM superstore_raw;
