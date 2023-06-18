use hm1406;
select * from customers;
select * from orders;
select * from products;

-- Вывести название продукта, который чаще всего встречается в заказах:

SELECT 
title, 
COUNT(*) AS order_count
FROM products t1
JOIN orders t2 
ON t1.id = t2.productid
GROUP BY title
ORDER BY order_count DESC
LIMIT 1;

-- Вывести название продукта, который покупают чаще всего (нужно посчитать общее количество купленных единиц):

SELECT 
title, 
SUM(product_count) AS total_count
FROM products t1
JOIN orders t2 
ON t1.id = t2.productid
GROUP BY title
ORDER BY total_count DESC
LIMIT 1;


-- Вывести общую выручку магазина. Сумма всех купленных единиц товара:

SELECT 
SUM(t1.price * t2.product_count) AS total_revenue
FROM products t1
JOIN orders t2 
ON t1.id = t2.productid;

-- Определить сумму выручки онлайн продаж (online) и продаж в магазине (direct):

SELECT 
ordertype, 
SUM(t1.price * t2.product_count) AS revenue_by_type
FROM products t1
JOIN orders t2 
ON t1.id = t2.productid
GROUP BY ordertype;




