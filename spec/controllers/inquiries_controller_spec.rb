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
    let(:inquiry) { Factory(:inquiry) }
    let(:question) { Factory(:question, :name => "foo") }

    before(:each) do
      Factory(:question_group, :name => "details", :questions => [question])
    end

    it "shows the inquiry" do
      get :show, :id => inquiry.id
      response.should be_ok
      assigns[:inquiry].should == inquiry
    end

    it "returns not found if the inquiry id is invalid" do
      get :show, :id => question.id
      response.should be_unprocessable_entity
    end

    it "loads responses under details group" do
      get :show, :id => inquiry.id
      response.should be_ok
      resp = assigns[:responses].first
      resp.question.should == question
    end

    it "shows the correct details" do
      inquiry.create_detail
      get :show, :id => inquiry.id
      response.should be_ok
      assigns[:inquiry_detail].should == inquiry.detail
    end

    it "assigns a new detail if none is found" do
      get :show, :id => inquiry.id
      response.should be_ok
      assigns[:inquiry_detail].should_not be_nil
    end
  end

  describe "save user" do
    let(:inquiry) { Factory(:inquiry) }
    let(:user) { Factory(:user, :uid => "foo") }

    it "saves the current user" do
      session[:user_id] = user.id
      get :set_user, :inquiry_id => inquiry.id
      response.should be_ok
      Inquiry.find(inquiry.id).user.uid.should == "foo"
    end

    it "redirects to root_url if the user_id is not set" do
      get :set_user, :inquiry_id => inquiry.id
      response.should redirect_to root_path
    end

    it "returns 422 if the inquiry_id is invalid" do
      session[:user_id] = user.id
      get :set_user, :inquiry_id => user.id
      response.should be_unprocessable_entity
    end
  end
end
