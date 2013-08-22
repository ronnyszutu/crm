class CRM_App
	def initialize
		run_crm
	end

	def run_crm
		while @menu_input != 6
			display_menu
			get_menu_input
			menu_selection
		end
	end

	def display_menu
		clear_screen
		puts "Please select one of the following options: "
		puts "   [1] Add Contact"
		puts "   [2] Modify Contact"
		puts "   [3] Delete Contact"
		puts "   [4] Display All"
		puts "   [5] Display Attribute"
		puts "   [6] Exit"
		puts "\n\n\n"
	end

	def menu_selection
		add_contact if @menu_input == 1
		modify_contact if @menu_input == 2
		delete_contact if @menu_input == 3
		display_all if @menu_input == 4
		display_attribute if @menu_input == 5
	end

	def add_contact
	
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
			@menu_input = gets.chomp.to_i
		end
	end
end

CRM_App.new
