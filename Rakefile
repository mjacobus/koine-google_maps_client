require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

namespace :spec do
  task :coveralls do
    ENV['COVERALLS'] = 'true'
    Rake::Task['spec:coverage'].invoke
  end

  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['spec'].invoke
  end

  task :scrutinizer do
    ENV['SCRUTINIZER'] = 'true'
    Rake::Task['spec'].invoke
  end
end

task :default => :spec
