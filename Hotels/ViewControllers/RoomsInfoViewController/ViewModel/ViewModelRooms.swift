//
//  ViewModelRooms.swift
//  Hotels
//
//  Created by mac on 05.01.2024.
//

import UIKit

class ViewModelRooms {
    
    var imageURLs = Dynamic([[""]])
    var array = Dynamic(RoomsModel(rooms: [Room(id: 0, name: "", price: 0, pricePer: "", peculiarities: [""], imageUrls: [""])]))
    var images = Dynamic([[UIImage()]])
    
    func data() {
        
        NetworkManager.shared.getFromAPI(url: R.Api.roomsInfoVC!, completion: { (currentData: RoomsModel?)  in
            if let currentData = currentData {
                self.array.value = currentData
                self.imageURLs.value = currentData.rooms.map {$0.imageUrls}
                self.getImagesFromArrays()
            } else { return }
        })
    }
    
    func getImagesFromArrays() {
        imageURLs.value.forEach { images in
            var urls = [URL]()
            for urlString in images {
                guard let url = URL(string: urlString) else { return }
                urls.append(url)
            }
            NetworkManager.shared.loadImages(urls: urls) { [weak self] values in
                guard let imagesArray = values else { return }
                self?.images.value.append(imagesArray)
            }
        }
    }
}
