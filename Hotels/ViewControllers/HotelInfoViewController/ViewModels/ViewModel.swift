//
//  ViewModel.swift
//  Hotels
//
//  Created by mac on 05.01.2024.
//

import UIKit

class ViewModel {
    
    var statusNameHotel = Dynamic("")
    var statusAdressHotel = Dynamic("")
    var statusMinimalPrice = Dynamic("")
    var statusPrice_for_it = Dynamic("")
    var statusDescription = Dynamic("")
    var statusURLs = Dynamic([""])
    var images = Dynamic([UIImage()])
    var statusPeculiarities = Dynamic([""])
    var statusNumberRating = Dynamic("")
    var statusConditionRating = Dynamic("")
    
    func data() {
        
        NetworkManager.shared.getFromAPI(url: R.Api.hotelInfoVC!, completion: { (currentData: HotelModel?)  in
            if let currentData = currentData {
                self.statusNameHotel.value = currentData.name
                self.statusAdressHotel.value = currentData.adress
                self.statusMinimalPrice.value = "\(currentData.minimalPrice)"
                self.statusPrice_for_it.value = currentData.priceForIt
                self.statusDescription.value = currentData.aboutTheHotel.description
                self.statusURLs.value = currentData.imageUrls
                self.statusPeculiarities.value = currentData.aboutTheHotel.peculiarities
                self.statusNumberRating.value = "\(currentData.rating)"
                self.statusConditionRating.value = currentData.ratingName
                self.getImages()
            } else { return }
        })
    }
    
    func getImages() {
        var urls = [URL]()
        for urlString in statusURLs.value {
            guard let url = URL(string: urlString) else { return }
            urls.append(url)
        }
        NetworkManager.shared.loadImages(urls: urls) { [weak self] values in
            guard let images = values else { return }
            self?.images.value = images
        }
    }
}
