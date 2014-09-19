require 'spec_helper'

describe Genome::Pipeline::Filter do

  let(:filter) { Genome::Pipeline::Filter }
  let(:genome) { Genome::Genome.new(File.open('spec/data/genome.fasta')) }

  it 'exists' do
    expect(filter).to_not eq(nil)
  end

  it 'can be created from Genome instance' do
    expect(filter.new(genome)).to be_a(Genome::Pipeline::Filter)
  end

end
