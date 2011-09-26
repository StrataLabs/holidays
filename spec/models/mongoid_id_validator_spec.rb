describe MongoidIdValidator do
  let(:validator) { MongoidIdValidator.new }

  it "knows if all ids are valid" do
    user = Factory(:user)
    validator.first_invalid(:user_id => user.id).should be_nil
  end

  it "skips things not ending it _id" do
    validator.first_invalid(:foo => "bar").should be_nil
  end

  it "is invalid if the object is not found" do
    validator.first_invalid(:user_id => "foo").should == :user_id
  end
end
