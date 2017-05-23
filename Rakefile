require 'bundler/gem_tasks'
require 'rake/testtask'
require 'fern/api/version'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task :build do
  system 'gem build fern-api.gemspec'
end

task release: :build do
  system "gem push pkg/fern-api-#{Fern::Api::VERSION}"
end

task default: :test
