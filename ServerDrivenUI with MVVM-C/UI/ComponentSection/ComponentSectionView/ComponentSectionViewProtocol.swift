//
//  ComponentSectionViewProtocol.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 09/01/26.
//

import Foundation
import UIKit

protocol ComponentSectionViewProtocol: UIView {
    var delegate: ComponentSectionControllerDelegate? { get set }
    var contentView: UIView { get }
}

extension ComponentSectionViewProtocol {
    var contentView: UIView {
        return self
    }
}
