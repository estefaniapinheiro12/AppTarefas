import SwiftUI

struct Card: View {
    var title: String
    var color: Color
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    NavigationLink(destination: EditReminder()){
                        Image(systemName: "pencil")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 300)
            }
            .padding()
            .background(color)
            .cornerRadius(15)
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    Card(
        title: "Title",
        color: Color(hex: "C81B1B")
    )
}
