class Owner
  attr_accessor :pets
  attr_reader :species, :name
  @@all = []
  
  
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end
 
 
  def self.all 
   @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count 
    @@all.length
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end 

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end 
 
  def buy_cat(name)
    self.cats << Cat.new(name, self)   
  end 
  
  def buy_dog(name)
    self.dogs << Dog.new(name, self)   
  end 

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    all_pets = cats + dogs
    all_pets.each do |pet|
      if pet.mood = "nervous"
        pet.owner = nil
      end
    end
  end

  def list_pets 
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end

end