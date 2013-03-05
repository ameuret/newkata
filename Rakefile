require 'bundler'
Bundler::GemHelper.install_tasks

  
require 'cucumber'
require 'cucumber/rake/task'

task :default => [:features]
  
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features"
end
