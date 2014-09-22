require 'spec_helper'

describe Genome::Pipeline::ProkkaFilter do

  let(:genome) { Genome::Genome.new(File.open('spec/data/genome.fasta')) }

  let(:filter) { Genome::Pipeline::ProkkaFilter.new(genome) }

  it '.new' do
    expect{filter}.not_to raise_error
  end

  it '.call' do
    filtered_genome = filter.call
    p filtered_genome.features
    expect(filtered_genome).to be_a(Genome::Genome)
    expect(filtered_genome.features).not_to eq(nil)
    expect(filtered_genome.features.compact.size).not_to eq(0)
  end

end
