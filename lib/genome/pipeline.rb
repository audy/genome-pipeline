require 'bundler'

Bundler.require

module Genome
  autoload :Genome, 'genome/genome.rb'

  class Pipeline
    autoload :Filter, 'genome/pipeline/filter.rb'
    autoload :ProdigalFilter, 'genome/pipeline/prodigal_filter.rb'
  end

end
