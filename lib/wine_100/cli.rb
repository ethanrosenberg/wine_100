class Wine100::CLI
  def call
    puts "Welcome to the Top 100 Wines Rated by Wine Spectator"
   
    list_top_wines
  end
  
  def list_top_wines
    puts "1. 1998 Chateau Mouton Rothschild"
    puts "2. 1988 Chateau Petrus Pomerol"
  end
  
  def menu
    puts "Please enter the number of your choice:"
    puts " "
    puts "1. View List of Top 100 Wines."
    puts "2. List of Top 100 Wines by Rating"
    puts "3. List of Top 100 Wines by Price"
    puts "4. Find wine by tasting note keyword eg. licorice (beta)"
  end
  
   def list_by_price_most_expensive
    puts "Would you like to list the top 100 wines by price Highest - Lowest? (y/n)"
  end
  
end