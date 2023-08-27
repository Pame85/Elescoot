# Clock-in time
clock_in_time = Time.new(2022, 1, 1, 9, 0, 0)
# print => => 2022-01-01 09:00:00 +0800

# Clock-out time
clock_out_time = Time.new(2022, 1, 1, 17, 30, 0)
# print => 2022-01-01 17:30:00 +0800

# Calculate elapsed time
elapsed_time = clock_out_time - clock_in_time

# Convert elapsed time to hours and minutes
hours = elapsed_time / 3600
minutes = (elapsed_time % 3600) / 60

# Display elapsed time
puts "Elapsed time: #{hours} hours #{minutes} minutes"