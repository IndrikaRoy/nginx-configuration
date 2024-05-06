require 'rake'
require 'serverspec'
require 'rubygems' 

namespace :spec do
  desc "Run serverspec to all hosts"
  task :all do
    Rake::Task['spec:localhost'].invoke
  end

  desc "Run serverspec to localhost"
  task :localhost do
    RSpec::Core::RakeTask.new(:spec) do |t|
      ENV['TARGET_HOST'] = 'localhost'
      t.pattern = 'spec/*_spec.rb'
    end
    Rake::Task['spec:spec'].invoke
  end
end

task default: 'spec:all'
