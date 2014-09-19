module Genome
  class Pipeline

    class Filter

      class InvalidGenomeException < StandardError; end

      attr_reader :genome
      attr_reader :result

      def initialize genome
        @genome = genome
      end

    end

  end
end
