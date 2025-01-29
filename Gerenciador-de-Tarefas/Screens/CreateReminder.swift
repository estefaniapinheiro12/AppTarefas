//
//  CreateReminder.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 23/12/24.
//

import Foundation
import SwiftUI

struct CreateReminder: View {
    @Environment(\.dismiss) private var dismiss
    @State private var dueDate = Date()
    @State private var taskTitle = ""
    @State private var taskDescription = ""
    
    var body: some View {

        VStack {
            TextField("Título da tarefa", text: $taskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            DatePicker("Selecione da data", selection: $dueDate, in: Date()..., displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            TextField ("Descrição da tarefa", text:  $taskDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Spacer()
            
            Button(action: {
                saveTask()
            }) {
                Text("Salvar +")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .navigationTitle("Criar Lembrete")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text("Voltar")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .padding()
        
    }
    private func saveTask (){
        guard !taskTitle.isEmpty else {
            print ("O título da tarefa não pode estar vazio.")
            return
        }
        print ("Tarefa salva!")
        print("Título: \(taskTitle)")
        print("Data de vencimento: \(dueDate)")
        print("Descrição: \(taskDescription)")
    }
}
#Preview {
    NavigationView{
        CreateReminder()
    }
}

