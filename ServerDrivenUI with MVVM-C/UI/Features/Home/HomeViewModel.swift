//
//  HomeViewModel.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 09/01/26.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    // MARK: - PUBLIC PROPERTIES
    
    var viewStateObserver: BehaviorSubject<DefaultSectionsViewState> = .init(value: .loading)
    
    // MARK: - PRIVATE PROPERTIES
    
    private let disposeBag = DisposeBag()
    private let retrieveHomeUseCase: RetrieveHomeUseCaseProtocol
    
    // MARK: - INITIALIZERS
    
    init(retrieveHomeUseCase: RetrieveHomeUseCaseProtocol) {
        self.retrieveHomeUseCase = retrieveHomeUseCase
    }
    
    // MARK: - PUBLIC METHODS
    
    func retrieveSections() {
        retrieveHomeUseCase.execute().subscribeOnMainDisposed(by: disposeBag) { [weak self] in
            guard let self else { return }
            self.handleRetrieveSections($0)
        }
    }
    
    func reload() {
        viewStateObserver.onNext(.loading)
        retrieveSections()
    }
    
    // MARK: - HANDLERS
    
    private func handleRetrieveSections(_ result: Result<ComponentSectionDataModel, DefaultUseCaseError>) {
        switch result {
        case .success(let sections):
            viewStateObserver.onNext(.content(sections))
        case .failure(let error):
            viewStateObserver.onNext(.error(error))
        }
    }
}
