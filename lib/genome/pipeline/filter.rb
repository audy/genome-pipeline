module Genome
  class Pipeline

    class Filter

      class InvalidGenomeException < StandardError; end

      attr_reader :genome
      attr_reader :result

      def initialize genome
        # store a deep copy of genome.
        @genome = Marshal.load(Marshal.dump(genome))
      end

      def call
        @genome.features << @result
        @genome
      end

      def inspect
        "#<#{self.class} #{@result.size} results genome=#{@genome}>"
      end

    end

  end
end
