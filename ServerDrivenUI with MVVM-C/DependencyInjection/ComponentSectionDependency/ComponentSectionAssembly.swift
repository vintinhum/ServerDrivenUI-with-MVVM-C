//
//  ComponentSectionAssembly.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation
import Swinject

class ComponentSectionAssembly: Assembly {
    func assemble(container: Container) {
        componentSectionFactoryRegisters(container)
    }
    
    // MARK: - COMPONENT SECTION FACTORY
    
    private func componentSectionFactoryRegisters(_ container: Container) {
        container.register(ComponentSectionFactoryProtocol.self) { resolver in
            return ComponentSectionFactory(resolver: resolver)
        }
    }
}
