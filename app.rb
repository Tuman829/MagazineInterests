require "./classes.rb"

puts "Welcome to magazine recommantion engine" 

bob = Subscriber.new("bob",["deer"])
linda = Subscriber.new("linda",["deer"])
tom = Subscriber.new("tom",["cats"])
sarah = Subscriber.new("sarah",["ninjas", "cats"])
abe = Subscriber.new("abe",["cats"])
fatima = Subscriber.new("fatima",["ninjas"])

sneaky_cars = Magazine.new("Sneaky Cars", ["cars", "ninjas"])
katana_kitty = Magazine.new("Katana Kitty", ["cats",  "ninjas"])
deer_weekly = Magazine.new("Deer Weekly", ["deer"])
fancy_cat = Magazine.new("Fancy Cat", ["cats"])
fast_cars = Magazine.new("Fast Cars", ["cars"])


people_not_bob = [bob, linda, tom, sarah, abe, fatima]
bobs = [bob]
magazines = [sneaky_cars, katana_kitty, deer_weekly, fancy_cat, fast_cars]

engine = RecomendationEngine.new(bobs, magazines)
cat = 0
people_not_bob.each do |person|
	#puts cat
	puts person.uname 
 	engine.new_subscriber(person).each do |i|
 		puts i.name
 	end
	#cat = cat + 1 
end 
