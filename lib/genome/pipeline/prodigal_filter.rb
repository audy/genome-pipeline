require 'tempfile'
require 'open3'

module Genome
  class Pipeline

    class ProdigalFilter < Filter

      attr_reader :result

      def transform

        out_file = Tempfile.new 'prodigal'

        # run prodigal
        # read GFF and add add features to `genome`
        @result = 
          @genome.fasta do |path|
            stdin, stdout, stderr = Open3.popen3("prodigal -f gff -i #{path}")
            Features.from_gff(stdout.readlines)
          end

        out_file.close

        super
      end
    end

  end
end
