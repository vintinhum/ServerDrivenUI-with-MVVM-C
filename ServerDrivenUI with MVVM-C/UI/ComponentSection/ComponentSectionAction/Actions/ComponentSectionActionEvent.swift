//
//  ComponentSectionActionEvent.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 19/01/26.
//

import Foundation

struct ComponentSectionActionEvent: ComponentSectionActionProtocol, Codable {
    let type: String
    let eventType: EventType
    
    init(type: String = ComponentSectionAction.event.rawValue,
         eventType: EventType) {
        self.type = type
        self.eventType = eventType
    }
    
    enum CodingKeys: String, CodingKey {
        case type = "actionType"
        case eventType = "event"
    }
}

extension ComponentSectionActionEvent {
    enum EventType: String, Codable {
        case reload = "RELOAD"
    }
}
