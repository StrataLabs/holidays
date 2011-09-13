describe InquiriesController do
  context "POST create" do
    let(:question) { Factory(:question) }
    let(:post_params) { {:question_id => question.id, :likes => ["l1"], :dislikes => ["d1"], :neutral => ["n1"]} }
    it "creates a new inquiry with given answers" do
      lambda {
        post :create, post_params
      }.should change(Inquiry, :count).by(1)
      inquiry = assigns[:inquiry]
      response.should redirect_to(inquiry_path(inquiry))
    end

    it "associates choices with the inquiry" do
      pending do
        post :create, post_params
        response.should be_redirect
        inquiry = assigns[:inquiry]
        inquiry.likes(question).should == ["l1"]
      end
    end
  end

  context "GET show" do
    it "shows the inquiry" do
      pending do
        inquiry = Factory(:inquiry)
        get :show, :id => inquiry.id
        response.should be_ok
        assigns[:inquiry].should == inquiry
      end
    end
  end
end
