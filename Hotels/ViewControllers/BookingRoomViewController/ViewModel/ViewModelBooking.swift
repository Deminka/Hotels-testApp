//
//  ViewModelBooking.swift
//  Hotels
//
//  Created by mac on 10.01.2024.
//

import UIKit

class ViewModelBooking {
    
    var array = Dynamic(BookingModel(id: 0, hotelName: "", hotelAdress: "", horating: 0, ratingName: "", departure: "", arrivalCountry: "", tourDateStart: "", tourDateStop: "", numberOfNights: 0, room: "", nutrition: "", tourPrice: 0, fuelCharge: 0, serviceCharge: 0))
    
    func data() {
        
        NetworkManager.shared.getFromAPI(url: R.Api.bookingRoomVC!, completion: { (currentData: BookingModel?)  in
            if let currentData = currentData {
                self.array.value = currentData
            } else { return }
        })
    }
}

