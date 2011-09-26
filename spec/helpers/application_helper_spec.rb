describe ApplicationHelper do
  it "gives the correct path for logging in via twitter" do
    helper.authorize_path(:twitter).should == "/auth/twitter"
  end
end
