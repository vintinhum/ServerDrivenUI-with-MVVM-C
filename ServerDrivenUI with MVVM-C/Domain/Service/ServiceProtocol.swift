//
//  ServiceProtocol.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 07/01/26.
//

import Foundation

protocol ServiceProtocol {
    func getHome(request: Request,
                 completion: @escaping (Result<ComponentSectionResponseModel, ServiceError>) -> Void)
}
