//
//  EndPointType.swift
//  CultureEventApp_IST
//
//  Created by Mehdican Büyükplevne on 26.05.2023.
//


import Foundation

enum HTTPMethods: String {
    case get = "GET"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
}
