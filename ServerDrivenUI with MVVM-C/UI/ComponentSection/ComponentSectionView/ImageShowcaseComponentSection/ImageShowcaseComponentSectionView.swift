//
//  ImageShowcaseComponentSectionView.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 12/01/26.
//

import Foundation
import UIKit

class ImageShowcaseComponentSectionView: UIView, ComponentSectionViewProtocol {
    
    // MARK: - PRIVATE PROPERTIES
    
    private let viewModel: ImageShowcaseComponentSectionViewModel
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: ComponentSectionControllerDelegate?
    
    // MARK: - UI
    
    private lazy var imageShowcaseView: ImageShowcaseComponentView = {
        let view = ImageShowcaseComponentView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - INITIALIZERS
    
    init(viewModel: ImageShowcaseComponentSectionViewModel) {
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
        imageShowcaseView.setup(with: model)
    }
    
    private func buildViewHierarchy() {
        contentView.addSubview(imageShowcaseView)
    }
    
    private func constraintUI() {
        imageShowcaseView.constraintToSuperView()
    }
}

extension ImageShowcaseComponentSectionView: ImageShowcaseComponentViewDelegate {
    func didTapView(_ view: ImageShowcaseComponentView) {
        delegate?.sectionController(self, didSelect: ())
    }
}
