describe Inquiry do
    [:responses].each do |field|
      it { should validate_presence_of(field) }
    end

    it "is valid when built by factory" do
      Factory.build(:inquiry).should be_valid
    end
end
