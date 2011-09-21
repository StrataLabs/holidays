describe DetailsController do
  context "POST create" do
    it "saves details about the inquiry" do
      inquiry = Factory(:inquiry)
      post :create, :detail => { :group_type => "Family" }, :inquiry_id => inquiry.id
      response.should be_ok
      Inquiry.find(inquiry.id).detail.group_type.should == "Family"
    end

    it "returns a 422 if inquiry is not found" do
      question = Factory(:question)
      post :create, :detail => { :group_type => "Family" }, :inquiry_id => question.id
      response.should be_unprocessable_entity
    end
  end
end
