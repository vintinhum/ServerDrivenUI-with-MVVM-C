//
//  AppAssembly.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 07/01/26.
//

import Swinject
import UIKit

class AppAssembly: Assembly {
    func assemble(container: Container) {
        
        // MARK: - FACTORY
        
        container.register(FactoryProtocol.self) { resolver in
            return Factory(resolver: resolver)
        }
        
        // MARK: - COORDINATOR
        
        container.register(CoordinatorProtocol.self) { (resolver, navigationController: UINavigationController) in
            let factory = resolver.resolveUnwrapping(FactoryProtocol.self)
            return Coordinator(navigationController: navigationController,
                               factory: factory)
        }
        
        // MARK: - SERVICE
        
        container.register(ServiceProtocol.self) { _ in
            return Service()
        }
        
        // MARK: - USE CASES
        
        container.register(RetrieveHomeUseCaseProtocol.self) { resolver in
            let service = resolver.resolveUnwrapping(ServiceProtocol.self)
            let sectionFactory = resolver.resolveUnwrapping(ComponentSectionFactoryProtocol.self)
            return RetrieveHomeUseCase(service: service,
                                       sectionFactory: sectionFactory)
        }
    }
}
