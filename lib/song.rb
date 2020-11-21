class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = Song.new
    song.save
    song
  end 
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end 
  
  def self.find_by_name(name)
    self.all.detect{ |song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    #What I did worked but learn isnt validating. It is saying I'm not using .find_by_name
    #Learns answer is nicer looking either way
    #
    #if Song.all.collect{ |song| song.name == name}.include?(true)
      #Song.find_by_name(name)
    #else 
      #self.create_by_name(name)
    #end 
  end 
  
  def self.alphabetical
    self.all.collect{ |song| song.name}.sort.collect{ |name| Song.find_by_name(name)}
  end 
  
  def self.new_from_filename(file)
    song = Song.new
    name = file.split(/[.-]/)[1].strip
    song.name = name
    artist_name = file.split(/[.-]/)[0].strip
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(file)
    song = Song.new
    name = file.split(/[.-]/)[1].strip
    song.name = name
    artist_name = file.split(/[.-]/)[0].strip
    song.artist_name = artist_name
    @@all << song
    song
  end
  
  def self.destroy_all
    @@all = []
  end

end
