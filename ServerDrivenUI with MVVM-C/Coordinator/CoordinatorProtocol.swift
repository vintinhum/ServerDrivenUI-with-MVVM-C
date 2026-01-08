//
//  CoordinatorProtocol.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 07/01/26.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController? { get set }
    
    func start()
}
