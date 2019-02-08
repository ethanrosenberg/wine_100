class Wine100::CLI
  def call
    puts "Welcome to the Top 100 Wines Rated by Wine Spectator"
    menu
  end
  

  
  def menu
    
    input = ""
    until input == "exit" 
      puts "Please enter the number of your choice:"
      puts " "
      puts "1. View List of Top 100 Wines."
      puts "2. List of Top 100 Wines by Rating"
      puts "3. List of Top 100 Wines by Price"
      puts "4. Find wine by entering tasting note keyword eg. \"licorice\" (beta)"
      puts "5. Exit"
      
      input = gets.chomp.to_s
        
      
      if input == "1" || input == "1."
        list_top_wines
      elsif input == "2" || input == "2."
        list_by_rating
      elsif input == "3" || input == "3."
        list_by_price
      elsif input == "4" || input == "4."
        find_by_tasting_keyword
      elsif input == "exit"
        goodbye
      end
      
    end
      
  end
  
  def list_top_wines

  end
  
  def list_by_rating
    
  end
  
  def list_by_price
    
  end
  
  def find_by_tasting_keyword
    
  end
  
  def 
  
  def goodbye
    "See you later!"
  end
  
end