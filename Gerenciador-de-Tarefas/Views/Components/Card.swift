import SwiftUI

struct Card: View {
    @State var task: Task 
    @Binding var taskList: [Task]
    var color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(task.name)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(task.description)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .lineLimit(3)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(color)
                .cornerRadius(10)
                .shadow(radius: 5)
            }
            
            HStack {
                NavigationLink(destination: EditReminder(task: $task, taskList: $taskList)) {
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.blue.opacity(0.7))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                
                Spacer()
                
                Button(action: {
                    if let index = taskList.firstIndex(where: { $0.id == task.id }) {
                        taskList.remove(at: index)
                    }
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.red.opacity(0.7))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
            }
            .padding([.horizontal, .bottom])
        }
        .padding()
        .background(color)
        .cornerRadius(15)
        .shadow(radius: 10)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.blue.opacity(0.3), lineWidth: 2)
        )
        .padding([.horizontal, .bottom])
    }
}
