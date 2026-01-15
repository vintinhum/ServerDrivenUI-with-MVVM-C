//
//  ImageShowcaseComponentSection.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 12/01/26.
//

import Foundation
import UIKit

struct ImageShowcaseComponentSection: ComponentSectionProtocol, Codable {
    let identifier: String
    let title: String
    let image: String
    let buttonTitle: String
    let buttonType: ButtonType?
    
    init(identifier: String = ComponentSection.imageShowcaseSection.rawValue,
         title: String,
         image: String,
         buttonTitle: String,
         buttonType: ButtonType? = .primary) {
        self.identifier = identifier
        self.title = title
        self.image = image
        self.buttonTitle = buttonTitle
        self.buttonType = buttonType
    }
    
    enum CodingKeys: String, CodingKey {
        case identifier = "sectionType"
        case title
        case image = "imageUrl"
        case buttonTitle
        case buttonType
    }
}

extension ImageShowcaseComponentSection {
    enum ButtonType: String, Codable {
        case primary = "PRIMARY"
        case secondary = "SECONDARY"
    }
}
