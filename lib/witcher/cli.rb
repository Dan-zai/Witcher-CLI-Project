class Witcher::CLI

  def call
    
    puts "Welcome, young Witcher... to the Bestiary!"
    puts ""
    puts "Pick a chapter number, and lets get started!"

    Witcher::Chapters.scrape_chapters
    display_chapters

    input = gets.strip.to_i
    index = input
  
    chapter = Witcher::Chapters.all[index]
  
    puts "#{chapter.name}! A fine choice, let's take a look at some examples"

    Witcher::Monster.scrape_monsters(chapter)
    display_monsters_in_chapter(chapter)
    
    input = gets.strip.to_i
    index = input
    
    monster = chapter.monsters[index]
    monster.monster_details
  

    puts "#{monster.name}"
    puts ""
    puts "#{monster.occurence}".split(/(?<!\s)(?=[A-Z])/)
    puts ""
    puts "#{monster.weakness}".split(/(?<!\s)(?=[A-Z])/)
    puts ""
    puts "#{monster.loot}".split(/(?<!\s)(?=[A-Z])/)
    puts ""
    puts "#{monster.type}".split(/(?<!\s)(?=[A-Z])/)
    
  end
  
  def display_chapters
    Witcher::Chapters.all.each_with_index do |chap, index|
      puts "#{index}. #{chap.name}"
    end
  end
  
  
  def display_monsters_in_chapter(chapter)
    chapter.monsters.each_with_index do |monst, index|
      puts "#{index}. #{monst.name}"
    end
  end


end

