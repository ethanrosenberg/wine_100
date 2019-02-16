#require 'colorize'
#require 'colorized_string'
#require 'artii'

class Wine100::CLI

  def start

    puts ""
    puts "Welcome to the Top 100 Wines Rated by Wine Spectator".colorize(:color => :green)
    Wine100::Scrape.new.build_wines

    a = Artii::Base.new :font => 'slant'
    puts a.asciify('Wine Top 100')
    menu

  end


  def menu
    first = true
    input = ""
      until input == "exit"
        if !first
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
          puts ""
          puts "Choice: "
          input = gets.chomp.to_s
          process_input(input)
        end
          first = false
      end
      goodbye
  end

  def process_input(input)

          if input == "1" || input == "1."
            list_top_wines
          elsif input == "2" || input == "2."
            list_by_score
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
    Wine100::Wine.all.each do |wine|
     puts ""
     puts "---------------------------"
     puts "#{ColorizedString[wine.rank.to_s].colorize(:red)}. #{wine.name} - #{wine.vintage}"
     puts ""
     puts "Vintage: #{wine.vintage} Score: #{wine.score.to_s} Price: $#{wine.price}"
     puts ""
     puts "Tasting Notes:"
     puts "#{wine.tasting_note}"
     puts "---------------------------"
     puts ""
   end
  end

  def list_by_score
    Wine100::Wine.sorted_by_score.each.with_index(1) do |wine, i|
     puts ""
     puts "---------------------------"
     puts "#{i}. #{wine.name} - Rank: #{wine.rank}"
     puts ""
     puts "Vintage: #{wine.vintage} Score: #{ColorizedString[wine.score.to_s].colorize(:red)} Price: $#{wine.price}"
     puts ""
     puts "Tasting Notes:"
     puts "#{wine.tasting_note}"
     puts "---------------------------"
     puts ""
   end
  end

  #def list_by_rating
    #Wine100::Scrape.display_top_100_by_score
  #end

  def list_by_price
    Wine100::Wine.sorted_by_price.each.with_index(1) do |wine, i|
      puts ""
      puts "---------------------------"
      puts "#{i}. #{wine.name} - Rank: #{wine.rank}"
      puts ""
      puts "Vintage: #{wine.vintage} Score: #{wine.score} Price: #{ColorizedString["$#{wine.price.to_s}"].colorize(:red)}"
      puts ""
      puts "Tasting Notes:"
      puts "#{wine.tasting_note}"
      puts "---------------------------"
      puts ""
    end
    #Wine100::Scrape.display_top_100_by_price
  end

  def find_by_tasting_keyword(search_keyword)
    matches = Wine100::Wine.all.select { |item| item.tasting_note.downcase.include?(search_keyword.downcase) }
    if matches.size > 0
      matches.each.with_index(1) do |wine, i|
      puts ""
      puts "---------------------------"
      puts "#{i}. #{wine.name} - Rank: #{wine.rank}"
      puts ""
      puts "Vintage: #{wine.vintage} Score: #{wine.score} Price: $#{wine.price}"
      puts ""
      puts "Tasting Notes:"
      puts "#{wine.tasting_note.gsub(search_keyword.downcase, ColorizedString[search_keyword].colorize(:green))}"
      puts "---------------------------"
      puts ""
    end
    else
      puts ""
      puts ColorizedString["Sorry no matches were found!"].colorize(:red)
      puts ""
    end
  end


  def goodbye
    puts "We hope you found the perfect wine! Goodbye!"
    puts ""
  end

end
