Factory.define :response do |response|
  response.question { Factory(:question) }
  response.inquiry { Factory(:inquiry) }
  response.likes ["yes"]
  response.dislikes ["no"]
  response.neutral ["maybe"]
end
