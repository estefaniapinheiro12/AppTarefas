//
//  TaskListView.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 29/01/25.
//

import SwiftUI

struct TaskListView: View {
    @Binding var taskList: [Task]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(taskList, id: \.id) { task in
                // TODO:
                // SUBSTITUIR TUDO ISSO PELO COMPONENTE TaskCard())
                HStack {
                    Text(task.name)
                        .padding(.vertical, 5)
                        .font(.body)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    NavigationLink(destination: EditReminder()){
                        Image(systemName: "pencil")
                            .foregroundColor(.blue)
                            .padding(.trailing, 10)
                    }
                    
                    Button(action: {
                        taskList.removeAll(where: {$0.id == task.id})
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .padding(.trailing, 10)
                    }
                }
                .padding(.vertical, 10)
                .background(Color.white.opacity(0.1))
                .cornerRadius(10)
                .padding(.bottom, 5)
            }
            
            if taskList.isEmpty {
                Text("Nenhuma tarefa adicionada :(")
                    .padding()
            }
        }
        .padding(.bottom, 20)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}
