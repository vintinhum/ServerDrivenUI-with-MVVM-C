//
//  ButtonComponent.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 14/01/26.
//

import Foundation
import UIKit

struct ButtonComponent {
    let title: String?
    let image: String?
    let type: ButtonType?
    
    init(title: String? = nil,
         image: String? = nil,
         type: ButtonType? = .primary) {
        self.title = title
        self.image = image
        self.type = type
    }
}

extension ButtonComponent {
    enum ButtonType {
        case primary
        case secondary
    }
}
