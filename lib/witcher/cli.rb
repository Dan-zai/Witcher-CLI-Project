class Witcher::CLI

  def call
    list_chapters
    menu
    goodbye
  end

  def list_chapters
    puts "Welcome to the bestiary! Here are it's chapters"
    puts <<-BEASTS
      1. Beasts
      2. Necrophages
      3. Relics
      4. Vampires
    BEASTS
  end

  def menu
    input = nil
    puts "Which Chapter takes your fancy today?"
    while input != "Farewell"
    input = gets.strip.downcase
    case input
    when "1"
      puts "Beasts are natural, but do not underestimate them!"
      beast_menu
    when "2"
      puts "Necrophages are the foulest of them all young Witcher"
      necrophage_menu
    when "3"
      puts "Ancient and evil, a true advesary"
      relics_menu
    when "4"
      puts "Cunning bloodsuckers, hope you never run into a higher vampire my lad"
    when "Chapters"
      Witcher::Scraper.scrape_chapters
      display_chapters
      # list_chapters
    else
      puts "Come again lad? I have no idea what you're on about"
    end
  end
end

  def goodbye
    puts "Good luck on the Path!"
  end


  def display_chapters
    Witcher::Chapters.all.each_with_index(1) do |chap, index|
      puts "#{index}. #{chap.name}"
    end
  end



end
