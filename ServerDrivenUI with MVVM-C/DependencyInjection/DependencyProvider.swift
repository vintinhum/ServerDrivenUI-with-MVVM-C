//
//  DependencyProvider.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 07/01/26.
//

import Foundation
import Swinject

public class DependencyProvider {
    public let container = Container()
    public let assembler: Assembler
    
    public init() {
        assembler = Assembler([AppAssembly()],
                              container: container)
    }
    
    public func add(_ assemblies: [Assembly]) {
        assembler.apply(assemblies: assemblies)
    }
}
