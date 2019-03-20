class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, initializing_artist = nil, initializing_genre = nil)
    @name = name
    self.genre = initializing_genre
    self.artist = initializing_artist
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) if @artist != nil
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if @genre != nil && !genre.songs.include?(self)
  end

  def self.create(song_name)
    song = new(song_name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end
end
