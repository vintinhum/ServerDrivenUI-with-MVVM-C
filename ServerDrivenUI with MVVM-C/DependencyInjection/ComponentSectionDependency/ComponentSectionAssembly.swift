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
        buttonSectionRegisters(container)
        imageShowcaseSectionRegisters(container)
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
    
    // MARK: - BUTTON SECTION
    
    private func buttonSectionRegisters(_ container: Container) {
        container.register(ButtonComponentSectionViewModel.self) { (_, section: ButtonComponentSection) in
            return ButtonComponentSectionViewModel(section: section)
        }
        
        container.register(ButtonComponentSectionView.self) { (resolver, section: ButtonComponentSection) in
            let viewModel = resolver.resolveUnwrapping(ButtonComponentSectionViewModel.self, argument: section)
            return ButtonComponentSectionView(viewModel: viewModel)
        }
    }
    
    // MARK: - IMAGE SHOWCASE SECTION
    
    private func imageShowcaseSectionRegisters(_ container: Container) {
        container.register(ImageShowcaseComponentSectionViewModel.self) { (_, section: ImageShowcaseComponentSection) in
            return ImageShowcaseComponentSectionViewModel(section: section)
        }
        
        container.register(ImageShowcaseComponentSectionView.self) { (resolver, section: ImageShowcaseComponentSection) in
            let viewModel = resolver.resolveUnwrapping(ImageShowcaseComponentSectionViewModel.self, argument: section)
            return ImageShowcaseComponentSectionView(viewModel: viewModel)
        }
    }
}
