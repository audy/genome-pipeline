# Genome::Pipeline

Genome processing filters and utilities

Inspired by [HTML::Pipeline](https://github.com/jch/html-pipeline).

```ruby
require 'genome/pipeline'

genome = Genome::Genome.new(File.open('genome.fasta'))

pipeline = Genome::Pipeline.new Filter::PRODIGAL,
                                Filter::tRNAscan

annotated_genome = pipeline[genome]
```

# Installation

With RubyGems:

```bash
$ gem install -P HighSecurity genome-pipeline
```

With Bundler:

```ruby
gem 'genome-pipeline'
```

## Filters

Pipelines are made up of filters. Here is a simple filter that predicts
amino-acid coding sequences using Prodigal

```ruby
class ProdigalFilter < Filter

  def transform

    # run prodigal
    # read GFF and add add features to `genome`
    @result = 
      @genome.fasta do |path|
        stdin, stdout, stderr = Open3.popen3("prodigal -f gff -i #{path}")
        Features.from_gff(stdout.readlines)
      end

    super
  end
end
```

## List of Filters

### Gene Prediction

- Prodigal [XX]

### TODO

feature finding software:

(act on genome sequence)

- Augustus
- tRNAscan
- rnammer (closed source)
- GeneMark (closed source)
- snap (no Bacterial HMM)
- prokka (see `add-prokka` branch)
- barrnap
- ARAGORN
- repeatscout
- repeatmasker
- trf

Filters that act on features:

- Quality Filter (remove features below a confidence threshold)

## Genome Object

Genomes are currently read from FASTA files and stored as objects. My future
plan is to save to an XML similar to NCBI GFF XML format that way the output
from one filter can always be piped directly into the input of another
(basically, the same way as HTML-pipeline works since HTML is just XML).

## License

The MIT License (MIT)

Copyright (c) 2014 Austin G. Davis-Richardson

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
