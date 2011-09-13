describe Inquiry do
  [:responses].each do |field|
    it { should validate_presence_of(field) }
  end

  it "is valid when built by factory" do
    Factory.build(:inquiry).should be_valid
  end

  context "factory" do
    let(:question) { Factory(:question) }

    it "saves the newly created inquiry" do
      lambda {
        Inquiry.build(question.id, :likes => ["yes"])
      }.should change(Inquiry, :count).by(1)
    end

    it "creates a response given a question" do
      inquiry = Inquiry.build(question.id, :likes => ["yes"])
      inquiry.should have(1).responses
    end

    it "returns false if the question_id is an invalid format" do
      Inquiry.build("foobar", :likes => ["yes"]).should be_false
    end

    it "returns false if the question id does not point to a question" do
      inquiry = Factory(:inquiry)
      Inquiry.build(inquiry.id, :likes => ["yes"]).should be_false
    end
  end
end
