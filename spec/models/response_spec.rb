describe Response do
  it "is valid when built by factory" do
    Factory.build(:response).should be_valid
  end

  it "is invalid if associated question does not exist" do
    object = Factory(:response)
    response = Factory.build(:response, :question_id => object.id)
    response.should_not be_valid
    response.should have(1).error_on(:question)
  end

  it "is invalid if associated inquiry does not exist" do
    object = Factory(:response)
    response = Factory.build(:response, :inquiry_id => object.id)
    response.should_not be_valid
    response.should have(1).error_on(:inquiry)
  end

  context "responding to a question" do
    let (:question) { Factory(:question, :possible_responses => ["Fun", "Activity"]) }
    let (:inquiry) { Factory(:inquiry) }

    it "stores likes in the response to a question" do
      response = Response.create_or_update_for_inquiry_id(inquiry.id, question.id, :likes => ["Fun"])
      response.save!
      reloaded_inquiry = Inquiry.find(inquiry.id)
      reloaded_inquiry.should have(1).responses
      reloaded_inquiry.response_for_question(question).likes.should == ["Fun"]
    end

    it "stores dislikes in the response to a question" do
      response = Response.create_or_update_for_inquiry_id(inquiry.id, question.id, :dislikes => ["Activity"])
      response.save!
      reloaded_inquiry = Inquiry.find(inquiry.id)
      reloaded_inquiry.should have(1).responses
      reloaded_inquiry.response_for_question(question).dislikes.should == ["Activity"]
    end
  end
end
