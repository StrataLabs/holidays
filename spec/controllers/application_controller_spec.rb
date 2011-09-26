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
end
