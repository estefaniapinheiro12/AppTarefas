//
//  HomeViewModel.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 29/01/25.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published var activeTaskList: [Task] = []
    @Published var expiredTaskList: [Task] = []
}
