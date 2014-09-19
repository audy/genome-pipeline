require 'spec_helper'


describe Genome::Pipeline::ProdigalFilter do

  let(:genome) { Genome::Genome.new(File.open('spec/data/genome.fasta')) }

  let(:filter) { Genome::Pipeline::ProdigalFilter.new(genome) }

  it '.new' do
    expect{filter}.not_to raise_error
  end

  it '.transform' do
    #expect(filter.transform).to be_a(Genome::Genome)
  end

end
