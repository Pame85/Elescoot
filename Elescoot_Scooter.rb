class Scooter
    attr_reader :stock, :scooter_number, :rented, :type
    # scooter inventory stock count
  
    def initialize(status)
      # status availability of scooter stock
      @stock = 0
      # stock balance similar to @balance = 0
      @serial_number = generate_scooter_number
      # scooter numbering based on stock number /scooter serial number ? 
      @rented = false
      # status rented or available for rent
      @type = type
      # scooter type with different fare?
    end
  
    def replenish(amount)
      @stock += amount
      # return scooter after renting / replenish scooter stock count
    end
  
    def deduct_stock(amount)
      @stock -= amount
      # SHOULD CHANGE THIS TO STOCK AMOUNT ?
    end
  
    def rented?
      @rented
    end
  
    def rented!
      @rented = true
    end
  
    def replenish_stock
      @rented = false
      # puts "Card is renewed. You can now travel again."
      puts "Stock is replenish. Scooter is now available for rent"
    end
  
    def sufficient_stock?(amount)
    #   @balance >= amount
        @stock >= amount
    end
  
    private
      def generate_scooter_number
        "#{rand(1000..9999)}"
      end
end

