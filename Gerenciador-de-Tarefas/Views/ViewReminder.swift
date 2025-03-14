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
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                Text(taskTitle)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.blue)
                    Text(taskDate)
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.blue)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue.opacity(0.1)))
                }
                
                Divider()
                    .padding(.vertical, 8)
                
                Text("Descrição")
                    .font(.system(size: 22, weight: .semibold, design: .rounded))
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(taskDescription)
                    .font(.system(size: 18, weight: .regular, design: .rounded))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(UIColor.systemGray6)))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(radius: 2)
                    .padding(.bottom, 20)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Detalhes da Tarefa", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    Text("Voltar")
                        .font(.system(size: 18, weight: .medium, design: .rounded))
                        .foregroundColor(.blue)
                }
            }
        }
    }
}
