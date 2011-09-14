Factory.define :question_group do |group|
  group.name "group"
  group.questions { [Factory(:question)] }
end
