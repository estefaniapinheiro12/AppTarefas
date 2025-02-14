import SwiftUI

struct TaskListView: View {
    @ObservedObject var viewModel: HomeViewModel
    var tasks: [Task] 

    // Função para formatar a data
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            ForEach(tasks) { task in
                NavigationLink(
                    destination: ViewReminder(
                        taskTitle: task.name,
                        taskDescription: task.description,
                        taskDate: formatDate(task.deadline) // Formatando a data
                    )
                ) {
                    Card(task: task, taskList: $viewModel.activeTaskList, color: Color.blue)
                        .padding([.horizontal, .top])
                }
            }
            
            if tasks.isEmpty {
                Text("Nenhuma tarefa adicionada :(")
                    .padding()
                    .foregroundColor(.gray)
            }
        }
        .padding(.bottom, 20)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}
