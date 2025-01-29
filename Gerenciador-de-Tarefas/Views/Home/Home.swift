import SwiftUI

// Isso eh um modelo
enum TaskFilter{
    case dentroDoPrazo
    case expirados
}

// Se atentar em seguir o padrao de nomeclatura de variaveis: ou tudo em ingles ou tudo em pt
// View deve conter somente elementos graficos, nao modelos

struct Home: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedFilter: TaskFilter = .dentroDoPrazo
    @State private var isSheetOpen = false;
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Filtrar Tarefas", selection: $selectedFilter){
                    Text("Dentro do Prazo").tag(TaskFilter.dentroDoPrazo)
                    Text("Expiradas").tag(TaskFilter.expirados)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 40) {
                        // Se tudo que muda eh a lista ativa nao existe necessidade de chamar a view duas vezes distintas, basta atualizar a variavel que contem a lista ativa!
                        TaskListView(
                            taskList: $viewModel.activeTaskList
                        )
                    }
                    .padding()
                }
                
                Spacer()
                
                // Antes existia um navigation view com um text aqui, chamando a view que cria a task
                Button("Criar nova tarefa", action: {
                    isSheetOpen = true;
                })
                .buttonStyle(.borderedProminent)
                .padding(.bottom, 20)
            }
            .sheet(isPresented: $isSheetOpen) {
                CreateTaskView(activeTaskList: $viewModel.activeTaskList)
            }
            
            .navigationBarTitle("Suas Tarefas", displayMode: .large)
        }
        
    }
}
    

#Preview{
    Home()
}
