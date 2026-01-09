//
//  Request.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 07/01/26.
//

import Foundation

enum Request: RequestProtocol {
    case getHome
    case getLocalHost
    
    var path: String {
        switch self {
        case .getHome:
            return "\(baseURL)/home"
        case .getLocalHost:
            return baseURL
        }
    }
    
    var baseURL: String {
        return "http://localhost:3000"
    }
}
