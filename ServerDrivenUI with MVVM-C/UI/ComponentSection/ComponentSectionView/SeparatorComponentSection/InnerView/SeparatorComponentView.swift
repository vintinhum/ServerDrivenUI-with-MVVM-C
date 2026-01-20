//
//  SeparatorComponentView.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 15/01/26.
//

import Foundation
import UIKit

protocol SeparatorComponentViewDelegate: AnyObject { }

class SeparatorComponentView: UIView {
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: SeparatorComponentViewDelegate?
    
    // MARK: - UI
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    }
    
    private func buildViewHierarchy() {
        addSubview(contentView)
        contentView.addSubview(separatorView)
    }
    
    private func constraintUI() {
        contentView.constraintToSuperView()
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
    // MARK: - SETUP
    
    func setStyle(with style: SeparatorComponentSection.SeparatorStyle?) {
        guard let style else { return }
        handleStyle(with: style)
    }
    
    func setSize(for size: Double) {
        separatorView.heightAnchor.constraint(equalToConstant: CGFloat(size)).isActive = true
    }
    
    // MARK: - PRIVATE METHODS
    
    private func handleStyle(with style: SeparatorComponentSection.SeparatorStyle) {
        switch style {
        case .empty:
            separatorView.backgroundColor = .clear
        case .line:
            separatorView.backgroundColor = .systemGray4
        }
    }
}
