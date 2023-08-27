class Scooter
    attr_accessor :state, :location, :is_docked
    
    def initialize(location)
      @state = "Available"
      @location = location
      @is_docked = false
    end
    
    def rent(user)
      if @state == "Available" && !@is_docked
        @state = "Rented"
        @is_docked = true
        user.rented_scooter = self
        puts "Scooter rented by #{user.name}."
      else
        puts "Scooter is not available for rent."
      end
    end
    
    def return
      if @state == "Rented" && @is_docked
        @state = "Available"
        @is_docked = false
        user = @user
        user.return_scooter
        puts "Scooter returned by #{user.name}."
      else
        puts "Scooter cannot be returned."
      end
    end
    
    def mark_as_broken
      if @state == "Available" && !@is_docked
        @state = "Broken"
        puts "Scooter marked as broken."
      else
        puts "Scooter cannot be marked as broken."
      end
    end
    
    def repair
      if @state == "Broken"
        @state = "Available"
        puts "Scooter repaired."
      else
        puts "Scooter does not need repair."
      end
    end
    
    def calculate_duration_and_cost(start_time, end_time)
      duration = (end_time - start_time) / 60.0
      cost = duration * 0.15 # $0.15 per minute
      puts "Rental duration: #{duration} minutes."
      puts "Rental cost: $#{cost}."
    end
    
    def display_status
      puts "Scooter status: #{@state}."
      puts "Scooter location: #{@location}."
      puts "Scooter docked: #{@is_docked}."
    end
end

class User
    attr_accessor :name, :rented_scooter
    
    def initialize(name)
      @name = name
      @rented_scooter = nil
    end
    
    def rent_scooter(scooter)
      if @rented_scooter.nil?
        scooter.rent(self)
      else
        puts "You already have a rented scooter."
      end
    end
    
    def return_scooter
      @rented_scooter = nil
    end
end

class DockingStation
    attr_accessor :location, :capacity, :available_scooters
    
    def initialize(location, capacity)
      @location = location
      @capacity = capacity
      @available_scooters = []
    end
    
    def dock_scooter(scooter)
      if @available_scooters.length < @capacity
        @available_scooters << scooter
        scooter.is_docked = true
        puts "Scooter docked at #{@location}."
      else
        puts "Docking station is full."
      end
    end
    
    def undock_scooter(scooter)
      if @available_scooters.include?(scooter)
        @available_scooters.delete(scooter)
        scooter.is_docked = false
        puts "Scooter undocked from #{@location}."
      else
        puts "Scooter not found at this docking station."
      end
    end
end

class Rental
    attr_accessor :scooter, :user, :start_time, :end_time
    
    def initialize(scooter, user, start_time)
      @scooter = scooter
      @user = user
      @start_time = start_time
      @end_time = nil
    end
    
    def calculate_cost
      if @end_time.nil?
        puts "Rental has not ended yet."
      else
        @scooter.calculate_duration_and_cost(@start_time, @end_time)
      end
    end
    
    def display_rental_info
      puts "Rented scooter: #{@scooter}."
      puts "Rented by: #{@user.name}."
      puts "Start time: #{@start_time}."
      puts "End time: #{@end_time}."
    end
end
  
class PricingSystem
    def self.calculate_cost(start_time, end_time)
      duration = (end_time - start_time) / 60.0
      if duration < 30
        cost = duration * 0.20 # $0.20 per minute for first 30 minutes
      else
        cost = 6 + (duration - 30) * 0.10 # $6 for first 30 minutes, then $0.10 per minute after that
      end
      return cost
    end
  end
end

Begin
  def self.run
    puts "Welcome to the Elescoot scooter system!"

    while true
      puts "\nWhat would you like to do?"
      puts "1. Rent a scooter"
      puts "2. Return a scooter"
      puts "3. Mark a scooter as broken"
      puts "4. Repair a scooter"
      puts "5. Exit"

      choice = gets.chomp.to_i

      case choice
      when 1
        puts "Enter your name:"
        user_name = gets.chomp
        user = User.new(user_name)

        puts "Enter the location of the scooter:"
        location = gets.chomp
        scooter = Scooter.new(location)

        user.rent_scooter(scooter)
      when 2
        puts "Enter your name:"
        user_name = gets.chomp
        user = User.new(user_name)

        user.return_scooter
      when 3
        puts "Enter the location of the scooter:"
        location = gets.chomp
        scooter = Scooter.new(location)

        scooter.mark_as_broken
      when 4
        puts "Enter the location of the scooter:"
        location = gets.chomp
        scooter = Scooter.new(location)

        scooter.repair
      when 5
        puts "Thank you for using the Elescoot scooter system. Goodbye!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end
end
Scooter.run