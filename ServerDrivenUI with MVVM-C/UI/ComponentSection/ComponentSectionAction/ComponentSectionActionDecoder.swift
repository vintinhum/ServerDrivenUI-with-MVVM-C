//
//  ComponentSectionActionDecoder.swift
//  ServerDrivenUI with MVVM-C
//
//  Created by Vítor Bárrios Luís de Albuquerque on 19/01/26.
//

import Foundation

extension Dictionary {
    public func decodeAction() -> ComponentSectionActionProtocol? {
        if let action: ComponentSectionActionEvent = self.decodeAnyCodable() {
            return action
        } else {
            return nil
        }
    }
}
