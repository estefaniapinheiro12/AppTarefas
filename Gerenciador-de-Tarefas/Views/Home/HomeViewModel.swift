//
//  HomeViewModel.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 29/01/25.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var activeTaskList: [Task] = [] {
        didSet {
            saveTasks()
        }
    }
    
    private let tasksKey = "savedTasks"
    
    init() {
        loadTasks()
    }
    
    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(activeTaskList) {
            UserDefaults.standard.set(encoded, forKey: tasksKey)
        }
    }
    
    private func loadTasks() {
        if let savedData = UserDefaults.standard.data(forKey: tasksKey),
           let decoded = try? JSONDecoder().decode([Task].self, from: savedData) {
            activeTaskList = decoded
        }
    }
    
    func addTask(_ task: Task) {
        activeTaskList.append(task)
    }
    
    func removeTask(_ task: Task) {
        activeTaskList.removeAll { $0.id == task.id }
    }
    
    // Marcar a tarefa como concluída
    func completeTask(_ task: Task) {
        if let index = activeTaskList.firstIndex(where: { $0.id == task.id }) {
            activeTaskList[index].isCompleted = true
        }
    }
    
    // Reverter a tarefa para "dentro do prazo"
    func revertTask(_ task: Task) {
        if let index = activeTaskList.firstIndex(where: { $0.id == task.id }) {
            activeTaskList[index].isCompleted = false
        }
    }
    
    // Filtrar tarefas concluídas
    func filterCompletedTasks() -> [Task] {
        return activeTaskList.filter { $0.isCompleted }
    }
}
