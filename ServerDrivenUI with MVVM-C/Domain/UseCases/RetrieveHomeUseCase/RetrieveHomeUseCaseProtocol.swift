//
//  RetrieveHomeUseCaseProtocol.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 09/01/26.
//

import RxSwift

protocol RetrieveHomeUseCaseProtocol {
    func execute() -> Observable<Result<ComponentSectionDataModel, DefaultUseCaseError>>
}
