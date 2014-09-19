require 'spec_helper'

describe Genome do

  let (:fasta_handle) { File.open('spec/data/genome.fasta') }
  let (:genome) { Genome::Genome.new(fasta_handle) }

  it '.new' do
    expect(genome).to_not eq(nil)
  end

  it '.fasta' do
    genome.fasta do |path|
      expect(path).to_not eq(nil)
      expect(File.exist?(path)).to eq(true)

      records = File.open(path) do |handle|
        Dna.new(handle, format: :fasta).to_a
      end

      expect(records.size).not_to eq(0)
      expect(`grep -c '^>' #{path}`).to eq(`grep -c '^>' 'spec/data/genome.fasta'`)
    end
  end

end
