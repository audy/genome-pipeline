module Genome
  module Pipeline

    class Filter

      def initialize options = {}
        self.options = options
      end

      def transform genome
        # this method gets overrided by actual pipelines
      end

    end

  end
end
