//
//  Service.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 07/01/26.
//

import Foundation
import Alamofire

class Service: ServiceProtocol {
    
    // MARK: - PUBLIC METHODS
    
    func getHome(request: Request,
                 completion: @escaping (Result<ComponentSectionResponseModel, ServiceError>) -> Void) {
        handleRequest(with: request) { result in
            completion(result)
        }
    }
    
    // MARK: - PRIVATE METHODS
    
    private func handleRequest<T: Decodable>(with request: Request,
                                             completion: @escaping (Swift.Result<T, ServiceError>) -> Void) {
        guard let url = URL(string: request.path) else { return }
        AF.request(url).validate().responseJSON { data in
            do {
                if let data = data.data {
                    let response = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(response))
                }
            } catch {
                print("Error during JSON serialization: \(error)")
                completion(.failure(.raw(error)))
            }
        }
    }
}

enum ServiceError: Error {
    case raw(Error?)
    case empty
    case serialized(message: String?, errorCode: String? = nil, statusCode: Int? = nil)
}
