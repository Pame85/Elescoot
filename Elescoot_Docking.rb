# def sccoter_docking
    # Asia City = 50
    # Centre Point = 50
    # Sembulan = 50
    # Segama = 50

    # total_spots = 50
    # rented_out_spots = 30
    # available_spots = total_spots - rented_out_spots

    # print("Docking Status:")
    # print("Total Spots:", total_spots)
    # print("Rented Out Spots:", rented_out_spots)
    # print("Available Spots:", available_spots)


    total_spots = 50
    stations = []
    
    # Create 5 stations with the same 50 docking spots
    for _ in range(5):
        station = {
            'total_spots': total_spots,
            'rented_out_spots': 0,
            'available_spots': total_spots
        }
        stations.append(station)
    
    # Display the docking status for each station
    for i, station in enumerate(stations, start=1):
        print("Docking Station", i, "Status:")
        print("Total Spots:", station['total_spots'])
        print("Rented Out Spots:", station['rented_out_spots'])
        print("Available Spots:", station['available_spots'])
        print()
    end
