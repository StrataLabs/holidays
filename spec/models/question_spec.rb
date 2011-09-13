describe Question do
  context "validations" do
    [:name, :text, :possible_responses].each do |field|
      it { should validate_presence_of(field) }
    end

    it "is valid when built by factory" do
      Factory.build(:question).should be_valid
    end
  end
end
