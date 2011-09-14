Factory.define :inquiry do |inquiry|
  inquiry.responses { [Factory(:response)] }
end
