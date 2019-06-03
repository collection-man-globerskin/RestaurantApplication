//
//  Models.swift
//  RestaurantApp
//
//  Created by Julian Llorensi on 30/05/2019.
//  Copyright © 2019 globant. All rights reserved.
//

import Foundation
import CoreLocation

//
// Root
//

struct Root: Codable {
    let businesses: [Business]
}

//
// Business
//

struct Business: Codable {
    let id: String
    let name: String
    let imageUrl: URL
    let distance: Double
}

//
// RestaurantListViewModel
//

struct RestaurantListViewModel {
    let name: String
    let imageUrl: URL
    let distance: Double
    let id: String
    
    static var numberFormatter: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        nf.minimumFractionDigits = 2
        return nf
    }
    
    var formattedDistance: String {
        return RestaurantListViewModel.numberFormatter.string(from: distance as NSNumber)!
    }
}

extension RestaurantListViewModel {
    init(business: Business) {
        self.name = business.name
        self.imageUrl = business.imageUrl
        self.distance = business.distance / 1609.344
        self.id = business.id
    }
}

//
// Details struct
//

struct Details: Decodable {
    let price: String
    let isClosed: Bool
    let rating: Double
    let name: String
    let photos: [URL]
    let coordinates: CLLocationCoordinate2D
}

extension CLLocationCoordinate2D: Decodable {
    enum CodingKeys: CodingKey {
        case latitude
        case longitude
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = container.decode(Double.self, forKey: .latitude)
        let longitude = container.decode(Double.self, forKey: .longitude)
        self.init(latitude: latitude, longitude: longitude)
    }
}
