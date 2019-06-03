//
//  NetworkService.swift
//  RestaurantApp
//
//  Created by Julian Llorensi on 28/05/2019.
//  Copyright © 2019 globant. All rights reserved.
//

import Foundation
import Moya

private let apiKey = "96u33KmBWhXQkRyvH_I9WsEFPWSWS2DXVX-bJiwOqchyFjoLKAglHvOB3j-y_sLVS1ZnssLnlj6711oonm94N3pyZk76KRmhxUhAwUvDclqRtluJvA7GnLNQQRjwXHYx"

enum YelpService {
    enum BusinessesProvider: TargetType {
        case search(lat: Double, long: Double)
        case details(id: String)
        
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }
        
        var path: String {
            switch self {
            case .search:
                return "/search"
            case let .details(id):
                return "/\(id)"
            }
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            switch self {
            case let .search(lat, long):
                return .requestParameters(parameters: ["latitude" : lat, "longitude" : long, "limit" : 5], encoding: URLEncoding.queryString)
            case .details:
                return .requestPlain
            }
        }
        
        var headers: [String : String]? {
            return ["Authorization" : "Bearer \(apiKey)"]
        }
    }
}
