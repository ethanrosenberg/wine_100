require 'nokogiri'
require 'open-uri'
require 'pry'

class Wine100::Scrape
  
  attr_accessor :url

  
  def initialize
   

  end
  
  def self.scrape_top_100
     url = 'https://top100.winespectator.com/lists/'
    @scrape_html = Nokogiri::HTML(open("./fixtures/winespectator.html"))
        binding.pry
    @scrape_html.css("tr[role='row']")
  end
  
end