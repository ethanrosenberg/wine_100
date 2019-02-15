require 'colorize'
require 'colorized_string'
require 'artii'

class Wine100::CLI

  def call

    puts ""
    puts "Welcome to the Top 100 Wines Rated by Wine Spectator".colorize(:color => :green)
    Wine100::Scrape.new.build_wines
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('Wine Top 100')
    menu

  end





  def menu
    count = 0
    input = ""
      until input == "exit"
        if count != 0
            puts "Would you like to make another choice? (y/n)".colorize(:color => :light_blue) if input != "5"
            another_choice = gets.chomp.to_s
            if another_choice == "y"
              display_options
              puts ""
              puts "Choice: "
              input = gets.strip.to_s
              #input = gets.chomp.to_s
              process_input(input)
            else
              input = "exit"
              break
            end
        else
          display_options
          input = gets.chomp.to_s
          process_input(input)
        end
          count += 1
      end
      goodbye
  end

  def process_input(input)

          if input == "1" || input == "1."
            list_top_wines
          elsif input == "2" || input == "2."
            list_by_rating
          elsif input == "3" || input == "3."
            list_by_price
          elsif input == "4" || input == "4."
          puts ""
          puts "Please enter a single keyword eg. \"blackberry\" to search for wines with tasting notes that match.".colorize(:color => :green)
          puts ""
          search_keyword = gets.chomp.to_s
          find_by_tasting_keyword(search_keyword)
          elsif input == "5" || input == "exit"
            goodbye
            exit
          else
           puts ""
           puts "Please enter a valid command."
           puts ""
          end

  end

  def display_options
      puts ""
      puts "Please enter the number of your choice:"
      puts " "
      puts "#{ColorizedString["1"].colorize(:red)}. View List of Top 100 Wines."
      puts "#{ColorizedString["2"].colorize(:red)}. List of Top 100 Wines by Score"
      puts "#{ColorizedString["3"].colorize(:red)}. List of Top 100 Wines by Price"
      puts "#{ColorizedString["4"].colorize(:red)}. Find wine by entering tasting note keyword eg. \"licorice\" (beta)"
      puts "#{ColorizedString["5"].colorize(:red)}. Exit"
  end

  def list_top_wines
    Wine100::Scrape.display_top_100
  end

  def list_by_rating
    Wine100::Scrape.display_top_100_by_score
  end

  def list_by_price
    Wine100::Scrape.display_top_100_by_price
  end

  def find_by_tasting_keyword(search_keyword)
    Wine100::Scrape.display_tasting_note_matches(search_keyword)
  end


  def goodbye
    puts "We hope you found the perfect wine! Goodbye!"
    puts ""
  end

end
