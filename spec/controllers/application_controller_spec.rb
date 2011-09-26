describe ApplicationController do
  context "the current user" do
    let(:user) { Factory(:user) }

    it "is stored in the session" do
      controller.current_user = user
      controller.session[:user_id].should == user.id
    end

    it "is reads the current userid from the session" do
      controller.session[:user_id] = user.id
      controller.current_user.should == user
    end

    it "is nil if noone is logged in" do
      controller.session[:user_id] = nil
      controller.current_user.should be_nil
    end
  end

  context "validate mongoid id" do
    let(:user) { Factory(:user) }
    let(:inquiry) { Factory(:inquiry) }

    it "validates all mongo ids" do
      controller.mongo_ids_valid?(user.id => User, inquiry.id => Inquiry).should be_true
    end

    it "invalidates when mongo id is not found" do
      controller.mongo_ids_valid?(user.id => Inquiry).should be_false
    end

    it "invalidates when mongo id is invalid" do
      controller.mongo_ids_valid?(user.id => Inquiry).should be_false
    end
  end
end
