class Witcher::Chapters

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.drop_last
    @@all.pop
  end
  


end
