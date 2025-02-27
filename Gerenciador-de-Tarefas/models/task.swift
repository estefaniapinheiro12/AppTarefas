//
//  task.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 29/01/25.
//
import Foundation

struct Task: Codable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var deadline: Date
    var isCompleted: Bool = false
}
