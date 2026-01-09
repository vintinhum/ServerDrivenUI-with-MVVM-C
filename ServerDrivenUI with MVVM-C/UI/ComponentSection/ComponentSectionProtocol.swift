//
//  ComponentSectionProtocol.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation

protocol ComponentSectionProtocol: Codable {
    var identifier: String { get }
}

extension ComponentSectionProtocol {
    var identifier: String {
        return self.identifier
    }
}
