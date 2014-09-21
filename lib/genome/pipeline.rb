require 'bundler'

Bundler.require

module Genome

  require 'genome/genome.rb'
  require 'genome/pipeline/pipeline.rb'

  class Pipeline
    autoload :Filter, 'genome/pipeline/filter.rb'
    autoload :DummyFilter, 'genome/pipeline/dummy_filter.rb'
    autoload :ProdigalFilter, 'genome/pipeline/prodigal_filter.rb'
  end

end
