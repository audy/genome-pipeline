require 'spec_helper'

describe Genome::Pipeline::Filter do

  let(:filter) { Genome::Pipeline::Filter.new(genome) }
  let(:genome) { Genome::Genome.new(File.open('spec/data/genome.fasta')) }

  it 'exists' do
    expect(filter).to_not eq(nil)
  end

  it '.transform should return a Genome' do
    expect(filter.transform).to be_a(Genome::Genome)
  end

  it 'can be created from Genome instance' do
    expect(filter).to be_a(Genome::Pipeline::Filter)
  end

end
