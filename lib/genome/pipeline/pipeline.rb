module Genome

  class Pipeline

    attr_reader :steps
    attr_reader :states

    def initialize *steps
      @steps = steps
      @states = Array.new
    end

    def run genome
      @steps.each do |step|
        @states << step.new(genome).call
      end
      @states.last
    end


  end

end
