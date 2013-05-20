class SortWords
  class Binary
    attr_accessor :argv, :outstream, :errstream

    def initialize(argv, outstream, errstream)
      self.argv      = argv
      self.outstream = outstream
      self.errstream = errstream
    end

    def call
      if File.exist? filename
        SortWords.new(words).call.each { |word| outstream.puts word }
        0
      else
        errstream.puts "no such file"
        1
      end
    end

    def filename
      argv.first
    end

    def words
      @words ||= File.read(filename).split("\n")
    end
  end
end
