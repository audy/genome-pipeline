require 'tempfile'

module Genome

  class Genome

    attr_accessor :features
    attr_reader :scaffolds

    # Create a new instance of Genome, requires a stream to fasta-formatted
    # text. stores entire genome and features.
    def initialize handle
      @scaffolds = Dna.new(handle, format: :fasta).to_a
      @features = []
    end

    # save self to a temporary file in the fasta format
    # returns path to temporary file
    # file is deleted after block
    def fasta &block
      file = Tempfile.new 'genome'

      File.open(file, 'w') do |handle|
        @scaffolds.each do |record|
          handle.puts record
        end
      end

      yield file.path
      file.close
    end

    def inspect
      "#<#{self.class} #{@scaffolds.size} scaffolds, #{@features.size} features>"
    end

  end
end
