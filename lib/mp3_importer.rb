require "pry"

class MP3Importer
  attr_accessor :path, :files
  attr_reader
  attr_writer

  def initialize(file_path)
    @path = file_path
    @files = self.files
  end

  def mp3?(file_name)
    # binding.pry
    file_name.strip[-4, 4] == ".mp3" ? true : false if file_name.length > 4
  end

  def files
    #Dir.entries() returns an array of filename strings
    # binding.pry
    Dir.entries(self.path).map do |file_name|
       file_name.split("/").last if self.mp3?(file_name)
    end.compact
    # binding.pry
  end

  def import
    imported_mp3s = self.files.collect do |f|
      # a = self.mp3?(f)
      a = Song.new_by_filename(f)
      # puts a.inspect
      # binding.pry
    end.compact
    # binding.pry
  end


end
