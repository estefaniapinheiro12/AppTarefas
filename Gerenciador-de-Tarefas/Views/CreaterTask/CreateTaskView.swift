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
        VStack(spacing: 24) {
            Text("Adicionar Nova Tarefa")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(.top, 32)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Título da Tarefa")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                TextField("Ex: Alimentar o gato", text: $taskTitle)
                    .padding(16)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1))
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Descrição da Tarefa")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                TextField("Ex: Quando voltar da faculdade", text: $taskDescription)
                    .padding(16)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Prazo da Tarefa")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                DatePicker("Selecione a data", selection: $dueDate, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
            
            Button(action: {
                saveTask()
                dismiss()
            }) {
                Text("Adicionar Tarefa")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.blue))
                    .shadow(radius: 2)
            }
            .padding(.horizontal)
            .padding(.top, 16)
            .padding(.bottom, 16) // Ajuste do espaçamento inferior
            
        }
        .padding(24)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all))
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
