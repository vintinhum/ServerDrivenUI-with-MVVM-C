//
//  ImageShowcaseComponentView.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 12/01/26.
//

import Foundation
import UIKit

protocol ImageShowcaseComponentViewDelegate: AnyObject {
    func didTapView(_ view: ImageShowcaseComponentView)
}

class ImageShowcaseComponentView: UIView {
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: ImageShowcaseComponentViewDelegate?
    
    // MARK: - UI
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var button: ButtonComponentView = {
        let button = ButtonComponentView()
        button.delegate = self
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - INITIALIZERS
    
    init () {
        super.init(frame: .zero)
        setupView()
        buildViewHierarchy()
        constraintUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - PRIVATE SETUP
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "image-placeholder")
    }
    
    private func buildViewHierarchy() {
        addSubview(contentStackView)
        contentStackView.addSubview(titleLabel)
        contentStackView.addSubview(imageView)
        contentStackView.addSubview(button)
    }
    
    private func constraintUI() {
        contentStackView.constraintToSuperView()
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 180),
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            imageView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            button.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: contentStackView.bottomAnchor)
        ])
    }
    
    // MARK: - SETUP
    
    func setup(with model: ImageShowcaseComponentSection) {
        titleLabel.text = model.title
        handleImage(with: model.image)
        button.setup(with: ButtonComponent(title: model.buttonTitle,
                                           image: "chevron.right"))
        if let type = model.buttonType {
            handleButtonType(with: type)
        }
    }
    
    // MARK: - PRIVATE METHODS
    
    private func handleImage(with imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        imageView.load(url: url)
    }
    
    private func handleButtonType(with type: ImageShowcaseComponentSection.ButtonType) {
        switch type {
        case .primary:
            button.setButtonType(for: .primary)
        case .secondary:
            button.setButtonType(for: .secondary)
        }
    }
    
    // MARK: - ACTIONS
    
    @objc private func didTapButton() {
        delegate?.didTapView(self)
    }
}

extension ImageShowcaseComponentView: ButtonComponentViewDelegate {
    func didTapButton(_ view: ButtonComponentView) {
        didTapButton()
    }
}
