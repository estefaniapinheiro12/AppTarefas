//
//  CustomTextField.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 23/02/25.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
            TextField(placeholder, text: $text)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
                .foregroundColor(.white)
                .autocapitalization(.none)
        }
        .padding(.horizontal, 10)
        .frame(height: 50)
    }
}
