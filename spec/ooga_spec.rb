describe "ooga" do
  class Ooga
    include Mongoid::Document
  end
  
  it "should foo" do
    Ooga.create!(:name => "test")
    Ooga.create!(:name => "test2")
    Ooga.create!(:name => "test3")
    p Ooga.all.map(&:name)
  end
end