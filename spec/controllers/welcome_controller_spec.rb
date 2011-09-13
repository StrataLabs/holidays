describe WelcomeController do
  it "loads the main question for the home page" do
    Factory(:question, :name => "landing", :text => "who are you")
    get :index
    response.should be_success
    assigns[:question].text.should == "who are you"
  end
end
