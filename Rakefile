require "bundler/gem_tasks"
require 'rspec/core/rake_task'

desc 'Default: run unit specs.'
task :default => :spec

desc 'Test the lazy_high_charts plugin.'
RSpec::Core::RakeTask.new('spec') do |t|
    t.pattern = FileList['spec/**/*_spec.rb']
end
