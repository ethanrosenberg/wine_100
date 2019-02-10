require 'pry'
class Wine100::Wine
  
  @@all = []
  
  attr_accessor :name, :rank, :vintage, :score, :price, :tasting_note
  
  def initialize(name)
    @name = name
    @@all << self
    binding.pry
  end
  
  def self.all
    @@all
  end
  
  def self.build_wine_from_table(row)
    self.new(build_wine_title(row))
  end
  
  def self.build_wine_title(row)
    #binding.pry
    winery_main_title = row.css("td[class='name'] div[class='table-name'] span[class='wineName']").children[1].text.strip
    
    winery_wine_title = row.css("td[class='name'] div[class='table-name'] span[class='wineName']").children[0].text.strip
    
    return "#{winery_main_title} #{winery_wine_title}"
  end
  
end