class Witcher::Beast

  attr_accessor :name, :occurence, :weakness, :loot, :link

  @@all =[]

  def initialize(name, link, occurence, weakness, loot)
    @name = name
    @link = link
    @occurence = occurence
    @weakness = weakness
    @loot = loot

    @@all << self

  end
  
end 