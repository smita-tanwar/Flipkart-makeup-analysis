

select * from[dbo].[makeup_products]

----- Data validation
SELECT COUNT(*) FROM makeup_products;

SELECT Top 10 * FROM makeup_products 


----Total Products, Brands, Categories
SELECT 
    COUNT(*) AS total_products,
    COUNT(DISTINCT Brand) AS total_brands,
    COUNT(DISTINCT Category) AS total_categories
FROM makeup_products;


----Top 10 Brands by Products
SELECT  top 10 Brand, COUNT(*) AS product_count
FROM makeup_products
GROUP BY Brand
ORDER BY product_count DESC;

----Top 10 Brands by Reviews
SELECT top 10 Brand, SUM(Review_Count) AS total_reviews
FROM makeup_products
GROUP BY Brand
ORDER BY total_reviews DESC;


--- Average Rating by Category
SELECT Category, ROUND(AVG(Rating),2) AS avg_rating
FROM makeup_products
GROUP BY Category
ORDER BY avg_rating DESC;

---- Price Analysis by Category
SELECT 
    Category,
    ROUND(AVG(Original_Price),2) AS avg_original_price,
    ROUND(AVG(Discounted_Price),2) AS avg_discount_price
FROM makeup_products
GROUP BY Category;


---Discount Impact on Rating
SELECT 
    High_Discount,
    ROUND(AVG(Rating),2) AS avg_rating
FROM makeup_products
GROUP BY High_Discount;

----Top 10 Products by Reviews
SELECT Top 10
    Product_Name,
    Brand,
    Review_Count,
    Rating
FROM makeup_products
ORDER BY Review_Count DESC;

---Seller Performance
SELECT 
    Seller_Name,
    COUNT(*) AS total_products,
    SUM(Review_Count) AS total_reviews,
    ROUND(AVG(Rating),2) AS avg_rating
FROM makeup_products
GROUP BY Seller_Name
ORDER BY total_reviews DESC;


----Best Performing Category (Rating + Reviews)
SELECT 
    Category,
    ROUND(AVG(Rating),2) AS avg_rating,
    SUM(Review_Count) AS total_reviews
FROM makeup_products
GROUP BY Category
ORDER BY total_reviews DESC, avg_rating DESC;

----Premium Products (High Price + High Rating)
SELECT 
    Product_Name,
    Brand,
    Original_Price,
    Rating
FROM makeup_products
WHERE Original_Price > 1500
AND Rating >= 4.5
ORDER BY Rating DESC;

----Summery

Lakme and Maybelline dominate product volume.

Lipstick category generates maximum reviews.

High discounts show marginal improvement in engagement.

Premium brands maintain higher ratings.
