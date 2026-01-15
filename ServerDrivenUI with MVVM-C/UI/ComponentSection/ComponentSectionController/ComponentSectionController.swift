//
//  ComponentSectionController.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation
import UIKit

class ComponentSectionController: UIViewController, ComponentSectionControllerDelegate {
    
    // MARK: - PUBLIC PROPERTIES
    
    let container: ComponentSectionContainerProtocol
    weak var selfDelegate: ComponentSectionControllerDelegate?
    
    // MARK: - INITIALIZERS
    
    init(container: ComponentSectionContainerProtocol) {
        self.container = container
        super.init(nibName: nil, bundle: nil)
        setupView()
        buildViewHierarchy()
        constraintUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private lazy var sectionContainer: ComponentSectionContainerProtocol = {
        let container = container
        container.containerDelegate = self
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    // MARK: - PRIVATE SETUP
    
    private func setupView() {
        view.backgroundColor = .clear
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func buildViewHierarchy() {
        view.addSubview(sectionContainer)
    }
    
    private func constraintUI() {
        sectionContainer.constraintToSuperView()
    }
    
    // MARK: - PUBLIC METHODS
    
    open func sectionController(_ section: ComponentSectionViewProtocol, didSelect: ()) { }
}
