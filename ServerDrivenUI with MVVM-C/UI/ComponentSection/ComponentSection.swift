//
//  ComponentSection.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation

public typealias ComponentSectionCodable = [String: AnyCodable]

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
