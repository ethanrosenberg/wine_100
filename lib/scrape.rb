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
  
  def scrape_wine_advocate
    rows = []
    data_rows = self.load_page.css("tr[role='row']")
    
    count = 1
    data_rows.each do |row|
      wine_hash = {
        :name => build_wine_title(row),
        :rank => count,
        :vintage => row.css(".vintage").text.strip,
        :score => row.css(".score").text.strip,
        :price => row.css(".price").text.strip,
        :tasting_note => build_tasting_note(row)
      }
      count += 1
      rows << wine_hash
    end
    rows
  end


  def self.display_top_100
    Wine100::Wine.all.each do |wine|
      puts ""
      puts "---------------------------"
      puts "#{wine.rank}. #{wine.name} - #{wine.vintage}"
      puts ""
      puts "Score: #{wine.score} Price: #{wine.price}"
      puts ""
      puts "Tasting Notes:"
      puts "#{wine.tasting_note}"
      puts "---------------------------"
      puts ""
      
    end
  end
  
  def self.display_top_100_by_score
   
    sorted_by_score = Wine100::Wine.all.sort_by {|wine| -wine.score}
     count = 1
     sorted_by_score.each do |wine|
      puts ""
      puts "---------------------------"
      puts "#{count}. #{wine.name} Rank - #{wine.rank}"
      puts ""
      puts "Vintage: #{wine.vintage} Score: #{wine.score} Price: #{wine.price}"
      puts ""
      puts "Tasting Notes:"
      puts "#{wine.tasting_note}"
      puts "---------------------------"
      puts ""
      count += 1
    end
  end
  
  def self.display_top_100_by_price
    sorted_by_price = Wine100::Wine.all.sort_by {|wine| -wine.price}
     count = 1
     sorted_by_price.each do |wine|
      puts ""
      puts "---------------------------"
      puts "#{count}. #{wine.name} Rank - #{wine.rank}"
      puts ""
      puts "Vintage: #{wine.vintage} Score: #{wine.score} Price: #{wine.price}"
      puts ""
      puts "Tasting Notes:"
      puts "#{wine.tasting_note}"
      puts "---------------------------"
      puts ""
      count += 1
    end
  end
    

  
  def build_wine_title(row)
    winery_main_title = row.css("td[class='name'] div[class='table-name'] span[class='wineName']").children[1].text.strip
    winery_wine_title = row.css("td[class='name'] div[class='table-name'] span[class='wineName']").children[0].text.strip
    return "#{winery_wine_title} #{winery_main_title}"
  end
  
  def build_tasting_note(row)
    note = row.css(".name .table-aditionalInfo .tabel-note").children[0].text.strip
    reviewer_initials = row.css(".name .table-aditionalInfo .tabel-note i").children[0]
    return "#{note}#{reviewer_initials}"
  end
  
  
  def build_wines
    scrape_wine_advocate.each do |wine_item|
      Wine100::Wine.build_wine_from_table(wine_item)
    end
  end

  
end