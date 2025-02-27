import SwiftUI

struct SignUp: View {
    @State private var usuario: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String? = nil
    @State private var isRegistered = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.7)]),
                startPoint: .top, endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Criar Conta")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                
                VStack(spacing: 20) {
                    CustomTextField(icon: "person.fill", placeholder: "Digite seu usuário", text: $usuario)
                    CustomSecureField(icon: "lock.fill", placeholder: "Digite sua senha", text: $password)
                    CustomSecureField(icon: "lock.fill", placeholder: "Confirme sua senha", text: $confirmPassword)
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
                
                Button(action: handleSignUp) {
                    Text("Cadastrar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 50)
                
                HStack(spacing: 5) {
                    Text("Já tem uma conta?").foregroundColor(.white)
                    NavigationLink(destination: Login()) {
                        Text("Entrar").fontWeight(.bold).foregroundColor(Color.blue.opacity(0.9))
                    }
                }
                .padding(.vertical, 50)
            }
            .background(
                NavigationLink(destination: Login(), isActive: $isRegistered) {
                    EmptyView()
                }
                .hidden()
            )
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func handleSignUp() {
        guard !usuario.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            errorMessage = "Preencha todos os campos."
            return
        }
        
        guard password == confirmPassword else {
            errorMessage = "As senhas não coincidem."
            return
        }
        
        UserDefaults.standard.set(usuario, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        
        isRegistered = true
    }
}
