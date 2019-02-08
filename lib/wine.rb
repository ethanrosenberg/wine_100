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
  
end