//
//  ViewReminder.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 29/12/24.
//

import Foundation
import SwiftUI

struct ViewReminder: View {
    var taskTitle: String
    var taskDescription: String
    var taskDate: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(taskTitle)
                .font(.largeTitle)
                .bold()
            
            Text("Data: \(taskDate)")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Descrição")
                .font(.headline)
                .padding(.top)
                
            ScrollView{
                Text(taskDescription)
                    .font(.body)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Detalhes da tarefa", displayMode: .inline)
    }
}
#Preview {
    ViewReminder(
        taskTitle: "Estudar",
        taskDescription: "Swuift",
        taskDate: "11/12/2024"
    )
}
