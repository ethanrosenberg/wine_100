require 'nokogiri'
require 'open-uri'
require 'pry'

class Wine100::Scrape
  
  attr_accessor :url

  #attr_accessor :name, :rank, :vintage, :score, :price, :tasting_note
  
  def initialize
   

  end
  
  def load_page
    Nokogiri::HTML(open("./fixtures/winespectator.html"))
    #Nokogiri::HTML(open("https://top100.winespectator.com/lists/"))
  end
  
  def scrape_wine_advocate
    rows = []
    data_rows = self.load_page.css("tr[role='row']")
    
    data_rows.each do |row|
      wine_hash = {
        :name => build_wine_title(row),
        :rank => "",
        :vintage => row.css(".vintage").text.strip,
        :score => row.css(".score").text.strip,
        :price => row.css(".price").text.strip,
        :tasting_note => ""
      }
      
      binding.pry
    end
    
  end
  
   def build_wine_title(row)
    winery_main_title = row.css("td[class='name'] div[class='table-name'] span[class='wineName']").children[1].text.strip
    winery_wine_title = row.css("td[class='name'] div[class='table-name'] span[class='wineName']").children[0].text.strip
    return "#{winery_main_title} #{winery_wine_title}"
  end
  
  
  def build_wines
    scrape_wine_advocate.each do |wine_item|
      Wine100::Wine.build_wine_from_table(wine_item)
    end
  end

  
end