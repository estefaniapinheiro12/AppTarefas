import Foundation
import SwiftUI

struct EditReminder: View {
    @Binding var task: Task
    @Binding var taskList: [Task]
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                TextField("Título da tarefa", text: $task.name)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(UIColor.systemGray6)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                DatePicker("Data da Tarefa", selection: $task.deadline, displayedComponents: .date)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(UIColor.systemGray6)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                Text("Descrição")
                    .font(.system(size: 22, weight: .semibold, design: .rounded))
                    .padding(.horizontal)
                
                TextEditor(text: $task.description)
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .padding()
                    .frame(height: 200)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(UIColor.systemGray6)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(radius: 2)
                    .padding(.horizontal)
                
                Button(action: saveTask) {
                    Text("Salvar")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.blue))
                        .shadow(radius: 2)
                }
                .padding(.horizontal)
                .padding(.top)
                
                Spacer()
            }
            .padding(.top)
        }
        .navigationBarTitle("Editar Tarefa", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Voltar")
                    }
                    .font(.system(size: 18, weight: .medium, design: .rounded))
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

