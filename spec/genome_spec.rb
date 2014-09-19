require 'spec_helper'

describe Genome do

  let (:genome) { Genome::Genome.new(File.open('spec/data/genome.fasta')) }

  it '.new' do
    expect(genome).to_not eq(nil)
  end

  it '.fasta' do
    genome.fasta do |path|
      expect(path).to_not eq(nil)
      expect(File.exist?(path)).to eq(true)
    end
  end

end
