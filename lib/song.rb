require "pry"

class Song
  attr_accessor :name, :artist
  attr_reader
  attr_writer

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    #Expected filename format: 'Michael Jackson - Black or White - pop.mp3'
    # data_array = file_name.split(/[-]/) ## There has to be a more elegant way to do this. Maybe with yield or a lambda?
    # fn_hash = {
    #   artist: data_array[0].strip,
    #   song: data_array[1].strip
    # }
    fn_hash = file_name.split(/[-]/).instance_eval do
      {artist: self[0].strip,
        song: self[1].strip}
    end
    # binding.pry
    Song.new(fn_hash[:song]).tap do |s|
      s.artist = Artist.find_or_create_by_name(fn_hash[:artist])
      s.artist.add_song(s)
    end
  end
end
