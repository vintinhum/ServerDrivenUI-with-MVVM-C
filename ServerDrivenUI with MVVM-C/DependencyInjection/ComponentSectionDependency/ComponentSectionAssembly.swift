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
        componentSectionControllerRegisters(container)
    }
    
    // MARK: - COMPONENT SECTION FACTORY
    
    private func componentSectionFactoryRegisters(_ container: Container) {
        container.register(ComponentSectionFactoryProtocol.self) { resolver in
            return ComponentSectionFactory(resolver: resolver)
        }
    }
    
    // MARK: - COMPONENT SECTION CONTROLLER
    
    private func componentSectionControllerRegisters(_ container: Container) {
        container.register(ComponentSectionController.self) { resolver in
            let sectionFactory = resolver.resolveUnwrapping(ComponentSectionFactoryProtocol.self)
            let sectionContainer = ComponentSectionContainer(sectionFactory: sectionFactory)
            return ComponentSectionController(container: sectionContainer)
        }
    }
}
