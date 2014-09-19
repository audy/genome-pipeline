# -*- encoding: utf-8 -*-
require File.expand_path("../lib/genome/pipeline/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "genome-pipeline"
  gem.version       = Genome::Pipeline::VERSION
  gem.license       = "MIT"
  gem.authors       = ["Austin G. Davis-Richardson"]
  gem.email         = ["harekrishna@gmail.com"]
  gem.description   = %q{Genome processing filters and utilities}
  gem.summary       = %q{Helpers for processing genomes through a chain of annotation filters}
  gem.homepage      = "https://github.com/audy/genome-pipeline"

  gem.files         = `git ls-files`.split $/
  gem.test_files    = gem.files.grep(%r{^test})
  gem.require_paths = ["lib"]


  gem.post_install_message = <<msg
-------------------------------------------------
Thank you for installing genome-pipeline!
-------------------------------------------------
msg
end
