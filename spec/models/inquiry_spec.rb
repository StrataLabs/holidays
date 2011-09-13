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
        inquiry.should have(1).response
      end
    end
end
