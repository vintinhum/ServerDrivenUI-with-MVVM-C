//
//  ButtonComponentSection.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 15/01/26.
//

import Foundation

struct ButtonComponentSection: ComponentSectionProtocol, Codable {
    let identifier: String
    let title: String?
    let image: COREImage?
    let type: ButtonType?
    var action: ComponentSectionActionCodable?
    
    init(identifier: String = ComponentSection.buttonSection.rawValue,
         title: String? = nil,
         image: COREImage? = nil,
         type: ButtonType? = .primary,
         action: ComponentSectionActionCodable? = nil) {
        self.identifier = identifier
        self.title = title
        self.image = image
        self.type = type
        self.action = action
    }
    
    enum CodingKeys: String, CodingKey {
        case identifier = "sectionType"
        case title
        case image
        case type
        case action
    }
}

extension ButtonComponentSection{
    enum ButtonType: String, Codable {
        case primary = "PRIMARY"
        case secondary = "SECONDARY"
    }
}
