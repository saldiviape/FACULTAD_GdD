select STATE from customer group by state ORDER BY COUNT(*) desc LIMIT 1

CREATE TEMP TABLE ABC_Productos AS 
SELECT i.stock_num, i.manu_code, description,  manu_name, 
SUM(total_price) "u$ por Producto", SUM(quantity) "Unid. por Producto"
--INTO #ABC_Productos
FROM items i JOIN manufact m ON (i.manu_code = m.manu_code)
            JOIN product_types s   ON (i.stock_num = s.stock_num)
WHERE i.manu_code IN (SELECT s2.manu_code 
                        FROM products s2 
                       GROUP BY s2.manu_code HAVING COUNT(stock_num) >= 10) 
GROUP BY i.stock_num, i.manu_code, description,  manu_name

CREATE TEMP TABLE ABC_Productos2 AS 
SELECT i.stock_num, i.manu_code, description,  manu_name, 
       SUM(total_price) "u$ por Producto", SUM(quantity) "Unid. por Producto"
--INTO #ABC_Productos
FROM items i JOIN manufact m ON (i.manu_code = m.manu_code)
            JOIN product_types s   ON (i.stock_num = s.stock_num)
            JOIN (SELECT s2.manu_code FROM products s2 
                  GROUP BY s2.manu_code HAVING COUNT(*) >= 10) s3 
            ON (m.manu_code=s3.manu_code) 
GROUP BY i.stock_num, i.manu_code, description,  manu_name


2b SELECT * from ABC_Productos order by 5 DESC,1,2
   SELECT * from ABC_Productos2 order by 5 DESC,1,2


3
SELECT description, --MONTH(order_date)"Mes" 
        DATE_PART('month',order_date), lname||', '||fname "Apellido y Nombre",  
       COUNT(DISTINCT i.order_num) "Cant OC por mes",SUM(quantity) "Unid Producto por mes", 
       SUM(total_price) "u$ Producto por mes"
FROM orders o JOIN customer c ON (o.customer_num=c.customer_num)
              JOIN items i ON (o.order_num = i.order_num)
              JOIN ABC_Productos ABC ON (i.stock_num = ABC.stock_num AND i.manu_code = ABC.manu_code)
WHERE state = (SELECT state from customer 
               GROUP BY state 
               HAVING count(state) = (SELECT --TOP 1 
                                      COUNT(customer_num)
                                      FROM customer c3 GROUP BY state
                                      ORDER BY 1 DESC
                                      LIMIT 1))
GROUP BY description, --MONTH(order_date)
         DATE_PART('month',order_date), lname, fname
ORDER BY 1,2,3
