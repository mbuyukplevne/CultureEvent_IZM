//
//  EventEndPoint.swift
//  CultureEventApp_IST
//
//  Created by Mehdican Büyükplevne on 26.05.2023.
//
//https://openapi.izmir.bel.tr/api/ibb/kultursanat/etkinlikler

import Foundation

enum EventEndPoint {
   case getEvent
}
extension EventEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getEvent:
            return "api/ibb/kultursanat/etkinlikler"
        }
    }
    var baseURL: String {
        switch self {
        case .getEvent:
            return "https://openapi.izmir.bel.tr"
        }
    }
    var url: URL? {
        return URL(string: "\(baseURL)/\(path)")
    }
    var method: HTTPMethods {
        switch self {
        case .getEvent:
            return .get

        }
    }
}
