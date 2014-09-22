module Genome
  class Pipeline

    # dummy filter does nothing
    # used for testing

    class DummyFilter < Filter

      def call
        super
      end

    end

  end
end
