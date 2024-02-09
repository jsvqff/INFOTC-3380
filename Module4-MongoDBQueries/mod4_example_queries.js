//return all documents in the zips collection
db.zips.find()
db.zips.find({}, {})

//return all documents in the zips collection in a more readable format
db.zips.find().pretty()

//general query format
//db.collection.find({query filter parameters(WHERE)},{display keys(SELECT)})
//display the city names and zip codes and state for zip codes in the state of Missouri
db.zips.find({"state": "MO"}, {"_id": 1, "city": 1, "state": 1})
db.zips.find({"state": "MO"}, {"city": 1, "state": 1})

//display the city names and state but no zip code for zip codes in the state of Missouri
db.zips.find({"state": "MO"}, {"_id": 0, "city": 1, "state": 1})

//how many zip codes are in the state of NY
db.zips.find({"state": "NY"}).count()

//list all the cities and zip codes in MO, KS, IL
db.zips.find({$or:[{"state": "MO", "state": "KS", "state": "IL"}]}, {"_id": 1, "city": 1})

//display zip code, city, state, and population from zips where the population is less than or equal to 500
db.zips.find({"pop": {$lte: 500}}, {"_id": 1, "city": 1, "state": 1, "pop": 1})

//display zip code, city, state, and population from zips where the population is greater than or equal to 100000
db.zips.find({"pop": {$gte: 100000}}, {"_id": 1, "city": 1, "state": 1, "pop": 1})

//display stock name, earnings/share, sector if the price is greater than or equal to 100
db.stocks.find({"Price": {$gte: 100}}, {"Name": 1, "Earnings/Share": 1, "Sector": 1})