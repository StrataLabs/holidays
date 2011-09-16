describe Response do
  [:question].each do |field|
    it { should validate_presence_of(field) }
  end

  it "is valid when built by factory" do
    Factory.build(:response).should be_valid
  end

  context "factory" do
    let(:question) { Factory(:question) }

    it "saves the newly created inquiry" do
      lambda {
        Response.build(question)
      }.should change(Response, :count).by(1)
    end

    it "creates a response given a question" do
      response = Response.build(question)
      response.question.should == question
    end

    it "saves the likes for the response" do
      response = Response.build(question, :likes => ['yes'])
      response.likes.should == ['yes']
    end
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
