# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Mongoid.master.collections.select { |c| c.name != 'system.indexes' }.each(&:drop)

Question.create(:name => "landing", :text => "Choose your kind of holiday", :possible_responses => ["historic", "museums", "beach", "trekking", "resort", "sightseeing" ])

q1 = Question.create(:name => "going_on", :text => "We are going on a", :allow_custom_responses => true, :possible_responses => [
'Family Vacation','Religious holiday','City Break','Road Trip','Historic Site Visit','Vacation with friends','Honeymoon','Adventure Holiday','Luxury vacation','Weekend getaway','Camping','Team Outing','Discovery Holiday','Beach vacation','Mind & Body recharge','Trek','Spa Retreat'
])

q2 = Question.create(:name => "going_to", :text => "We are going to", :allow_custom_responses => true, :possible_responses => [
'Hill Station','Pilgrim Place','Lakes','Off beat places','Water bodies','Goa','Beaches','Temple towns','Coastal area','National Parks','Madikeri','Forest Cover','Historic Places','International destination','Luxury','Homestay','Rural setting','Exotic locations','North India','Snow filled','Maldives','Desert','Resorts','Mountains','Heritage sites','Health Spas','Islands','Backwaters','Coorg','South India'
])

q3 = Question.create(:name => "gonna_do", :text => "We want to do", :allow_custom_responses => true, :possible_responses => [
'Sightseeing','Hiking','Scuba Diving','Rafting','Hang gliding','Videography','Snorkeling','Wellness treatment','Canoeing','Night life','Cycling','Mountaineering','Window shopping','Boating','Parasailing','Water sports','Lazing','Massages','Jungle Safari','Theatre/art','Ski','Driving','Shopping','Swimming','City Tour','Photography','Game park','Golf','Viewpoints','Rapelling','Motorcycling','Temple Visits','Jet Skiing','Monastery visits','Heritage sites','Reading','Theme park','Desert Safari','Fishing'
])

q4 = Question.create(:name => "going_by", :text => "We intend to travel by", :allow_custom_responses => true, :possible_responses => [
'Sleeper','Rail','1C','Small Car','Cab','SUV','Non A/c','Bus','Volvo','3AC','2AC','Sedan','Sleeper','Road','Cycle','Flight','Self Driven','Chauffer driven','Motorcycle','Low cost','Full range'
])

q5 = Question.create(:name => "bring_back", :text => "We intend to bring back", :allow_custom_responses => true, :possible_responses => [
'Flea market items','Artsy stuff','Electronics','Local Eatables','Traditional Items','Jewellry','Souvenirs','Local ware','Gift Items','Health Products','Local beverages','Handicraft','Handloom','Postcards','Showpiece'
])

q6 = Question.create(:name => "like_to_avoid", :text => "We'd like to avoid", :allow_custom_responses => true, :possible_responses => [
'Bargaining','Humid places','Crowded place','Uncertainty','Hot Place','Wet places','Queues','Road side food','water bodies','Touts/Agents','Asking for directions','Lots of local travel','Cold place','Busy Markets','Impromptu plans','Expensive Acco','Rains','Snow'
])

q7 = Question.create(:name => "cant_do_without", :text => "We can't do without", :allow_custom_responses => true, :possible_responses => [
'Smokes','Air Conditioning','Smart phones','Reading','Comfort','Alcohol','Television','Diet Coke','Photography','Pan/Gutkha','Tea','Mobile Coverage','Luxury','Coffee','Highly detailed plans','Local food'
])

QuestionGroup.create(:name => "details", :questions => [q1, q2, q3, q4, q5, q6, q7])

Question.create(:name => "need", :text => "We need", :possible_responses => [
'Local food','Chinese Meal','Mexican Food','Vegetarian Food','Soft Drinks','Wheelchair accessible','Pizza','Fast food','Sea Food','Non Vegetarian Food','Sugar Free','Milk','Group acco','Continental','Hotel','Swimming Pool','3 Star','Hostel','Budget','Car parking','Television','Pet Friendly','Homestay','Boat House','Games Court','Heritage Property','Economy','Room service','Internet (WiFi)','Bar','Resort','Farmhouse','Restaurant','5 star','Tents/Camps','Bed & Breakfast','Cabin','Tree house','4 star','Luxury','Restaurant','South Indian food','Thai Meal','Bottled water','Tea','Great for families','North indian Food','Jain Meal','Rajasthani Thaali','Sushi','Coffee','Alcohol','Kid Friendly'
])
