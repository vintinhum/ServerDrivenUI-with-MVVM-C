//
//  SeparatorComponentSectionView.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 15/01/26.
//

import Foundation
import UIKit

class SeparatorComponentSectionView: UIView, ComponentSectionViewProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let viewModel: SeparatorComponentSectionViewModel
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: ComponentSectionControllerDelegate?
    
    // MARK: - UI
    
    private lazy var separatorView: SeparatorComponentView = {
        let view = SeparatorComponentView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - INITIALIZERS
    
    init(viewModel: SeparatorComponentSectionViewModel) {
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
        let style = viewModel.getSection().style
        let size = viewModel.getSize()
        separatorView.setStyle(with: style)
        separatorView.setSize(for: size)
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(separatorView)
    }
    
    private func constraintUI() {
        separatorView.constraintToSuperView()
    }
}

extension SeparatorComponentSectionView: SeparatorComponentViewDelegate { }
