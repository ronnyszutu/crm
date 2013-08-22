class Contact
	@id = 0

	def initialize (first_name, last_name, email, note)
		@first_name = first_name
		@last_name = last_name
		@email = email
		@note = note
	end

	#### SETTERS
	def first_name=(name)
		@first_name = name
	end

	def last_name=(name)
		@last_name = name
	end

	def email=(email)
		@email = email
	end

	def note=(note)
		@note = note 
	end

	def id=(id)
		@id = id
	end

	#### GETTERS
	def first_name
		@first_name
	end

	def last_name
		@last_name
	end

	def email
		@email
	end

	def note
		@note
	end

	def id
		@id
	end




	# def get_name_input
	# 	input = gets.chomp

	# 	if input =~ /\d/
	# 		puts "number detected... try again"
	# 		get_name_input
	# 	else
	# 		if input.empty?
	# 			puts "no input... try again"
	# 			get_name_input
	# 		end
	# 		return input
	# 	end
	# end

	# def get_email_input
	# 	input = gets.chomp
	# 	return input
	# end

	# def get_note_input
	# 	input = gets.chomp
	# 	return input
	# end	
end