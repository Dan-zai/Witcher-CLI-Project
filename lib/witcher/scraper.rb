class Witcher::Scraper

  def self.scrape_chapters
    doc = Nokogiri::HTML(open("https://witcher.fandom.com/wiki/The_Witcher_3_bestiary"))
    doc.css("span.mw-headline").each do |a|
      name = a.attribute("id").value.split("_").join(" ")
      chapter = Witcher::Chapters.new(name)
    end
  end

  def self.scrape_beasts
    doc = Nokogiri::HTML(open("https://witcher.fandom.com/wiki/The_Witcher_3_bestiary"))
    doc.css("div.divTable a").each do |o|
      url = o.attribute("href").value
      link = "https://witcher.fandom.com#{url}"
      name = o.attribute("title").value
      monster = Witcher::Beast.new(name, link)
    end
      
  def self.monster_on_selection(monster)
      Witcher::Beast.all.each do |eachmonster|
      beastdoc = Nokogiri::HTML(open("#{eachmonster.link}"))

      eachmonster.occurence = beastdoc.xpath('//div[@data-source="Occurrence"]/div/a/text()')
      eachmonster.weakness = beastdoc.xpath('//div[@data-source="Susceptibility"]/div/a/text()')
      eachmonster.loot = beastdoc.xpath('//div[@data-source="Loot"]/div/a/text()')
    end
    end
  end
  
end 