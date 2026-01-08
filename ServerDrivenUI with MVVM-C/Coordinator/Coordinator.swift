//
//  Coordinator.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 07/01/26.
//

import Foundation
import UIKit

class Coordinator: CoordinatorProtocol {
    
    // MARK: - PROPERTIES
    
    var navigationController: UINavigationController?
    let factory: FactoryProtocol
    
    // MARK: - INITIALIZERS
    
    init(navigationController: UINavigationController,
         factory: FactoryProtocol) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    // MARK: - PUBLIC METHODS
    
    func start() { }
}
