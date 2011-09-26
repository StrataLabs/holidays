describe ApplicationHelper do
  it "gives the correct path for logging in via twitter" do
    helper.authorize_path(:twitter, "/foo").should == "/auth/twitter?origin=/foo"
  end
end
