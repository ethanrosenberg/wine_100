require 'nokogiri'
require 'open-uri'
require 'pry'

class Wine100::Scrape
  
  attr_accessor :url

  
  def initialize
   

  end
  
  def load_page
    Nokogiri::HTML(open("./fixtures/winespectator.html"))
    #Nokogiri::HTML(open("https://top100.winespectator.com/lists/"))
  end
  
  def build_wines
    
  end
  
  def self.scrape_top_100
     url = 'https://top100.winespectator.com/lists/'
    @scrape_html = Nokogiri::HTML(open("./fixtures/winespectator.html"))
        binding.pry
    @scrape_html.css("tr[role='row']")
  end
  
end