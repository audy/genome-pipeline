module Genome

  class Pipeline

    attr_reader :steps

    def initialize *steps
      @steps = steps
    end

    def run genome
      @steps.each do |step|
        genome = step.new(genome).call
      end
      return genome
    end


  end

end
