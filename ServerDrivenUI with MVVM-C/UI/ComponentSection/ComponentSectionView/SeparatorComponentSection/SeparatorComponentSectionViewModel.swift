//
//  SeparatorComponentSectionViewModel.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 15/01/26.
//

import Foundation

class SeparatorComponentSectionViewModel {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let section: SeparatorComponentSection
    
    // MARK: - INITIALIZERS
    
    init(section: SeparatorComponentSection) {
        self.section = section
    }
    
    // MARK: - PUBLIC METHODS
    
    func getSection() -> SeparatorComponentSection {
        return section
    }
    
    func getSize() -> Double {
        switch section.size {
        case .tiny:
            return 0.5
        case .small:
            return 1
        case .medium:
            return 4
        case .big:
            return 8
        case .large:
            return 16
        case .none:
            return 0.5
        }
    }
}
