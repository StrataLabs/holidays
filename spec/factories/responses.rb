Factory.define :response do |response|
  response.question { Factory(:question) }
  response.likes ["yes"]
  response.dislikes ["no"]
  response.neutral ["maybe"]
end
