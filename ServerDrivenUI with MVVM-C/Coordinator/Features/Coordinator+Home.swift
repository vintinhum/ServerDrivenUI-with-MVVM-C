//
//  Coordinator+Home.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 09/01/26.
//

import UIKit

extension Coordinator {
    func goToHome(animated: Bool) {
        let viewController = factory.makeHomeViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: animated)
    }
}

extension Coordinator: HomeViewControllerDelegate { }
