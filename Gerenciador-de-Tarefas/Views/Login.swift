import SwiftUI

struct Login: View{
    @State private var usuario: String = ""
    @State private var password: String = ""
    
    var body: some View{
        NavigationView{
            ZStack{
                LinearGradient (
                    gradient: Gradient(colors: [Color(Color.blue.opacity(0.8)), Color.purple.opacity(0.7)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                
                
                VStack(spacing: 20){
                    Text("TaskFlow")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                    
                    
                    VStack(spacing: 20){
                        CustomTextField (
                            icon: "person.fill",
                            placeholder: "Digite seu usuário",
                            text: $usuario
                        )
                        
                        CustomSecureField (
                            icon: "lock.fill",
                            placeholder: "Digite sua senha",
                            text: $password
                        )
                    }
                    
                    .padding()
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(15)
                    .padding(.horizontal, 30)
                    
                    Spacer()
                    
                    NavigationLink(destination: Home()) {
                        Text("Entrar")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient (
                                gradient: Gradient(colors: [Color.green, Color.green.opacity(0.8)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            )
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x:0, y: 5)
                            .padding(.horizontal, 50)
                    }
                    .buttonStyle(ScaleButtonStyle())
                    
                    HStack (spacing: 5){
                        Text("Não possui conta?")
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: SignUp()) {
                            Text("Cadastre-se")
                                .fontWeight(.bold)
                                .foregroundColor(Color.blue.opacity(0.9))
                            
                        }
                    }
                    
                    .padding(.vertical, 50)
                    
                }
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
                    .textInputAutocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .disableAutocorrection(true)
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
                .scaleEffect(configuration.isPressed ? 0.95: 1.0)
                .animation (.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
}
#Preview {
    Login()
}

