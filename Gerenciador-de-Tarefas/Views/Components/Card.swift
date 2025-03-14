import SwiftUI

struct Card: View {
    @State var task: Task
    @Binding var taskList: [Task]
    var color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 6) {
                Text(task.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .lineLimit(1)
                
                Text(task.description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(2)
            }
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 16) { // Aumentei o espaçamento para evitar cliques acidentais
                Button(action: toggleCompletion) {
                    IconButton(icon: task.isCompleted ? "arrow.uturn.left" : "checkmark", color: task.isCompleted ? .orange : .blue)
                }
                
                NavigationLink(destination: EditReminder(task: $task, taskList: $taskList)) {
                    IconButton(icon: "pencil", color: .green)
                }
                
                Button(action: deleteTask) {
                    IconButton(icon: "trash", color: .red)
                }
            }
        }
        .padding()
        .background(color.gradient)
        .cornerRadius(16)
        .shadow(color: color.opacity(0.3), radius: 8, x: 0, y: 4)
    }
    
    private func deleteTask() {
        if let index = taskList.firstIndex(where: { $0.id == task.id }) {
            taskList.remove(at: index)
        }
    }
    
    private func toggleCompletion() {
        if let index = taskList.firstIndex(where: { $0.id == task.id }) {
            taskList[index].isCompleted.toggle()
        }
    }
}

struct IconButton: View {
    var icon: String
    var color: Color
    
    var body: some View {
        Image(systemName: icon)
            .foregroundColor(.white)
            .padding(12) // Aumentei um pouco o padding para melhor usabilidade
            .background(color)
            .clipShape(Circle())
            .shadow(radius: 4)
    }
}


