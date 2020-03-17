class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end
  
  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|animal| animal.owner == self}
  end

  def dogs
    Dog.all.select {|animal| animal.owner == self}
  end

  def buy_cat(name)
    newcat = Cat.new(name, self)
    newcat
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
    dog
  end

  def walk_dogs
     dogs.map {|animal| animal.mood = "happy"}
  end

  def feed_cats
    cats.map {|animal| animal.mood = "happy"}
  end

  def sell_pets
    cats.map do |animal|
      animal.mood = "nervous"
      animal.owner = nil
    end
    dogs.map do |animal|
      animal.mood = "nervous"
      animal.owner = nil
    end
  end

  def list_pets
    catnum = cats.count
    dognum = dogs.count
    return "I have #{dognum} dog(s), and #{catnum} cat(s)."
  end
end