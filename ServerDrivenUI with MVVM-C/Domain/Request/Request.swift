//
//  Request.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 07/01/26.
//

import Foundation

enum Request: RequestProtocol {
    case localHost
    
    var path: String {
        switch self {
        case .localHost:
            return baseURL
        }
    }
    
    var baseURL: String {
        return "http://localhost:3000"
    }
}
