require 'headless'

namespace :ci do
  task :jasmine do
    Headless.ly do
      Rake::Task["jasmine:ci"].invoke
    end
  end
end

desc "Run this on jenkins"
task :ci => [:spec, "ci:jasmine"]
