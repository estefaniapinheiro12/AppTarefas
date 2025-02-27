//
//  Splash.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 20/12/24.
//


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
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack {
                    AppLogo()
                        .scaleEffect(scaleEffect)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
                                scaleEffect = 1.0
                                opacity = 1.0
                            }
                        }
                    
                    Text("Task Flow")
                        .font(.title2.bold())
                        .foregroundColor(.white.opacity(0.9))
                        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 2)
                        .padding(.top, 12)
                        .opacity(opacity)
                        .offset(y: 5)
                        .animation(.easeInOut(duration: 1.5), value: opacity)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isActive = true
                    }
                }
            }
        }
    }
}

// Logo do aplicativo
struct AppLogo: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 120, height: 120)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
            
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 70, height: 70)
                .foregroundColor(.white)
                .shadow(radius: 2)
        }
        .navigationBarBackButtonHidden(true)
    }
    
}
struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
