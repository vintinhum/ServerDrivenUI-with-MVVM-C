//
//  RetrieveHomeUseCase.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 09/01/26.
//

import RxSwift

class RetrieveHomeUseCase {
    
    // MARK: - ALIASES
    
    typealias UseCaseEventType = Result<ComponentSectionDataModel, DefaultUseCaseError>
    typealias ServiceResultReturningType = Result<ComponentSectionResponseModel, ServiceError>
    
    // MARK: - PRIVATE PROPERTIES
    
    private let service: ServiceProtocol
    private let sectionFactory: ComponentSectionFactoryProtocol
    
    // MARK: - INITIALIZERS
    
    init(service: ServiceProtocol,
         sectionFactory: ComponentSectionFactoryProtocol) {
        self.service = service
        self.sectionFactory = sectionFactory
    }
}

extension RetrieveHomeUseCase: RetrieveHomeUseCaseProtocol {
    
    // MARK: - PUBLIC METHODS
    
    func execute() -> Observable<Result<ComponentSectionDataModel, DefaultUseCaseError>> {
        request()
            .flatMap { [unowned self] in self.handleResult($0) }
            .catch { [unowned self] in handleError($0) }
    }
    
    // MARK: - PRIVATE METHODS
    
    private func request() -> Observable<ServiceResultReturningType> {
        return Observable.create { [weak self] observer in
            self?.service.getHome(request: .getHome) { serviceResult in
                observer.onNext(serviceResult)
                observer.onCompleted()
            }
            return Disposables.create()
        }
    }
    
    // MARK: - HANDLERS
    
    private func handleResult(_ serviceResult: ServiceResultReturningType) -> Observable<UseCaseEventType> {
        switch serviceResult {
        case .success(let data):
            let sections = sectionFactory.makeSectionModels(with: data)
            return Observable.just(.success(sections))
        case .failure(let error):
            return Observable.error(error)
        }
    }
    
    private func handleError(_ error: Error) -> Observable<UseCaseEventType> {
        if let serviceError = error as? ServiceError {
            return Observable.just(.failure(.message(serviceError)))
        }
        return Observable.just(.failure(.message(error)))
    }
}
