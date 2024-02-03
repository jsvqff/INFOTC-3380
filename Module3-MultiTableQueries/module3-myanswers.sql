--Display the customer name and all of their agent’s information.
select c.CUST_NAME, a.*
from customer c, agents a
where c.AGENT_CODE = a.AGENT_CODE;

--For each order, display order number, order date, customer name and agent name.
select o.ORD_NUM, o.ORD_DATE, c.CUST_NAME, a.AGENT_NAME
from orders o, customer c, agents a
where a.AGENT_CODE = c.AGENT_CODE and o.CUST_CODE = c.CUST_CODE;

--Display agent name, customer name, order date, and order amount for customers from Canada.
select a.AGENT_NAME, c.CUST_NAME, o.ORD_DATE, o.ORD_AMOUNT
from agents a, customer c, orders o
where a.AGENT_CODE = c.AGENT_CODE and o.CUST_CODE = c.CUST_CODE and CUST_COUNTRY = "Canada";

--Display customer name, order number, and order amount for customers in New York city.
select c.CUST_NAME, o.ORD_NUM, o.ORD_AMOUNT
from agents a, customer c, orders o
where o.CUST_CODE = c.CUST_CODE and CUST_CITY = "New York";

--Display agent name, customer name, order number and order amount for orders of more han $1,500.
select a.AGENT_NAME, c.CUST_NAME, o.ORD_NUM, o.ORD_AMOUNT
from agents a, customer c, orders o
where a.AGENT_CODE = c.AGENT_CODE and o.CUST_CODE = c.CUST_CODE and o.ORD_AMOUNT > "1500.00";

--Display all agent and orders information.
select a.*, o.*
from agents a, orders o;

--Display customer name, customer code, outstanding amount, and agent name for customers with outstanding amounts greater than or equal to $6,000.
select c.CUST_NAME, c.CUST_CODE, c.OUTSTANDING_AMT, a.AGENT_NAME
from agents a, customer c
where a.AGENT_CODE = c.AGENT_CODE and c.OUTSTANDING_AMT >= "6,000.00";

--Display customer name, order number, order amount, and advance amount if order amount is greater than or equal to $2,500 or advance amount is less than $300.
select c.CUST_NAME, o.ORD_NUM, o.ORD_AMOUNT, o.ADVANCE_AMOUNT
from customer c, orders o
where o.CUST_CODE = c.CUST_CODE and o.ORD_AMOUNT >= "2,500.00" or o.ADVANCE_AMOUNT < "300.00";

--Display agent name, agent working area, customer name, customer working area for customers and agents who have the same working area.
select a.AGENT_NAME, a.WORKING_AREA, c.CUST_NAME, c.WORKING_AREA
from agents a, customer c
where a.AGENT_CODE = c.AGENT_CODE and a.WORKING_AREA = c.WORKING_AREA;

--Display customer name, agent name, and order number where order amount is less than $1,000 or opening amount is greater than $8000.
select c.CUST_NAME, a.AGENT_NAME, o.ORD_NUM
from agents a, customer c, orders o
where a.AGENT_CODE = c.AGENT_CODE and o.CUST_CODE = c.CUST_CODE and o.ORD_AMOUNT < "1,000.00" or c.OPENING_AMT > "8,000.00";
