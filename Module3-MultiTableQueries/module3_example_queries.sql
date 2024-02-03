--display the agent name, customer name, order number, order amount
select a.AGENT_NAME, c.CUST_NAME, o.ORD_NUM, o.ORD_AMOUNT
from agents a, customer c, orders o
where a.AGENT_CODE = o.AGENT_CODE and o.CUST_CODE = c.CUST_CODE;

--same as above but without aliases
select agents.AGENT_NAME, customer.CUST_NAME, orders.ORD_NUM, orders.ORD_AMOUNT
from agents, customer, orders
where agents.AGENT_CODE = orders.AGENT_CODE and orders.CUST_CODE = customer.CUST_CODE;

--display the agent name, customer name, customer number, order number, order amount for orders placed by customer C00020
select a.AGENT_NAME, c.CUST_NAME, c.CUST_CODE, o.ORD_NUM, o.ORD_AMOUNT
from agents a, customer c, orders o
where a.AGENT_CODE = o.AGENT_CODE and c.CUST_CODE = o.CUST_CODE and c.CUST_CODE = "C00020";

--display the agent name, customer name, customer number, order number, order amount for orders placed by customer C00007
select a.AGENT_NAME, c.CUST_NAME, c.CUST_CODE, o.ORD_NUM, o.ORD_AMOUNT
from agents a, customer c, orders o
where a.AGENT_CODE = o.AGENT_CODE and c.CUST_CODE = o.CUST_CODE and c.CUST_CODE = "C00007";

--display the agent name, customer name, customer number, order number, order amount for orders placed by customer Albert
select a.AGENT_NAME, c.CUST_NAME, c.CUST_CODE, o.ORD_NUM, o.ORD_AMOUNT
from agents a, customer c, orders o
where a.AGENT_CODE = o.AGENT_CODE and c.CUST_CODE = o.CUST_CODE and c.CUST_NAME = "Albert";

--display customer name and all of their agent's information
select c.CUST_NAME, a.*
from customer c, agents a
where c.AGENT_CODE = a.AGENT_CODE;

--display customer name and all the agent information for agent A008
select c.CUST_NAME, a.*
from customer c, agents a
where c.AGENT_CODE = a.AGENT_CODE and a.AGENT_CODE = "A008";