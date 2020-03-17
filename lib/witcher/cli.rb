class Witcher::CLI

  def call
    
    
    chapters_plus_monsters
    display_monsters
    
    
    
    
    input = gets.strip.to_i-1
    index = input
    
    monster = Witcher::Beast.all[index]
    
    puts "#{monster.name}"
    puts ""
    puts "#{monster.occurence}".split(/(?<!\s)(?=[A-Z])/)
    puts ""
    puts "#{monster.weakness}".split(/(?<!\s)(?=[A-Z])/)
    puts ""
    puts "#{monster.loot}".split(/(?<!\s)(?=[A-Z])/)
    
    # Witcher::Chapters.drop_last
    # display_chapters
    
  end

  
  def chapters_plus_monsters
    Witcher::Scraper.scrape_chapters
    Witcher::Scraper.scrape_beasts
    Witcher::Scraper.monster_on_selection
  end 
  
  def display_chapters
    Witcher::Chapters.all.each_with_index do |chap, index|
    puts "#{index}. #{chap.name}"
    end
  end
  
    def display_monsters
    Witcher::Beast.all.each_with_index do |monst, index|
    puts "#{index}. #{monst.name}"
    end
  end
    

  def goodbye
    puts "Good luck on the Path!"
  end




end
