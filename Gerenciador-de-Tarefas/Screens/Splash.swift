//
//  Splash.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 20/12/24.
//

import Foundation
import SwiftUI

struct Splash: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            Login()
        }else {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.blue)
                    
                    Text("Gerenciador de Tarefas")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline:.now() + 5 ){
                    withAnimation{
                        isActive = true
                    }
                    
                }
            }
        }
    }
}

#Preview {
    Splash()
}
