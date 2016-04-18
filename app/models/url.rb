class Url < ActiveRecord::Base
	#before_create :shorten #before you create a new entry run this first. 
	# This is Sinatra! Remember to create a migration!
	def shorten 
		 range = [*'0'..'9',*'A'..'Z',*'a'..'z']
		 range.sample 
		 string = Array.new(6){range.sample}.join
		 self.short_url = string
	end 
end
