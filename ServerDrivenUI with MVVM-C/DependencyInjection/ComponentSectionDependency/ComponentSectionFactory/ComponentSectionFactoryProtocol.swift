//
//  ComponentSectionFactoryProtocol.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation

protocol ComponentSectionFactoryProtocol {
    func makeSectionView(for section: ComponentSectionProtocol) -> ComponentSectionViewProtocol?
    func makeSectionModels(with model: ComponentSectionResponseModel) -> ComponentSectionDataModel
}
