describe InquiriesController do
  context "POST create" do
    let(:question) { Factory(:question) }
    let(:post_params) {{
      :question_id => question.id,
      :preferences => {:likes => ["l1"], :dislikes => ["d1"], :neutral => ["n1"]}
    }}

    it "creates a new inquiry with given answers" do
      lambda {
        post :create, post_params
      }.should change(Inquiry, :count).by(1)
      inquiry = assigns[:inquiry]
      response.should redirect_to(inquiry_path(inquiry))
    end

    it "stores responses" do
      post :create, post_params
      inquiry = assigns[:inquiry]
      inquiry.responses.first.likes.should == ["l1"]
    end

    it "response with 422 if the question id is missing" do
      post :create, { :question_id => nil }
      response.should be_unprocessable_entity
    end
  end

  context "GET show" do
    it "shows the inquiry" do
      inquiry = Factory(:inquiry)
      get :show, :id => inquiry.id
      response.should be_ok
      assigns[:inquiry].should == inquiry
    end
  end
end
