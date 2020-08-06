require 'pry'

class Owner
    @@all = []

    def initialize(name, species="human")
        @species = species
        @name = name
        @@all << self
    end

    attr_reader :name, :species

    def say_species
        "I am a #{@species}."
    end

    def self.all
        @@all
    end

    def self.count
        @@all.count
    end

    def self.reset_all
        @@all.clear
    end

    def cats
        #self.name == cat.owner?
        Cat.all.select {|x| x.owner == self}
    end

    def dogs
        #self.name == cat.owner?
        Dog.all.select {|x| x.owner == self}
    end

    def buy_cat(cat_name)
        #owner needs to obtain cat by name
        #and cat needs to be part of cat class
        new_cat = Cat.new(cat_name, self)
        #binding.pry
    end

    def buy_dog(dog_name)
        new_dog = Dog.new(dog_name, self)
        #binding.pry
    end

    def walk_dogs
        dogs.each {|x| x.mood = "happy"}
    end

    def feed_cats
        cats.each {|x| x.mood = "happy"}
    end

    def sell_pets
        all_pets = dogs.zip(cats).flatten!
        all_pets.each {|x| x.mood= "nervous"; x.owner = nil}
    end

    def list_pets
        "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end

end