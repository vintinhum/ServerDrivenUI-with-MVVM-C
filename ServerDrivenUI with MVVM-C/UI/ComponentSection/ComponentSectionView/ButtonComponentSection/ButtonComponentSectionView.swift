//
//  ButtonComponentSectionView.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 15/01/26.
//

import Foundation
import UIKit

class ButtonComponentSectionView: UIView, ComponentSectionViewProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let viewModel: ButtonComponentSectionViewModel
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: ComponentSectionControllerDelegate?
    
    // MARK: - UI
    
    private lazy var buttonView: ButtonComponentView = {
        let view = ButtonComponentView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - INITIALIZERS
    
    init(viewModel: ButtonComponentSectionViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
        setupComponents()
        buildViewHierarchy()
        constraintUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE SETUP
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupComponents() {
        let model = viewModel.getSection()
        buttonView.setup(with: model)
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(buttonView)
    }
    
    private func constraintUI() {
        buttonView.constraintToSuperView()
    }
}

extension ButtonComponentSectionView: ButtonComponentViewDelegate {
    func didTapView(_ view: ButtonComponentView) {
        guard let action = viewModel.getAction() else { return }
        delegate?.sectionController(self, didSelectWith: action)
    }
}
