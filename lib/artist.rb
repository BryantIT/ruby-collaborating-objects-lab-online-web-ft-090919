class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
     save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.find_or_create_by_name(name)
    self.all.find{|artist| artist.name == name} || Artist.new(name)
  end

  def songs
    Song.all.select{|x| x.artist == self}
  end

  def add_song(song)
       song.artist = self
  end

  def print_songs
      songs.each {|song|
      puts song.name}
  end

end
