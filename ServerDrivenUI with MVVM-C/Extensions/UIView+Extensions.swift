//
//  UIView+Extensions.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 08/01/26.
//

import Foundation
import UIKit

extension UIView {
    public func constraintToSuperView(top: CGFloat = 0,
                                      leading: CGFloat = 0,
                                      trailing: CGFloat = 0,
                                      bottom: CGFloat = 0) {
        guard let superview else { return }
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: top),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leading),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailing),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom)
        ])
    }
}
