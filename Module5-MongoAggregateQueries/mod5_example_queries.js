//list 10 most expensive stocks in stocks collection
//sort by price in descending order (least to greatest)
//show the symbol, company name, and price
db.stocks.aggregate([
    {$sort: {"Price": -1}},
    {$limit: 10},
    {$project: {"Symbol": 1, "Name": 1, "Price": 1, "_id": 0}}
])

//show population of 10 least populous cities in MO
db.zips.find({"state": "MO", "city": "COLUMBIA"}).pretty()

//only look at documents where state = "MO" - $match
//group documents based on the city field and sum the populations - $group
//sort the remaining documents by total population in ascending order - $sort
//limit to the first 10 documents
db.zips.aggregate([
    {$match: {"state": "MO"}},
    {$group: {_id: "$city", TotalPopulation: {$sum: "$pop"}}},
    {$sort: {TotalPopulation: 1}},
    {$limit: 10}
])

//show cities in Missouri with population >= 50,000
db.zips.aggregate([
    {$match: {"state": "MO"}},
    {$group: {_id: "$city", TotalPopulation: {$sum: "$pop"}}},
    {$match: {TotalPopulation: {$gte: 50000}}}
])

//how many zip codes are in the state of FL
db.zips.aggregate([
    {$match: {"state": "FL"}},
    {$count: "Total Zips in Florida"}
])

//or

db.zips.find({"state": "FL"}).count()

//difference between $sum and $count
//display the total population of Columbia, MO
db.zips.aggregate([
    {$match: {"state": "MO", "city": "COLUMBIA"}},
    {$group: {_id: "$city", TotalPopulation: {$sum: "$pop"}}}
])
//display number of zip codes in Columbia, MO (not finished)
db.zips.aggregate([
    {$match: {"state": "MO", "city": "COLUMBIA"}},
    {$group: {_id: "$city", NumberofZipCodes: {$sum: 1}}}
])