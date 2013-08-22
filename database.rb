class Database
  @contacts = []
  @id = 1000

  def self.add_contact(contact)
    contact.id=(@id)

    @contacts << contact
    @id += 1
  end

  def self.contacts
    @contacts
  end

  def self.get_contact(num)
    count = 1000
    index = 0

    while count <= @id - 1
      return @contacts[index] if count == num and !@contacts[index].nil?
      count += 1
      index += 1
    end

    return nil
  end

  def self.contact_exists?(num)
    count = 1000
    index = 0

    while count <= @id - 1
      return true if count == num and !@contacts[index].nil?
      count += 1
      index += 1
    end

    return false
  end

  def self.delete_contact(num)
    count = 1000
    index = 0

    while count <= @id - 1
      @contacts[index] = nil if count == num
      count += 1
      index += 1
    end
  end

  def self.display_all
    count = 1000
    index = 0

    while count <= @id - 1
      if contact_exists?(count)
        puts "ID: #{@contacts[index].id}"
        puts "First Name: #{@contacts[index].first_name}"
        puts "Last Name: #{@contacts[index].last_name}"
        puts "Email: #{@contacts[index].email}"
        puts "Note: #{@contacts[index].note}\n\n"
      end

      count += 1
      index += 1
    end
  end

  def self.display_attribute(input)
    count = 1000
    index = 0

    while count <= @id - 1
      if contact_exists?(count)
        puts "   #{@contacts[index].first_name}" if input == 1
        puts "   #{@contacts[index].last_name}" if input == 2
        puts "   #{@contacts[index].email}" if input == 3
        puts "   #{@contacts[index].note}\n" if input == 4
      end
      
      count += 1
      index += 1
    end    
  end
end