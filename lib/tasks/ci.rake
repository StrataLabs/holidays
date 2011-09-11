begin
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

  namespace :ci do
    task :jasmine do
      Headless.ly do
        Rake::Task["jasmine:ci"].invoke
      end
    end
  end

  desc "Run this on jenkins"
  task :ci => [:spec]

  # Not sure why this hack works
  task :ci do
    Rake::Task['cover_me:report'].invoke
  end
rescue
  p "Could not load CI Tasks"
end
