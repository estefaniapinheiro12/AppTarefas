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
    @State private var scaleEffect = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            Login()
        } else {
            ZStack {
                
                LinearGradient(
                    gradient: Gradient (colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                    
                )
                .ignoresSafeArea()
                
                VStack {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                        .scaleEffect(scaleEffect)
                        .opacity(opacity)
                        .onAppear{
                            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                                scaleEffect = 1.0
                                opacity = 1.0
                            }
                        }
                    
                    Text("Gerenciador de Tarefas")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                        .padding(.horizontal, 40)
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


