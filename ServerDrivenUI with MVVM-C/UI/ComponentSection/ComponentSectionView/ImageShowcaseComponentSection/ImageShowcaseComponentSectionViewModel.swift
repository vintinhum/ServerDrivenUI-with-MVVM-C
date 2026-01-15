//
//  ImageShowcaseComponentSectionViewModel.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 12/01/26.
//

import Foundation

class ImageShowcaseComponentSectionViewModel {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let section: ImageShowcaseComponentSection
    
    // MARK: - INITIALIZERS
    
    init(section: ImageShowcaseComponentSection) {
        self.section = section
    }
    
    // MARK: - PUBLIC METHODS
    
    func getSection() -> ImageShowcaseComponentSection {
        return section
    }
}
