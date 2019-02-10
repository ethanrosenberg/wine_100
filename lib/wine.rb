class Wine100::Wine
  
  @@all = []
  
  attr_accessor :name, :rank, :vintage, :score, :price, :tasting_note
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.build_wine_from_table(row)
    self.new(row.css("td[class='name'] div[class='table-name'] span[class='wineName']"))
  end
  
end