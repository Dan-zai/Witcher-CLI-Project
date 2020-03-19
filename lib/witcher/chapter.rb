class Witcher::Chapters

  attr_accessor :name, :monsters, :link

  @@all = []

  def initialize(name, link)
    @name = name
    @link = link
    self.class.all << self

    @monsterarray = []

  end
  
  def self.all
    @@all
  end
  
  def link
    @link
  end 
  
  def monsters
    @monsterarray
  end 
  
  def self.drop_last
    @@all.pop
  end


  def self.scrape_chapters
    doc = Nokogiri::HTML(open("https://witcher.fandom.com/wiki/The_Witcher_3_bestiary"))
    doc.css("h2 a").each do |c|
      url = c.attribute("href").value
      link = "https://witcher.fandom.com#{url}"
      name = c.text
      self.new(name, link)
    end
  end


  def add_monster(monster)
    @monsterarray << monster
  end 


end
