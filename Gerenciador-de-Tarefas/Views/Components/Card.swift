import SwiftUI

struct Card: View {
    @State var task: Task
    @Binding var taskList: [Task]
    var color: Color
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 8) {
                Text(task.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(1)
                
                Text(task.description)
                    .font(.body)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(2)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 10) {
                NavigationLink(destination: EditReminder(task: $task, taskList: $taskList)) {
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.green)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                
                Button(action: {
                    if let index = taskList.firstIndex(where: { $0.id == task.id }) {
                        taskList.remove(at: index)
                    }
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .padding(12)
                        .background(Color.red)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                
                Button(action: {
                    if let index = taskList.firstIndex(where: { $0.id == task.id }) {
                        taskList[index].isCompleted.toggle()
                    }
                }) {
                    Image(systemName: task.isCompleted ? "arrow.uturn.left" : "checkmark")
                        .foregroundColor(.white)
                        .padding(12)
                        .background(task.isCompleted ? Color.orange : Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
            }
        }
        .padding()
        .background(color.gradient)
        .cornerRadius(20)
        .shadow(color: color.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}
