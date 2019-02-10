require 'pry'
class Wine100::Wine
  
  @@all = []
  
  attr_accessor :name, :rank, :vintage, :score, :price, :tasting_note
  
  def initialize(name = nil, rank = nil, vintage = nil, score = nil, price = nil, tasting_note = nil)
    @name = name
    @rank = rank
    @vintage = vintage
    @score = score.to_i
    @price = price
    @tasting_note = tasting_note
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.build_wine_from_table(row)
    self.new(row[:name], row[:rank], row[:vintage], row[:score], row[:price], row[:tasting_note])
  end
  
  
  
  
end