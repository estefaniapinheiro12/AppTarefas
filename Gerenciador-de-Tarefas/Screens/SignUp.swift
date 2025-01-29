import SwiftUI

 struct SignUp: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var errorMessage: String? =  nil
    @State private var isSignUpSuccessful = false
    
     var body: some View {
        NavigationView{
            ZStack{
                
                LinearGradient (
                    gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.7)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack(spacing: 20){
                    Text("TaskFlow")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                    
                    VStack(spacing: 20){
                        CustomTextField (
                            icon: "person.fill",
                            placeholder: "Digite seu nome de usuário",
                            text: $username
                        )
                        
                        CustomSecureField (
                            icon: "lock.fill",
                            placeholder: "Digite sua senha",
                            text: $password
                        )
                        
                        CustomSecureField (
                            icon: "lock.fill",
                            placeholder: "Confirme sua senha",
                            text: $confirmPassword
                        )
                    }
                    
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 30)
                    
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .padding(.top, -10)
                    }
                    
                    Spacer()
                    
                    Button(action: handleSignUp) {
                        Text("Cadastrar")
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient (
                                    gradient: Gradient(colors: [Color.green, Color.green.opacity(0.8)]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                    
                                )
                                
                            )
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                            .padding(.horizontal, 50)
                    }
                    .buttonStyle(ScaleButtonStyle())
                    
                    HStack(spacing: 5) {
                        Text("Já possui uma conta?")
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: Login()) {
                            Text("Faça login")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.blue.opacity(0.9))
                        }
                    }
                }
                .padding(.vertical, 50)
            }
            .alert(isPresented: $isSignUpSuccessful) {
                Alert(
                    title: Text("Cadastro realizado!"),
                    message: Text ("Sua conta foi criada com sucesso."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
    private func handleSignUp (){
        if username.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            errorMessage = "Por favor, preencha todos os campos."
        } else if password != confirmPassword {
            errorMessage = "As senhas não coincidem."
        } else if password.count < 6 {
            errorMessage = "A senha deve ter pelo menos 6 caracteres."
        }else {
            errorMessage = nil
            isSignUpSuccessful = true
        }
        
    }
    
}
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
                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(10)
    }
}

 struct CustomSecureField: View {
    var icon: String
    var placeholder: String
    @Binding var text: String
    
     var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            SecureField(placeholder, text: $text)
        }
        .padding()
        .background(Color.white.opacity(0.9))
        .cornerRadius(10)
    }
}

 struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeOut (duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    SignUp()
}
