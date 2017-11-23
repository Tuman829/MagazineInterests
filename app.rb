require "./classes.rb"

puts "Welcome to magazine recommantion engine demo" 

puts "Here is a quick demo of the app"

#This section creates some subscibers 
bob = Subscriber.new("bob",["deer"])
linda = Subscriber.new("linda",["deer"])
tom = Subscriber.new("tom",["cats"])
sarah = Subscriber.new("sarah",["ninjas", "cats"])
abe = Subscriber.new("abe",["cats"])
fatima = Subscriber.new("fatima",["ninjas"])
billy = Subscriber.new("billy", ["jets", "cats"])
pilot = Subscriber.new("pilot",["jets"])

#this secion sets the magazines 
sneaky_cars = Magazine.new("Sneaky Cars", ["cars", "ninjas"])
katana_kitty = Magazine.new("Katana Kitty", ["cats",  "ninjas"])
deer_weekly = Magazine.new("Deer Weekly", ["deer"])
fancy_cat = Magazine.new("Fancy Cat", ["cats"])
fast_cars = Magazine.new("Fast Cars", ["cars"])

people = [pilot, bob,linda, tom, sarah, abe, fatima, billy]
magazines = [sneaky_cars, katana_kitty, deer_weekly, fancy_cat, fast_cars]

engine = RecomendationEngine.new([], magazines)

puts "Adding subscibers and listing the magazines they are interested in "

people.each do |person|
	puts person.name + " is interested in:"
 	engine.new_subscriber(person).each do |magazine|
 		puts magazine.name
 	end
end 

puts "When you add a Jets section to Fancy Cat the following users are effected"

engine.update_magazine("Add", "jets", 1).each do |u|
	puts u.name
end 

puts "When you remove Cats from Fancy cat the following users are effected"

engine.update_magazine("Remove", "cats", 1).each do |u|
	puts u.name
end 



