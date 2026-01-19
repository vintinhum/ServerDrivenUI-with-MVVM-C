//
//  ComponentSectionAction.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 19/01/26.
//

import Foundation

public typealias ComponentSectionActionCodable = [String: AnyCodable]

enum DefaultComponentSectionAction: ComponentSectionActionProtocol {
    case event(action: ComponentSectionActionEvent)
    
    var type: String {
        switch self {
        case .event(let action):
            return action.type
        }
    }
}

enum ComponentSectionAction: String, Codable {
    case event = "EVENT"
}
