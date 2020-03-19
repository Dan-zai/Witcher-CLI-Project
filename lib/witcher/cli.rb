class Witcher::CLI

  def call
    Witcher::Chapters.scrape_chapters
    Witcher::Chapters.drop_last
    puts "Welcome to the Bestiary, young Witcher! The finest collection of creatures and their information in all of The Continent".cyan.bold
    menu
    goodbye
  end

  def menu
    menu_prompt = "feel free to choose a chapter by it's numberor say farewell and I'll see you again soon!".cyan
    puts "Here are our chapters on beasts and unnaturals".cyan
    puts menu_prompt
    display_chapters
    input = nil
    while input != "exit"
      input = gets.chomp.downcase
      if input.to_i.between?(0,11)
        index = input.to_i
        chapter = Witcher::Chapters.all[index]
        # return index
        puts ""
        puts "#{chapter.name}! A fine choice, let's take a look at some examples".cyan
        Witcher::Monster.scrape_monsters(chapter)
        monsters_in_chapter(chapter)
      elsif input == "farewell"
        puts "Good luck on the path!".cyan
        exit
      else
        puts "My apologies, I don't quite understand...".cyan
        puts "#{menu_prompt}"
      end
    end
  end


  def help
    puts ""
    puts "Say Back to return to the previous section".cyan
    puts ""
    puts "Say the page number you'd like to view".cyan
    puts ""
    puts "Just say Farewell if you're bored of this lad".cyan
    puts ""
    menu
  end

  def monster_menu(chapter, monster)
    menu_prompt = "Want to know about another #{chapter.name}?".cyan
    puts menu_prompt
    input = nil
    while input != "exit"
      input = gets.chomp.downcase
      if input == "yes"
        monsters_in_chapter(chapter)
      elsif input == "no"
        puts "Very well... Say back to view the chapters or farewell to leave".cyan
      elsif input == "back"
      menu
      elsif input == "farewell"
        puts "Good luck on the path!".cyan
        exit
      else
        puts "Sorry, I didn't understand that.  #{menu_prompt}"
      end
    end
  end


  def monsters_in_chapter(chapter)
    
    display_monster(chapter)

    puts ""
    puts "Tell me the page number of the creature you'd like to know more about".cyan
    puts ""
    input = gets.strip.to_i
    index = input
    monster = chapter.monsters[index]
    monster.monster_details
    display_monster_details(monster)
    monster_menu(chapter, monster)

  end


  def display_chapters
    Witcher::Chapters.all.each_with_index do |chap, index|
      puts "#{index}. #{chap.name}"
    end
  end

  def display_monster(chapter)
    chapter.monsters.each_with_index do |monst, index|
      puts "#{index}. #{monst.name}"
    end
  end

  def display_monster_details(monster)
    puts "#{monster.name}".green.bold
    puts ""
    puts "Common in:".cyan
    puts "#{monster.occurence}".split(/(?<!\s)(?=[A-Z])/)
    puts ""
    puts "Susceptible to:".cyan
    puts "#{monster.weakness}".split(/(?<!\s)(?=[A-Z])/)
    puts ""
    puts "Useful materials:".cyan
    puts "#{monster.loot}".split(/(?<!\s)(?=[A-Z])/)
    puts ""
  end

  def goodbye
    "Goodluck on the path!"
  end

end
