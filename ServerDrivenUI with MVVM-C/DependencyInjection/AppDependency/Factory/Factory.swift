//
//  Factory.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 07/01/26.
//

import Foundation
import Swinject

class Factory: FactoryProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let resolver: Resolver
    
    // MARK: - INITIALIZERS
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    // MARK: - PRIVATE METHODS
    
    private func makeSectionContainer() -> ComponentSectionContainerProtocol {
        let sectionFactory = resolver.resolveUnwrapping(ComponentSectionFactoryProtocol.self)
        return ComponentSectionContainer(sectionFactory: sectionFactory)
    }
    
    // MARK: - HomeViewController
    
    func makeHomeViewController() -> HomeViewController {
        let retrieveHomeUseCase = resolver.resolveUnwrapping(RetrieveHomeUseCaseProtocol.self)
        let viewModel = HomeViewModel(retrieveHomeUseCase: retrieveHomeUseCase)
        return HomeViewController(viewModel: viewModel,
                                  sectionContainer: makeSectionContainer())
    }
}
