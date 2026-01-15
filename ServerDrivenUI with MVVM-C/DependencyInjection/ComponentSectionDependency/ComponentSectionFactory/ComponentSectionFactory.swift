//
//  ComponentSectionFactory.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation
import Swinject

class ComponentSectionFactory: ComponentSectionFactoryProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let resolver: Resolver
    
    // MARK: - INITIALIZERS
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    // MARK: - PUBLIC METHODS
    
    func makeSectionView(for section: ComponentSectionProtocol) -> ComponentSectionViewProtocol? {
        switch section.identifier {
        // Add a new case for each section to be developed.
        case ComponentSection.imageShowcaseSection.rawValue:
            return makeImageShowcaseSection(section)
        default:
            return nil
        }
    }
    
    func makeSectionModels(with model: ComponentSectionResponseModel) -> ComponentSectionDataModel {
        var sectionModels: [ComponentSectionModel] = []
        
        for section in model.sections {
            if let sectionModel = makeSectionModel(for: section) {
                sectionModels.append(sectionModel)
            }
        }
        return .init(sections: sectionModels)
    }
    
    // MARK: - PRIVATE METHODS
    
    private func makeSectionModel(for section: ComponentSectionCodable) -> ComponentSectionModel? {
        // This method will contain an 'if let' chain cyclying through all section components cases existing, making section models for each one.
        if let section: ImageShowcaseComponentSection = section.decodeAnyCodable(),
           section.identifier == ComponentSection.imageShowcaseSection.rawValue {
            return makeImageShowcaseSectionModel(section)
        }
        return nil
    }
    
    private func decodeSectionIdentifier(for section: ComponentSectionCodable) -> String? {
        if let identifierKey = section["sectionType"],
           let identifierValue = identifierKey.value as? String {
            return identifierValue
        }
        return nil
    }
    
    // MARK: - ImageShowcaseComponentSection
    
    private func makeImageShowcaseSectionModel(_ section: ImageShowcaseComponentSection) -> ComponentSectionModel? {
        return .init(section: DefaultComponentSection.imageShowcaseSection(section: section))
    }
    
    private func makeImageShowcaseSection(_ section: ComponentSectionProtocol) -> ImageShowcaseComponentSectionView? {
        if case DefaultComponentSection.imageShowcaseSection(let section) = section {
            return resolver.resolveUnwrapping(ImageShowcaseComponentSectionView.self, argument: section)
        }
        return nil
    }
}
