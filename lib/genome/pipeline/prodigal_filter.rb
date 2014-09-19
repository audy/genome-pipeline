module Genome
  class Pipeline

    class ProdigalFilter < Filter

      attr_reader :result

      def transform

        # run prodigal
        # read GFF and add add features to `genome`
        @genome.fasta do |path|
          `prodigal -f gff -i #{path} > prodigal.gff`
        end

        @result = File.readlines('prodigal.gff')

      end
    end

  end
end
