begin
  namespace :ci do
    task :jasmine do
      Headless.ly do
        Rake::Task["jasmine:ci"].invoke
      end
    end

    task :touch_yml_files do
      sh <<-EOF
        for i in config/*.example; do
          cp "$i" config/`basename "$i" .example`
        done
EOF
    end
  end

  desc "Run this on jenkins"
  task :ci => ["ci:touch_yml_files", :spec]
rescue
  p "Could not load CI Tasks"
end
