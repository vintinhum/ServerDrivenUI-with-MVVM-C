//
//  ComponentSectionProtocol.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation

protocol ComponentSectionProtocol: Codable {
    var identifier: String { get }
    var action: ComponentSectionActionCodable? { get }
}

extension ComponentSectionProtocol {
    var identifier: String {
        return self.identifier
    }
    
    var action: ComponentSectionActionCodable? {
        return self.action
    }
    
    var _actionParse: ComponentSectionActionProtocol? {
        guard let action else { return nil }
        return action.decodeAction()
    }
}
