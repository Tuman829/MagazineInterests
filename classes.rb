#class RecItem {
#	Array features
#	def match(RecItem x)
#		return self.features - x.features
#	end
#}
class Subscriber
	def initialize(subscriber_name, interests)
		@name = subscriber_name
		@interests = interests
	end
	def interested_in?(magazine)
		qualities = magazine.qualities
		return @interests - qualities == []
	end
	def interests
		@interests
	end

	def uname
		@name
	end

end

class Magazine
	def initialize(magazine_name, qualities)
		@name = magazine_name
		@qualities = qualities
	end

	def name

		@name
	end

	def qualities

		@qualities
	end

	def add_quality(quality)

		@qualities << quality
	end 

	def remove_quality(quality)
		if @qualities.include?(quality)
			@qualities.delete(quality)
			return true
		else
			return false
		end
	end	
end


class RecomendationEngine
	def initialize(subscribers, magazines)
		@subscribers = subscribers
		@magazines = magazines
	end
	def new_subscriber(subscriber)
		interests = []
		@subscribers << subscriber
		@magazines.each do |magazine|
			interests << magazine if subscriber.interested_in?(magazine)
		end
		return interests		
	end
	def update_magazine(command, magazine_id, quality)
		affected_subscribers=[]		
		magazine = @magazines[magazine_id]
		old_magazine = magazine.clone 
		command == "Add" ? magazine.add_quality(quality) : magazine.remove_quality(quality)
		@subscribers.each do |subscriber|
			affected_subscribers << subscriber if (subscriber.interested_in?(magazine) != subscriber.interested_in(old_magazine))
		end
		return affected_subscribers
	end
end

