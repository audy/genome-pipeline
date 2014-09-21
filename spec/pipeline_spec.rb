require 'spec_helper'

describe Genome::Pipeline do

  let(:genome) { Genome::Genome.new File.open('spec/data/genome.fasta') }
  let(:pipeline) { Genome::Pipeline.new(Genome::Pipeline::DummyFilter) }

  let(:test_filter) do
    class TestFilter < Genome::Pipeline::Filter
      def transform
        @genome.features << 'a dummy feature'
      end
    end
    return TestFilter
  end

  it 'exists' do
    expect(Genome::Pipeline).to_not eq(nil)
  end

  it 'can perform transformations on a Genome' do
    expect { pipeline.run(genome) }.not_to raise_error
    expect(pipeline.run(genome)).to be_a(Genome::Genome)
  end

  # this belongs in filter_spec
  it '.run should copy the original genome' do
    expect(pipeline.run(genome).object_id).not_to eq(genome.object_id)
  end

  # this belongs in filter_spec
  it '.run should not alter original features' do
    test_filter.new(genome).transform
    expect(genome.features.size).to eq(0)
  end

end
