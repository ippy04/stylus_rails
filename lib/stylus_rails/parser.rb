module Stylus
  class Parser
    attr_reader :paths

    def initialize(*paths)
      @paths = paths.flatten.select { |a| File.extname(a) == ".style" && File.file?(a) }
    end

  end
end