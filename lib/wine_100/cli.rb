class Wine100::CLI
  def call
    puts "Welcome to the Top 100 Wines Rated by Wine Spectator"
   
    list_top_wines
  end
  
  def list_top_wines
    puts "1. 1998 Chateau Mouton Rothschild"
    puts "2. 1988 Chateau Petrus Pomerol"
  end
  
  def list_by_price_most_expensive
    puts "Would you like to list the top 100 wines by price Highest - Lowest? (y/n)"
  end
  
  def menu
    puts "Please enter the number of your choice:"
    puts "1. List of Top 100 Wines by prices Highest"
    puts "2. List of Top 100 Wines by Rating"
  end
end