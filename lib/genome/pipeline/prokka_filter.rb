require 'open3'

module Genome
  class Pipeline

    class ProkkaFilter < Filter

      def call
        @result = run_prokka
        super
      end

      def run_prokka
        @genome.fasta do |path|
          Dir.mktmpdir do |dir|
            stdin, stdout, stderr = Open3.popen3("prokka --force --outdir #{dir} #{path}")
            stderr.readlines
            stdout.readlines
            File.open(Dir[File.join(dir, '*.gff')].first) do |handle|
              Features.from_gff(handle)
            end
          end
        end
      end

    end

  end
end
