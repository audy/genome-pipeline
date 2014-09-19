module Genome

  class Pipeline
    def initialize pipeline
      @pipeline = pipeline
    end

    def run genome
      self.transform(genome)
    end
  end

  private

  def transform genome

    pipeline.each do |step|
      genome = step.run(genome)
    end

    genome

  end

end
