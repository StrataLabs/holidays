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
        Response.build(question)
        Response.count.should == 1
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
end
