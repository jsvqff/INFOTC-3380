//How many products does the vendor "Highway 66 Mini Classics" produce in the database
db.products.find({ "productVendor": "Highway 66 Mini Classics"}).count()

//Calculate the number of orders each customer has placed and display the top 15 in descending order based on orders placed. Display the customer name and the orders placed in a columns called “OrdersPlaced” in descending order by orders placed.
db.orders.aggregate([
    {$group: {_id: "$customerName", OrdersPlaced: {$sum: 1 }}},
    {$sort: {OrdersPlaced: -1}},
    {$limit: 15},
    {$project: {OrdersPlaced: 1}}
])

//List the product names, MSRP, and quantity in stock for products where the MSRP is greater than or equal to 150. Sort in descending order by quantity in stock.
db.products.aggregate([
    {$match: {MSRP: { $gte: 150}}},
    {$project: {productName: 1, MSRP: 1, quantityInStock: 1, _id: 0}},
    {$sort: {quantityInStock: -1}}
])

//Calculate and display the number of customers in each country. Display the country and number of customers in each country in a column called “totalCustomers”. Sort the results by the Number of Customers in each country.
db.customers.aggregate([
    {$group: {_id: "$country", totalCustomers: {$sum: 1}}},
    {$sort: {totalCustomers: -1}},
    {$project: {totalCustomers: 1}}
])  

//Which employees manage the most people? Develop a query to calculate the number of people each employees manages. Display the employee name and number of employees employees they manage in a column called “Number of Reports”.
db.employees.aggregate([
    {$group: {_id: "$reportsTo", NumberOfReports: {$sum: 1}}},
    {$project: {NumberOfReports: 1}},
    {$sort: {NumberOfReports: -1}}
])
  
//List the names and credit limit of the customers with the 8 highest credit limits in France. Display in descending order by credit limit.
db.customers.aggregate([
    {$match: {country: "France"}},
    {$sort: {creditLimit: -1}},
    {$limit: 8},
    {$project: {_id: 0, customerName: 1, creditLimit: 1}}
])

//Write a query to calculate the number of product vebdors in the database. Display the result in a column called “Number of Vendors"
db.products.aggregate([
    {$group: {_id: "$productVendor"}},
    {$group: {_id: null, numberOfVendors: {$sum: 1}}},
    {$project: {_id: 0, "Number of Vendors": "$numberOfVendors"}}
])

//Calculate the dollar value of each product in inventory. You can calculate this by multiplying the quantity in stock by the buy price. Display the product name, quantity in stock, buy price, and in its dollar value in a column called “Dollar Value”. Sort the results in descending order based on dollar value.
db.products.aggregate([
    {$project: {_id: 0, productName: 1, quantityInStock: 1, buyPrice: 1, dollarValue: {$multiply: ["$quantityInStock", "$buyPrice"]}}},
    {$sort: {dollarValue: -1}}
])    