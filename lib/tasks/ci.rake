require 'rspec'

namespace :ci do
  RSpec::Core::RakeTask.new(:spec) do |t|
  end

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
