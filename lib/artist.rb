require "pry"

class Artist
  attr_accessor :name
  attr_reader :songs
  attr_writer

  @@all = []
  @@artist_names = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    # # binding.pry
    # match = self.all.select{|a| a.name == name}
    # # binding.pry
    # case match.length
    # when 0
    #   Artist.new(name)
    # when 1
    #   match[0]
    # else
    #   puts "#{match.length} artists found with name #{name}"
    # end

    match = self.all.detect{|a| a.name == name}
    match ? match : Artist.new(name)

  end

  def print_songs
    @songs.each{|s| puts s.name}
  end


end
