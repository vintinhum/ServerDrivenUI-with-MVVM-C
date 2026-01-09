//
//  ComponentSectionContainerCell.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 09/01/26.
//

import Foundation
import UIKit

final class ComponentSectionContainerCell: UITableViewCell {
    
    // MARK: - INITIALIZER
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SETUP
    
    func setup(with section: ComponentSectionViewProtocol) {
        resetSubviews()
        contentView.addSubview(section)
        section.constraintToSuperView(leading: 24, trailing: -24)
        layoutSubviews()
    }
    
    // MARK: - PRIVATE SETUP
    
    private func resetSubviews() {
        contentView.subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}
