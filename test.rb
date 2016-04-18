class User
	attr_accessor :first_name, :last_name

	def initialize(details = {})
		@first_name = details[:first_name]
		@last_name = details[:last_name]
	end
end

new_user = User.new(first_name: 'Leslie')
new_user.last_name = 'Ang'

