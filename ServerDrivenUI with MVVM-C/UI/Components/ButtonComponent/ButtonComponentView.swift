//
//  ButtonComponentView.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 13/01/26.
//

import Foundation
import UIKit

protocol ButtonComponentViewDelegate: AnyObject {
    func didTapButton(_ view: ButtonComponentView)
}

class ButtonComponentView: UIView {
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: ButtonComponentViewDelegate?
    
    // MARK: - UI
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.layer.cornerRadius = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - INITIALIZERS
    
    init() {
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
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        addGestureRecognizer(tap)
    }
    
    private func buildViewHierarchy() {
        addSubview(contentStackView)
        contentStackView.addSubview(titleLabel)
        contentStackView.addSubview(imageView)
    }
    
    private func constraintUI() {
        contentStackView.constraintToSuperView()
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentStackView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 24),
            titleLabel.bottomAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: -12),
            
            imageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            imageView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: -24)
        ])
    }
    
    // MARK: - PUBLIC SETUP
    
    func setup(with model: ButtonComponent) {
        if let title = model.title {
            titleLabel.text = title
        }
        if let imageName = model.image {
            handleImage(with: imageName)
        }
        if let type = model.type {
            setButtonType(for: type)
        }
    }
    
    func setButtonType(for type: ButtonComponent.ButtonType) {
        switch type {
        case .primary:
            contentStackView.backgroundColor = .black
            titleLabel.textColor = .white
            imageView.tintColor = .white
        case .secondary:
            contentStackView.backgroundColor = .white
            contentStackView.layer.borderWidth = 1
            contentStackView.layer.borderColor = UIColor.black.cgColor
            titleLabel.textColor = .black
            imageView.tintColor = .black
        }
    }
    
    // MARK: - HANDLERS
    
    private func handleImage(with imageName: String) {
        guard let image = UIImage(systemName: imageName) else { return }
        imageView.image = image
        imageView.isHidden = false
    }
    
    // MARK: - ACTIONS
    
    @objc private func didTapView() {
        delegate?.didTapButton(self)
    }
}
