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
    doc.css("div.divTable a").each do |beast|
      url = beast.attribute(href).value
      name = beast.attribute(title).value
      link = "https://witcher.fandom.com#{url}"
      beast = Beast.new(name, link)
    end
  end
  
  def self.scrape_beast_attributes
    doc = Nokogiri::HTML(open("#{beast.url}"))
    
    
    
  
end 