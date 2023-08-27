
    total_scooters = 10
    rented_out = 5
    available = 3
    broken = 2

    stock = total_scooters - rented_out - broken
    print("Available scooters in stock:", stock)

  def scooter_renting
     # Take out 1 scooter for rent
      rented_out += 1
      available -= 1
     # Print the updated balance
      print("Scooter balance afer out:", available, "scooters available for rent.")
     # Customer returns 1 scooter
      rented_out -= 1
      available += 1
     # Print the updated balance
      print("Scooter balance after return:", available, "scooters available for rent.")
  end

#   def renting_rate
#       normal_rate = 10  # Price rate per hour for normal hours
#       pick_hour_rate = 15  # Price rate per hour for pick hours
#       rental_duration = 3  # Duration of the rental in hours
#     if rental_duration <= 2 :
#       total_price = rental_duration * normal_rate
#     else :
#       total_price = (2 * normal_rate) + ((rental_duration - 2) * pick_hour_rate)
#       print("Total price for the scooter rental:", total_price)
#     end
# end
