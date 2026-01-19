//
//  ComponentSectionControllerDelegate.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation

protocol ComponentSectionControllerDelegate: AnyObject {
    func sectionController(_ section: ComponentSectionViewProtocol, didSelectWith action: ComponentSectionActionProtocol)
}

extension ComponentSectionControllerDelegate {
    func sectionController(_ section: ComponentSectionViewProtocol, didSelectWith action: ComponentSectionActionProtocol) { }
}
