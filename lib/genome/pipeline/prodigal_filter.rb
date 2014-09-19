module Genome
  module Pipeline
    class Prodigal < Pipeline
      def initialize options = {}
      end

      def transform genome
        # run prodigal
        # read GFF and add add features to `genome`
        `prodigal -f gff -i data/dorei728.fasta > prodigal.gff`
      end
    end
  end
end
