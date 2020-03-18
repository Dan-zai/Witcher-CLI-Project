class Witcher::Monster

  attr_accessor :name, :occurence, :weakness, :loot, :link, :type

  @@all =[]

  def initialize(name, link, chapter)
    @name = name
    @link = link
    @occurence = occurence
    @weakness = weakness
    @loot = loot
    self.class.all << self

  end

  def self.all
    @@all
  end

# o.attribute("title").value

  def self.scrape_monsters(chapter)
    doc = Nokogiri::HTML(open("#{chapter.link}"))
    doc.xpath("//*[@class='reference']").remove
    doc.css("div.divTable a").each do |o|
      url = o.attribute("href").value
      link = "https://witcher.fandom.com#{url}"
      name = o.attribute("title").value
      monster = self.new(name, link, chapter)
      chapter.add_monster(monster)
    end
  end
  
    
  def monster_details
      beastdoc = Nokogiri::HTML(open("#{self.link}"))
      self.occurence = beastdoc.xpath('//div[@data-source="Occurrence"]/div/a/text()')
      self.weakness = beastdoc.xpath('//div[@data-source="Susceptibility"]/div/a/text()')
      self.loot = beastdoc.xpath('//div[@data-source="Loot"]/div/a/text()')
  end

  

end 