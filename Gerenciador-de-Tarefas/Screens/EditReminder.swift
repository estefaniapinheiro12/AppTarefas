//
//  EditReminder.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 25/12/24.
//

import Foundation
import SwiftUI

struct EditReminder: View {
    
    @State private var taskTitle = ""
    @State private var taskDescription = ""
    @State private var taskDate = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TextField("Título da tarefa", text: $taskTitle)
                .font(.largeTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Data da Tarefa", text: $taskDate)
                .font(.subheadline)
                .foregroundStyle(.gray)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Descrição")
                .font(.headline)
                .padding(.top)
            
            TextEditor(text: $taskDescription)
                .font(.body)
                .padding()
                .frame(height: 200)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            
            Button(action: saveTask) {
                Text("Salvar + ")
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
    }
                   private func saveTask(){
                print("Tarefa salva: \(taskTitle), \(taskDescription), \(taskDate)")
        }
}
#Preview {
    EditReminder()
}
