describe ResponsesController do
  context "PUT edit" do
    let(:inquiry) { Factory(:inquiry) }
    let(:question) { Factory(:question, :name => "foo") }

    it "responds to a question" do
      pending do
        put :create_or_update, :inquiry_id => inquiry.id, :question_id => question.id, :preferences => { :likes => ['yes'] }
        response.should be_ok
        Response.first(:conditions => {:question_id => question.id}).likes.should == ["yes"]
      end
    end

    it "returns 404 if inquiry_id is invalid" do
      pending do
        put :create_or_update, :inquiry_id => question.id, :question_id => question.id, :preferences => { :likes => ['yes'] }
        response.should be_not_found
      end
    end
  end
end
