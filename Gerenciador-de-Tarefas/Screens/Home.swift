import SwiftUI

struct Home: View {
    @State private var dentroDoPrazo: [String] = ["Estudar Swift", "Revisar código"]
    @State private var expirados: [String] = ["Enviar relatório", "Reunião atrasada"]
    @State private var selectedFilter: TaskFilter = .dentroDoPrazo
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Filtrar Tarefas", selection: $selectedFilter){
                    Text("Dentro do Prazo").tag(TaskFilter.dentroDoPrazo)
                    Text("Expirados").tag(TaskFilter.expirados)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10)
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 40) {
                            
                        if selectedFilter == .dentroDoPrazo {
                            SectionView(
                                title: "Dentro do Prazo",
                                taskList: $dentroDoPrazo
                            )
                        } else {
                            SectionView(
                                title: "Expirados",
                                taskList: $expirados
                            )
                        }
                    }
                    .padding()
                    
                }
                    
                    Spacer()
                    
                    NavigationLink(destination: CreateReminder()) {
                        Text("Criar Nova Tarefa")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.green.opacity(0.8)]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.bottom, 20)
                }
            
            .navigationBarTitle("Home", displayMode: .inline)
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
            }
        
    }
    enum TaskFilter{
        case dentroDoPrazo
        case expirados
    }
    
        struct SectionView: View {
            var title: String
            @Binding var taskList: [String]
            
            var body: some View {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .padding(.top, 20)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading) {
                        ForEach(Array(taskList.enumerated()), id: \.offset) { index, task in
                            HStack {
                                Text(task)
                                    .padding(.vertical, 5)
                                    .font(.body)
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                NavigationLink(destination: EditReminder()){
                                    Image(systemName: "pencil")
                                        .foregroundColor(.blue)
                                        .padding(.trailing, 10)
                                }
                                
                                
                                Button(action: {
                                    taskList.remove(at: index)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                        .padding(.trailing, 10)
                                }
                            }
                            .padding(.vertical, 10)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.bottom, 5)
                        }
                                                        
                                if taskList.isEmpty {
                                Text("Nenhuma tarefa adicionada")
                                    .italic()
                                    .foregroundColor(.gray)
                                
                            }
                        }
                        .padding(.bottom, 20)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    }
                    .padding(.horizontal)
                }
            }
        }
    

#Preview{
    Home()
}
