import SwiftUI

struct Home: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedFilter: TaskFilter = .withinDeadline
    @State private var isSheetOpen = false

    var filteredTasks: [Task] {
        switch selectedFilter {
        case .withinDeadline:
            return viewModel.activeTaskList.filter { !$0.isCompleted && ($0.deadline.isSameDay(as: Date()) || $0.deadline > Date()) }
        case .expired:
            return viewModel.activeTaskList.filter { !$0.isCompleted && !$0.deadline.isSameDay(as: Date()) && $0.deadline < Date() }
        case .completed:
            return viewModel.filterCompletedTasks()
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Filtro de tarefas
                Picker("Filtrar Tarefas", selection: $selectedFilter) {
                    Text("Dentro do Prazo").tag(TaskFilter.withinDeadline)
                    Text("Expiradas").tag(TaskFilter.expired)
                    Text("Concluídas").tag(TaskFilter.completed) // Novo filtro para tarefas concluídas
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 40) {
                        // Exibe a lista de tarefas filtradas
                        TaskListView(viewModel: viewModel, tasks: filteredTasks)
                    }
                    .padding()
                }

                Spacer()

                // Botão para criar nova tarefa
                Button(action: {
                    isSheetOpen = true
                }) {
                    Text("Criar nova tarefa")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 50)
                
            }
            .sheet(isPresented: $isSheetOpen) {
                CreateTaskView(viewModel: viewModel)
            }
            .navigationBarTitle("Suas Tarefas", displayMode: .large)
        }
        .navigationBarBackButtonHidden(true)
    }
}
