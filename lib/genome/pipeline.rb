module Genome

  class Pipeline
    autoload :Genome, 'genome.rb'
    autoload :Filter, 'pipeline/filter.rb'
    autoload :ProdigalFilter, 'pipeline/prodigal_filter.rb'
  end

end
