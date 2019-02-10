class Wine100::CLI
  
  def call
    puts "Welcome to the Top 100 Wines Rated by Wine Spectator"
    Wine100::Scrape.new.build_wines
    menu
  end
  

  
  def menu
    count = 0
    input = ""
      until input == "exit" 
        if count != 0
            puts "Would you like to make another choice? (y/n)"
            another_choice = gets.chomp.to_s
            if another_choice == "y"
              display_options
              input = gets.chomp.to_s
              process_input(input)
            else
              input = "exit"
              break
            end
        else
          display_options
          input = gets.chomp.to_s
          process_input(input)
          #binding.pry
          
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
            find_by_tasting_keyword
          elsif input == "5" || input == "exit"
            goodbye
            input == "exit"
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
      puts "1. View List of Top 100 Wines."
      puts "2. List of Top 100 Wines by Score"
      puts "3. List of Top 100 Wines by Price"
      puts "4. Find wine by entering tasting note keyword eg. \"licorice\" (beta)"
      puts "5. Exit"
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
  
  def find_by_tasting_keyword
    
  end
  
  
  def goodbye
    puts "We hope you found the perfect wine! Goodbye!"
  end
  
end