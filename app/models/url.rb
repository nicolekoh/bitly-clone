class Url < ActiveRecord::Base
	#before_create :shorten #before you create a new entry run this first. 
	# This is Sinatra! Remember to create a migration!

	validates :long_url, presence: true
	validates :long_url, format: { with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/, message: "sorry its not a URL" }

	def self.shorten 
		 range = [*'0'..'9',*'A'..'Z',*'a'..'z']
		 range.sample 
		 string = Array.new(6){range.sample}.join
	end 
end
