--display all data from the orders table
SELECT * 
From orders;

--select order number, customer number, agent code, and order amount from orders
SELECT ORD_NUM, CUST_CODE, AGENT_CODE, ORD_AMOUNT 
From orders;

--select order number, customer number, agent code, and order amount from orders
--only for agent A002
SELECT ORD_NUM, CUST_CODE, AGENT_CODE, ORD_AMOUNT 
From orders
Where AGENT_CODE = "A002";

--select order number, customer number, agent code, and order amount from orders
--only for agent A002 and the order amount if greater than 2000
SELECT ORD_NUM, CUST_CODE, AGENT_CODE, ORD_AMOUNT
From orders
Where AGENT_CODE = "A002" and ORD_AMOUNT > 2000;

--select order number, customer number, agent code, and order amount from orders
--only for agent A002 and the order amount if greater than 2000
--sort results in ascending order by order amount
SELECT ORD_NUM, CUST_CODE, AGENT_CODE, ORD_AMOUNT
From orders
Where AGENT_CODE = "A002" and ORD_AMOUNT > 2000
order by ORD_AMOUNT asc;

--select order number, customer number, agent code, and order amount from orders
--only for agent A002 and the order amount if greater than 2000
--sort results in descending order by order amount
SELECT ORD_NUM, CUST_CODE, AGENT_CODE, ORD_AMOUNT
From orders
Where AGENT_CODE = "A002" and ORD_AMOUNT > 2000
order by ORD_AMOUNT desc;