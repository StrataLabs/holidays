# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create(:name => "landing", :text => "Choose your kind of holiday", :possible_responses => ["historic", "museums", "beach", "trekking", "resort", "sightseeing" ])
