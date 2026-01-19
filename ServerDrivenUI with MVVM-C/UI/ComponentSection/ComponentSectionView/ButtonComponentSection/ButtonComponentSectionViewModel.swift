//
//  ButtonComponentSectionViewModel.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 15/01/26.
//

import Foundation

class ButtonComponentSectionViewModel {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let section: ButtonComponentSection
    
    // MARK: - INITIALIZERS
    
    init(section: ButtonComponentSection) {
        self.section = section
    }
    
    // MARK: - PUBLIC METHODS
    
    func getSection() -> ButtonComponentSection {
        return section
    }
    
    func getAction() -> ComponentSectionActionProtocol? {
        return section._actionParse
    }
}
