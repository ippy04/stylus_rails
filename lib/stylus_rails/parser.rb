module Stylus
  class Parser
    attr_reader :paths

    def initialize(*paths)
      @paths = paths.flatten.select { |path| should_parse?(path) }
    end

    def call
      paths.each do |file|
        `stylus #{file} -o #{css_folder(file)}`
      end
    end

    private
    def css_folder(path)
      File.dirname(File.dirname(path))
    end

    def should_parse?(path)
      File.extname(path) == ".#{Stylus.extension}" && File.file?(path) && File.basename(path) !~ /^_/
    end
  end
end