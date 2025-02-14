//
//  CreateReminder.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 23/12/24.
//
import Foundation
import SwiftUI

struct CreateTaskView: View {
    @ObservedObject var viewModel: HomeViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var dueDate = Date()
    @State private var taskTitle = ""
    @State private var taskDescription = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Adicionar nova tarefa").font(.title)
            
            VStack(alignment: .leading) {
                Text("Título da tarefa")
                TextField("Ex: alimentar gato", text: $taskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack(alignment: .leading) {
                Text("Descrição da tarefa")
                TextField("Ex: quando voltar da faculdade", text: $taskDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Prazo da tarefa")
                DatePicker("Selecione a data", selection: $dueDate, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
            
            Button("Adicionar tarefa") {
                saveTask()
                dismiss()
            }
        }
        .padding()
    }
    
    private func saveTask() {
        guard !taskTitle.isEmpty else {
            print("O título da tarefa não pode estar vazio.")
            return
        }
        let newTask = Task(id: UUID(), name: taskTitle, description: taskDescription, deadline: dueDate)
        viewModel.addTask(newTask)
    }
}
