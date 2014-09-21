require 'bundler/gem_tasks'
require 'rake/testtask'

Bundler.require :development

namespace :docs do
  YARD::Rake::YardocTask.new do |t|
  end

  desc 'serve documentation with live reloading'
  task :serve do
    `bundle exec yard server --reload`
  end
end
