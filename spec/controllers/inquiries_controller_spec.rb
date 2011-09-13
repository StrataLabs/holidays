describe InquiriesController do
  context "POST create" do
    it "creates a new inquiry with given answers" do
      question = Factory(:question)
      lambda {
        post :create, :question_id => question.id, :likes => ["l1"], :dislikes => ["d1"], :neutral => ["n1"]
      }.should change(Inquiry, :count).by(1)
      response.should be_redirect
    end
  end
end
