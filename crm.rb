require "contact"
require "database"

class CRM
	def initialize(name)
		@crm_name = name
		run_crm
	end

	def run_crm
		while @menu_input != 6
			display_menu
			get_menu_input
			call_option
		end
	end

	def display_menu
		clear_screen
		puts "#{@crm_name}\'s CRM"
		puts "Please select one of the following options: "
		puts "   [1] Add a new contact"
		puts "   [2] Modify an existing contact"
		puts "   [3] Delete a contact"
		puts "   [4] Display all the contacts"
		puts "   [5] Display an attribute"
		puts "   [6] Exit\n"
	end

	def call_option
		add_contact if @menu_input == 1
		modify_contact if @menu_input == 2
		delete_contact if @menu_input == 3
		display_all if @menu_input == 4
		display_attribute if @menu_input == 5
	end

	def add_new_contact
		print "Enter First Name: "
		first_name=(gets.chomp)
		print "Enter Last Name: "
		last_name=(gets.chomp)
		print "Enter Email Address: "
		email=(gets.chomp)
		print "Enter a Note: "
		note=(gets.chomp)
		contact = Contact.new(first_name, last_name, email, note)
	end

	def modify_contact
		
	end

	def delete_contact
		
	end

	def display_all
		
	end

	def display_attribute

	end

	def clear_screen
		puts "\e[H\e[2J"
	end

	def get_menu_input
		@menu_input = 0
		while (@menu_input < 1) or (@menu_input > 6)
			print "Enter a number: "
			@menu_input = gets.chomp.to_i
			if (@menu_input < 1) or (@menu_input > 6)
				puts "You've made an invalid selection. Try again."
			end
		end
	end
end

CRM.new("Ronny")