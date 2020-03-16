class Witcher::CLI

  def call
    chapters_plus_monsters
    display_monsters
    # Witcher::Chapters.drop_last
    # display_chapters
    
  end

  
  def chapters_plus_monsters
    Witcher::Scraper.scrape_chapters
    Witcher::Scraper.scrape_beasts
    Witcher::Scraper.scrape_beast_attributes
  end 
  
  def display_chapters
    Witcher::Chapters.all.each_with_index do |chap, index|
    puts "#{index}. #{chap.name}"
    end
  end
  
    def display_monsters
    Witcher::Beast.all.each_with_index do |monst, index|
    puts "#{monst.name}"
    puts "#{monst.occurence}"
    puts "#{monst.weakness}"
    puts "#{monst.loot}"
    end
  end
    

#   def menu
#     input = nil
#     puts "Which Chapter takes your fancy today?"
#     while input != "Farewell"
#     input = gets.strip.downcase
#     case input
#     when "1"
#       puts "Beasts are natural, but do not underestimate them!"
#       # beast_menu
#     when "2"
#       puts "Necrophages are the foulest of them all young Witcher"
#       # necrophage_menu
#     when "3"
#       puts "Ancient and evil, a true advesary"
#       # relics_menu
#     when "4"
#       puts "Cunning bloodsuckers, hope you never run into a higher vampire my lad"
#     when "Chapters"
#       list_chapters
#     else
#       puts "Come again lad? I have no idea what you're on about"
#     end
#   end
# end

  def goodbye
    puts "Good luck on the Path!"
  end




end
