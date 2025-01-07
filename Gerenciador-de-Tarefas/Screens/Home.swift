import SwiftUI

struct Home: View {
    @State private var dentroDoPrazo: [String] = []
    @State private var expirados: [String] = []
    

    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40) {
                    SectionView(
                        title: "Dentro do prazo",
                        taskList: $dentroDoPrazo
                    )
                    
                    SectionView(
                        title: "Expirados",
                        taskList: $expirados
                    )
                }
                .padding()
                
                NavigationLink(destination: CreateReminder()) {
                    Text("Criar Nova Tarefa")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .navigationBarTitle("Home", displayMode: .inline)
        }
    }
    
    struct SectionView: View {
        var title: String
        @Binding var taskList: [String]
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .padding(.top, 20)
                
                VStack(alignment: .leading) {
                    ForEach(Array(taskList.enumerated()), id: \.offset) { index, task in
                        HStack {
                            Text(task)
                                .padding(.vertical, 5)
                                .font(.body)
                            
                            Spacer()
                            
                            NavigationLink(destination: EditReminder()){
                                Image(systemName: "pencil")
                                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                
                                Button(action: {
                                    taskList.remove(at: index)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        
                        if taskList.isEmpty {
                            Text("Nenhuma tarefa adicionada")
                                .italic()
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.bottom, 20)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }
        }
    }
    
}
#Preview {
    Home( )
}
