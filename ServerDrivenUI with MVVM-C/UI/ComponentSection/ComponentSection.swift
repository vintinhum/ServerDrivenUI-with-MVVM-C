//
//  ComponentSection.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation

struct ComponentSectionModel {
    let section: ComponentSectionProtocol
}

struct ComponentSectionDataModel {
    let sections: [ComponentSectionModel]
}

struct ComponentSectionResponseModel: Codable {
    let sections: [ComponentSectionCodable]
    
    enum CodingKeys: String, CodingKey {
        case sections
    }
}

enum DefaultComponentSection: ComponentSectionProtocol {
    case buttonSection(section: ButtonComponentSection)
    case separatorSection(section: SeparatorComponentSection)
    case imageShowcaseSection(section: ImageShowcaseComponentSection)
    
    var identifier: String {
        switch self {
        case .buttonSection(let section):
            return section.identifier
        case .separatorSection(let section):
            return section.identifier
        case .imageShowcaseSection(let section):
            return section.identifier
        }
    }
}

enum ComponentSection: String, Codable {
    case buttonSection = "BUTTON_SECTION"
    case separatorSection = "SEPARATOR_SECTION"
    case imageShowcaseSection = "IMAGE_SHOWCASE_SECTION"
}
