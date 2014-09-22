module Genome
  class Pipeline

    # dummy filter does nothing
    # used for testing

    class DummyFilter < Filter

      def transform
        super
      end

    end

  end
end
