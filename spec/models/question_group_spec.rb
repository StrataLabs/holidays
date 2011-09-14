describe QuestionGroup do
  context "validations" do
    [:name, :questions].each do |field|
      it { should validate_presence_of(field) }
    end

    it "is valid when built by factory" do
      Factory.build(:question_group).should be_valid
    end
  end
end
