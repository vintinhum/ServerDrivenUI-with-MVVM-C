//
//  ComponentSectionContainerProtocol.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation
import UIKit

protocol ComponentSectionContainerProtocol: UITableView {
    var sectionFactory: ComponentSectionFactoryProtocol { get }
    
    func updateSections(with sections: [ComponentSectionModel], forceReload: Bool)
    func loading()
    func removeSections()
}
