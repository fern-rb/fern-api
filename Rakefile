require 'bundler/gem_tasks'
require 'rake/testtask'
require 'fern/api/version'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task :build do
  `gem build fern-api.gemspec`
end

task release: :build do
  `gem push pkg/fern-api-#{Fern::Api::VERSION}.gem`
end

task default: :test
