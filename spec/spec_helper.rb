require 'bundler'

Bundler.require :test

require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'lib',
                  'genome', 'pipeline.rb')
