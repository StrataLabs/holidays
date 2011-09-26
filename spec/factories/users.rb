Factory.define :user do |user|
  user.provider :facebook
  user.uid "foo"
  user.name "Foo Bar"
  user.email "foo@bar.com"
end
