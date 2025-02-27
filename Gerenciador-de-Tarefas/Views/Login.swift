import SwiftUI

struct Login: View {
    @State private var usuario: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String? = nil
    @State private var isAuthenticated = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.7)]),
                    startPoint: .top, endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("TaskFlow")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                    
                    VStack(spacing: 20) {
                        CustomTextField(icon: "person.fill", placeholder: "Digite seu usuário", text: $usuario)
                        CustomSecureField(icon: "lock.fill", placeholder: "Digite sua senha", text: $password)
                    }
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 30)
                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                    
                    Button(action: handleLogin) {
                        Text("Entrar")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 50)
                    
                    HStack(spacing: 5) {
                        Text("Não possui conta?").foregroundColor(.white)
                        NavigationLink(destination: SignUp()) {
                            Text("Cadastre-se").fontWeight(.bold).foregroundColor(Color.blue.opacity(0.9))
                        }
                    }
                    .padding(.vertical, 50)
                }
                .background(
                    NavigationLink(destination: Home(), isActive: $isAuthenticated) {
                        EmptyView()
                    }
                    .hidden()
                )
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private func handleLogin() {
        let savedUsername = UserDefaults.standard.string(forKey: "username")
        let savedPassword = UserDefaults.standard.string(forKey: "password")
        
        if usuario == savedUsername && password == savedPassword {
            isAuthenticated = true
        } else {
            errorMessage = "Usuário ou senha inválidos."
        }
    }
}
