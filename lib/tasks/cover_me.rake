CoverMe.config do |c|
  c.at_exit = Proc.new {}
  c.formatter = CoverMe::EmmaFormatter
end

namespace :cover_me do
  desc "Generates and opens code coverage report."
  task :report do
    require 'cover_me'
    CoverMe.complete!
  end
end
