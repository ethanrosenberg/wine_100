require 'pry'
class Wine100::Wine
  
  @@all = []
  
  attr_accessor :name, :rank, :vintage, :score, :price, :tasting_note
  
  def initialize(name, rank, vintage)
    @name = name
    @rank = "1"
    @vintage = vintage
    @@all << self
    binding.pry
  end
  
  def self.all
    @@all
  end
  
  def self.build_wine_from_table(row)
    self.new(build_wine_title(row),)
  end
  
 
  
  def vintage
    @vintage ||= wine_row.css("td[class='name'] div[class='table-name'] span[class='wineName'] .vintageNumber").text.strip
  end
  
  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
  
  
  
  
end