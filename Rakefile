require 'rake/clean'
require 'rake/testtask'

task :default => 'test:all'

namespace :test do
    
    desc 'run all tests'
    Rake::TestTask.new(:"all") do |t|
      t.pattern = 'spec/**/*_spec.rb'
      t.libs.push "lib"
      t.libs.push "spec"
      t.ruby_opts << "-I."
    end
       
    desc 'Mesures test coverage'
    task :coverage do
      rm_f "coverage"
      sh "rcov -Ilib test/*_test.rb"
    end
           
end
