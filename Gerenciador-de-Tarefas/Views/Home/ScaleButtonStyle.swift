//
//  ScaleButtonStyle.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 23/02/25.
//

import Foundation
import SwiftUI

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(), value: configuration.isPressed)
    }
}
