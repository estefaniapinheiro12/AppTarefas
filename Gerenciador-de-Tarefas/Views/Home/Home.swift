
import SwiftUI


// Se atentar em seguir o padrao de nomeclatura de variaveis: ou tudo em ingles ou tudo em pt

struct Home: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var selectedFilter: TaskFilter = .withinDeadline
    @State private var isSheetOpen = false

    var filteredTasks: [Task] {
        switch selectedFilter {
        case .withinDeadline:
            return viewModel.activeTaskList.filter { $0.deadline.isSameDay(as: Date()) || $0.deadline > Date() }
        case .expired:
            return viewModel.activeTaskList.filter { !$0.deadline.isSameDay(as: Date()) && $0.deadline < Date() }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker("Filtrar Tarefas", selection: $selectedFilter) {
                    Text("Dentro do Prazo").tag(TaskFilter.withinDeadline)
                    Text("Expiradas").tag(TaskFilter.expired)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 40) {
                        TaskListView(viewModel: viewModel, tasks: filteredTasks)
                    }
                    .padding()
                }

                Spacer()

                Button("Criar nova tarefa", action: {
                    isSheetOpen = true
                })
                .buttonStyle(.borderedProminent)
                .padding(.bottom, 20)
            }
            .sheet(isPresented: $isSheetOpen) {
                CreateTaskView(viewModel: viewModel)
            }
            .navigationBarTitle("Suas Tarefas", displayMode: .large)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
