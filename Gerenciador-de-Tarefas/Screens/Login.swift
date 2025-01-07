import SwiftUI

struct Login: View{
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View{
        NavigationView{
            ZStack{
                Color(hex: "EAB88C")
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack(spacing: 20){
                    Text("Lembretes App")
                        .font(.largeTitle)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                    VStack(spacing: 20){
                        
                        
                        VStack(alignment: .leading, spacing: 15){
                            Text("Email: ")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            TextField("Digite seu email: ", text: $email)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                        }
                        VStack(alignment: .leading, spacing: 15){
                            Text("Senha: ")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            SecureField("Digite sua senha: ", text: $password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                        }
                        
                        HStack{
                            Spacer()
                            Text("Não possui conta ?")
                                .font(.subheadline)
                                .foregroundColor(.white)
                            
                            NavigationLink(destination: SignUp()){
                                Text("Cadastre-se")
                                    .font(.subheadline)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            }
                        }
                    }
                    .padding()
                    .background(Color(hex: "D0A580"))
                    .cornerRadius(15)
                    .padding(.horizontal, 30)
                    
                    NavigationLink(destination: Home()){
                        Text("Entrar")
                            .font(.headline)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal, 50)
                }
            }
        }
    }
}

#Preview {
    Login()
}
