module Genome

  class Feature

    def initialize properties = {}
      @scaffold = properties[:scaffold]
      @source   = properties[:source]
      @type     = properties[:type]
      @start    = Integer properties[:start] rescue nil
      @stop     = Integer properties[:stop] rescue nil
      @score    = Float properties[:score] rescue nil
      @strand   = properties[:strand]
      @frame    = Integer properties[:frame] rescue nil
      @info     = properties[:info]
    end

    def self.from_gff_line(line)
      fields = line.strip.split

      scaffold_name = fields[0]
      source        = fields[1]
      type          = fields[2]
      start         = Integer fields[3] rescue nil
      stop          = Integer fields[4] rescue nil
      score         = Float fields[5] rescue nil
      strand        = fields[6]
      frame         = Integer fields[7] rescue nil
      info          = fields[8]

      dat = { scaffold_name: scaffold_name,
        start: start,
        source: source,
        stop: stop,
        strand: strand,
        score: score,
        type: type,
        info: info }

      self.new(dat)
    end

  end

  class Features
    def self.from_gff handle
      handle.map do |line|
        Feature.from_gff_line(line)
      end
    end
  end

end
