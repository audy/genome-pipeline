require 'tempfile'

module Genome
  class Pipeline

    class ProdigalFilter < Filter

      attr_reader :result

      def transform

        out_file = Tempfile.new 'prodigal'

        # run prodigal
        # read GFF and add add features to `genome`
        @genome.fasta do |path|
          `prodigal -f gff -i #{path} > #{out_file.path}`
        end

        @result = Features.from_gff(out_file)

        out_file.close

        super
      end
    end

  end
end
