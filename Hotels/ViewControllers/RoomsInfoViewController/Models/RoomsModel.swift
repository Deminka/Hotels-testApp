//
//  Model.swift
//  Hotels
//
//  Created by mac on 08.01.2024.
//

import Foundation

// MARK: - HotelModel
struct RoomsModel: Codable {
    let rooms: [Room]
}

// MARK: - Room
struct Room: Codable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}
