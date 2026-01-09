//
//  ComponentSectionsViewState.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 09/01/26.
//

import Foundation

// MARK: - DefaultSectionsViewState

enum DefaultSectionsViewState {
    case content(ComponentSectionDataModel)
    case loading
    case error(DefaultUseCaseError)
}
