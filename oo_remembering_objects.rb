class Song
  
  @@all = []
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
    @@all << self #when #new is called, it creates a new instance of the class and then calls #initialize on that new instance, so #initialize is technically an instance method
  end
  # def self.all #to define a class method we use the def self.method_name syntax. The self. before the method name is a reminder that the method will not be running a particular Song instance, but will be acting as the factory from which all Songs are made, the Song class
  #   @@all
  # end

  # def self.print_all_song_names
  #   puts @@all.collect do {|song| song.name}
  # end
  
  def self.print_all_song_names 
    @@all.each do |song|
      puts song.name 
    end 
  end 

end

hotline_bling = Song.new("Hotline Bling")
thriller = Song.new("Thriller")
ninety_nine_problems = Song.new("99 Problems")