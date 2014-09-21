require 'spec_helper'


describe Genome::Pipeline::ProdigalFilter do

  let(:genome) { Genome::Genome.new(File.open('spec/data/genome.fasta')) }

  let(:filter) { Genome::Pipeline::ProdigalFilter.new(genome) }

  it '.new' do
    expect{filter}.not_to raise_error
  end

  it '.transform' do
    filtered_genome = filter.transform
    expect(filtered_genome).to be_a(Genome::Genome)
    expect(filtered_genome.features).not_to eq(nil)
    expect(filtered_genome.features.size).not_to eq(0)
  end

end
