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
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
                .textInputAutocapitalization(.none)
                .disableAutocorrection(true)
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(10)
    }
}
