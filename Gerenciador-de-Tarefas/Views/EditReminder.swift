import Foundation
import SwiftUI

struct EditReminder: View {
    @Binding var task: Task
    @Binding var taskList: [Task]
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("Título da tarefa", text: $task.name)
                .font(.largeTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            DatePicker("Data da Tarefa", selection: $task.deadline, displayedComponents: .date)
                .font(.subheadline)
                .foregroundStyle(.gray)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Descrição")
                .font(.headline)
                .padding(.top)
            
            TextEditor(text: $task.description)
                .font(.body)
                .padding()
                .frame(height: 200)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Button(action: saveTask) {
                Text("Salvar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.top)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Editar Tarefa", displayMode: .inline)
        .navigationBarBackButtonHidden(true) // Remover o back automático
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Text("Voltar")
                        .foregroundColor(.blue)
                }
            }
        }
    }
    
    private func saveTask() {
        if let index = taskList.firstIndex(where: { $0.id == task.id }) {
            taskList[index] = task
            saveTasksToUserDefaults()
        }
        dismiss()
    }
    
    private func saveTasksToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(taskList) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }
}
