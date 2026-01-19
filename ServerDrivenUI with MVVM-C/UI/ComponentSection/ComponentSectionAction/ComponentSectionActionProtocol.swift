//
//  ComponentSectionActionProtocol.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 19/01/26.
//

import Foundation

public protocol ComponentSectionActionProtocol {
    var type: String { get }
}

extension ComponentSectionActionProtocol {
    var type: String {
        return self.type
    }
}
