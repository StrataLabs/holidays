# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :question do |question|
  question.text "Some Question?"
  question.name "name"
  question.possible_responses ["yes", "no"]
end
