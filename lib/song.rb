class Song
  attr_accessor :name, :artist
  attr_reader
  attr_writer

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    #Expected filename format: 'Michael Jackson - Black or White - pop.mp3'
    data_array = file_name.split(/[-]/)
    fn_hash = {
      artist: data_array[0].strip,
      song: data_array[1].strip
    }
    Song.new(fn_hash[:song]).tap do |s|
      s.artist = Artist.find_or_create_by_name(fn_hash[:artist])
      s.artist.add_song(s)
    end
  end
end
