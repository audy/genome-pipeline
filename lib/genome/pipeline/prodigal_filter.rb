require 'open3'

module Genome
  class Pipeline

    class ProdigalFilter < Filter

      def call
        @result = run_prodigal
        super
      end

      def run_prodigal
        @genome.fasta do |path|
          stdin, stdout, stderr = Open3.popen3("prodigal -f gff -i #{path}")
          Features.from_gff(stdout.readlines)
        end
      end

    end

  end
end
