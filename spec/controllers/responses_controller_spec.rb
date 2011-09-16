describe ResponsesController do
  context "PUT edit" do
    let(:inquiry) { Factory(:inquiry) }
    let(:question) { Factory(:question, :name => "foo") }

    it "responds to a question" do
      put :create_or_update, :inquiry_id => inquiry.id, :question_id => question.id, :preferences => { :likes => ['yes'] }
      response.should be_ok
      Response.first(:conditions => {:question_id => question.id}).likes.should == ["yes"]
    end

    it "returns 422 if inquiry_id is invalid" do
      put :create_or_update, :inquiry_id => question.id, :question_id => question.id, :preferences => { :likes => ['yes'] }
      response.should be_unprocessable_entity
    end
  end
end
