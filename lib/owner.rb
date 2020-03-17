class Owner
  attr_reader :name, :species

  @@all = []

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def say_species
    "I am a #{species}."
  end

  def cats
    Cat.all.select { |cat| cat if cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog if dog.owner == self }
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
    cat
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
    dog
  end

  def walk_dogs
    dogs.map { |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats.map { |cat| cat.mood = "happy" }
  end

  def sell_pets
    all_pets = dogs.concat(cats)
    all_pets.map do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  private

  def save
    @@all << self
  end
end
