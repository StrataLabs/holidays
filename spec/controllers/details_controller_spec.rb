describe DetailsController do
  context "POST create" do
    it "saves details about the inquiry" do
      pending "current story" do
        inquiry = Factory(:inquiry)
        post :create_or_update, :details => { :group_type => "Family" }, :inquiry_id => inquiry.id
        Inquiry.find(inquiry.id).details.group_type.should == "Family"
      end
    end
  end
end
