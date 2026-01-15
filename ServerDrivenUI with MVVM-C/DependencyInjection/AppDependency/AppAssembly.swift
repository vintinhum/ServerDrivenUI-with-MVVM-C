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
        factoryRegisters(container)
        coordinatorRegisters(container)
        serviceRegisters(container)
        
        retrieveHomeUseCaseRegisters(container)
    }
    
    // MARK: - FACTORY
    
    private func factoryRegisters(_ container: Container) {
        container.register(FactoryProtocol.self) { resolver in
            return Factory(resolver: resolver)
        }
    }
    
    // MARK: - COORDINATOR
    
    private func coordinatorRegisters(_ container: Container) {
        container.register(CoordinatorProtocol.self) { (resolver, navigationController: UINavigationController) in
            let factory = resolver.resolveUnwrapping(FactoryProtocol.self)
            return Coordinator(navigationController: navigationController,
                               factory: factory)
        }
    }
    
    // MARK: - SERVICE
    
    private func serviceRegisters(_ container: Container) {
        container.register(ServiceProtocol.self) { _ in
            return Service()
        }
    }
    
    // MARK: - USE CASES
    
    private func retrieveHomeUseCaseRegisters(_ container: Container) {
        container.register(RetrieveHomeUseCaseProtocol.self) { resolver in
            let service = resolver.resolveUnwrapping(ServiceProtocol.self)
            let sectionFactory = resolver.resolveUnwrapping(ComponentSectionFactoryProtocol.self)
            return RetrieveHomeUseCase(service: service,
                                       sectionFactory: sectionFactory)
        }
    }
}
