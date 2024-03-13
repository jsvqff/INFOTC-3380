//use the $unwind functin on the payments for a customer
db.customers.aggregate([
    {$unwind: "$payments"},
    {$match: {"customerName": "Mini Wheels Co."}}
])

//count the number of payments from Mini Wheels Co.
db.customers.aggregate([
    {$unwind: "$payments"},
    {$match: {"customerName": "Mini Wheels Co."}},
    {$count: "Number of Payments"}
])

//count the total number of all payments made
db.customers.aggregate([
    {$unwind: "$payments"},
    {$count: "Total Number of Payments"}
])

//calculate the dollar value of payments made by Mini Wheels Co. (must use $group first if you want to use $sum)
db.customers.aggregate([
    {$unwind: "$payments"},
    {$match: {"customerName": "Mini Wheels Co."}},
    {$group: {_id: "$customerName", totalPayments: {$sum: "$payments.amount"}}}
])

//calculate the dollar value of payments made by each customer
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id: "$customerName", totalPayments: {$sum: "$payments.amount"}}}
])

//calculate the total dollar value of payments, number of payments, and average payment for each customer
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id: "$customerName", totalPayments: {$sum: "$payments.amount"}, numberOfPayments: {$sum: 1}, averagePayment: {$avg: "$payments.amount"}}}
])

//calculate the total dollar value of payments, number of payments, and average payment for each customer. only include customers who have made 5 or more payments
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id: "$customerName", totalPayments: {$sum: "$payments.amount"}, numberOfPayments: {$sum: 1}, averagePayment: {$avg: "$payments.amount"}}},
    {$match: {numberOfPayments: {$gte: 5}}}
])

//count the number of employees in the USA
db.employees.aggregate([
    {$match: {"office.country": "USA"}},
    {$count: "Number of USA Employees"}
])

//display the customer name, total payment, avg payment, number of payments, and sales rep for customers with payments >= $100,000
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id: "$customerName", totalPayments: {$sum: "$payments.amount"}, numberOfPayments: {$sum: 1}, averagePayment: {$avg: "$payments.amount"}, salesRep: {$addToSet: "$salesRep"}}},
    {$match: {totalPayments: {$gte: 100000}}}
])