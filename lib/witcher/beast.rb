class Witcher::Beast

  attr_accessor :name, :occurence, :weakness, :loot, :link

  @@all =[]

  def initialize(name, link)
    @name = name
    @link = link
    @occurence = occurence
    @weakness = weakness
    @loot = loot

    @@all << self

  end
  
  def self.all
    @@all
  end 
  
end 