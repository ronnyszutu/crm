require "./contact"
require "./database"

class CRM
	def initialize(name)
		@crm_name = name
		clear_screen
		run_crm
	end

	def run_crm
		while @menu_input != 6
			display_menu
			get_menu_input
			call_option
			puts "\n\n"
		end
	end

	def call_option
		add_new_contact if @menu_input == 1
		modify_contact if @menu_input == 2
		delete_contact if @menu_input == 3
		display_all if @menu_input == 4
		display_attribute if @menu_input == 5
	end

	def add_new_contact
		clear_screen
		puts "#{@crm_name}\'s CRM > Add a new contact\n\n"
		print "Enter First Name: "
		first_name=(gets.chomp)
		print "Enter Last Name: "
		last_name=(gets.chomp)
		print "Enter Email Address: "
		email=(gets.chomp)
		print "Enter a Note: "
		note=(gets.chomp)
		contact = Contact.new(first_name, last_name, email, note)
		Database.add_contact(contact)
	end

	def modify_contact
		clear_screen
		puts "#{@crm_name}\'s CRM > Modify an existing contact\n\n"
		puts "Enter the id for the contact you wish to modify."
		id_to_modify = gets.chomp.to_i

		if Database.contact_exists?(id_to_modify)
			this_contact = Database.get_contact(id_to_modify)
			puts "This is your contact's current information:"
			puts "ID: #{this_contact.id}\nFirst Name: #{this_contact.first_name}\nLast Name: #{this_contact.last_name}\nEmail: #{this_contact.email}\nNote: #{this_contact.note}\n\n"
			if modify?
				print "\n\nEnter First Name: "
				this_contact.first_name = gets.chomp
				print "Enter Last Name: "
				this_contact.last_name = gets.chomp
				print "Enter Email Address: "
				this_contact.email = gets.chomp
				print "Enter a Note: "
				this_contact.note = gets.chomp

				puts "\n\nThis is your contact's newinformation:"
				puts "ID: #{this_contact.id}\nFirst Name: #{this_contact.first_name}\nLast Name: #{this_contact.last_name}\nEmail: #{this_contact.email}\nNote: #{this_contact.note}\n\n"
			end	
		else
			puts "This contact does not exist."
		end
		press_enter_to_continue
	end

	def delete_contact
		clear_screen
		puts "#{@crm_name}\'s CRM > Delete an existing contact\n\n"
		puts "Enter the id for the contact you wish to delete."
		id_to_delete = gets.chomp.to_i

		if Database.contact_exists?(id_to_delete)
			this_contact = Database.get_contact(id_to_delete)
			puts "\n\nThis is your contact's current information:"
			puts "ID: #{this_contact.id}\nFirst Name: #{this_contact.first_name}\nLast Name: #{this_contact.last_name}\nEmail: #{this_contact.email}\nNote: #{this_contact.note}\n\n"
			if delete?
				Database.delete_contact(id_to_delete)
			end	
		else
			puts "This contact does not exist."
		end
		press_enter_to_continue
	end

	def display_all
		clear_screen
		Database.display_all

		press_enter_to_continue
	end

	def display_attribute
		clear_screen
		puts "#{@crm_name}\'s CRM > Display an attribute\n\n"
		puts "Please select one of the following options: "
		attribute_menu
		input = get_attribute_input
		puts "\n\n"
		puts "All first names\n" if input == 1
		puts "All last name\n" if input == 2
		puts "All emails\n" if input == 3
		puts "All notes\n" if input == 4
		Database.display_attribute(input)
		press_enter_to_continue
	end

	#// HELPER METHODS
	def press_enter_to_continue
		puts "\nPress ENTER to return to main menu"
		gets
	end

	def clear_screen
		puts "\e[H\e[2J"
	end

	#// MENUS AND CONFIRMATIONS
	def display_menu
		clear_screen
		puts "#{@crm_name}\'s CRM \> Main menu\n\n"
		puts "Please select one of the following options: "
		puts "   [1] Add a new contact"
		puts "   [2] Modify an existing contact"
		puts "   [3] Delete a contact"
		puts "   [4] Display all the contacts"
		puts "   [5] Display an attribute"
		puts "   [6] Exit\n"
	end

	def attribute_menu
		puts "\nSelect an attribute"
		puts "   [1] First Name"
		puts "   [2] Last Name"
		puts "   [3] Email"
		puts "   [4] Note\n\n"
	end

	#// INPUTS
	def get_menu_input
		@menu_input = 0
		while (@menu_input < 1) or (@menu_input > 6)
			print "Enter a number: "
			@menu_input = gets.chomp.to_i
			if (@menu_input < 1) or (@menu_input > 6)
				puts "You've made an invalid selection. Try again."
			end
		end
		puts "\n\n"
	end

	def modify?
		input = 0
		while input < 1 or input > 2
			puts "\nModify this contact?"
			puts "[1] Yes"
			puts "[2] No"
			input = gets.chomp.to_i
			if input < 1 or input > 2
				puts "Invalid entry."
			end
		end
		return true if input == 1
		return false if input == 2
	end

	def delete?
		input = 0
		while input < 1 or input > 2
			puts "\nDelete this contact?"
			puts "[1] Yes"
			puts "[2] No"
			input = gets.chomp.to_i
			if input < 1 or input > 2
				puts "Invalid entry."
			end
		end
		return true if input == 1
		return false if input == 2
	end

	def get_attribute_input
		input = 0
		while input < 1 or input > 4		
			input = gets.chomp.to_i
			if input < 1 or input > 4
				puts "Invalid entry."
				attribute_menu
			end
		end
		return input
	end
end

CRM.new("Ronny")