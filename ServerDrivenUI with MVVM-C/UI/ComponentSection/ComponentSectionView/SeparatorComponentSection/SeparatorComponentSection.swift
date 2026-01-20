//
//  SeparatorComponentSection.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 15/01/26.
//

import Foundation

struct SeparatorComponentSection: ComponentSectionProtocol, Codable {
    let identifier: String
    let style: SeparatorStyle?
    let size: SeparatorSize?
    
    init(identifier: String = ComponentSection.separatorSection.rawValue,
         style: SeparatorStyle? = .empty,
         size: SeparatorSize? = .medium) {
        self.identifier = identifier
        self.style = style
        self.size = size
    }
    
    enum CodingKeys: String, CodingKey {
        case identifier = "sectionType"
        case style
        case size
    }
}

extension SeparatorComponentSection {
    enum SeparatorStyle: String, Codable {
        case empty = "EMPTY"
        case line = "LINE"
    }
    
    enum SeparatorSize: String, Codable {
        case tiny = "TINY"
        case small = "SMALL"
        case medium = "MEDIUM"
        case big = "BIG"
        case large = "LARGE"
    }
}
