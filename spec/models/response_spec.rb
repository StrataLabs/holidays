describe Response do
    [:question, :likes, :dislikes, :neutral].each do |field|
      it { should validate_presence_of(field) }
    end

    it "is valid when built by factory" do
      Factory.build(:response).should be_valid
    end
end
