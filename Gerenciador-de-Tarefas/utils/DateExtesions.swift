//
//  DateExtesions.swift
//  Gerenciador-de-Tarefas
//
//  Created by iredefbmac_24 on 10/02/25.
//

import Foundation

// Extensão para comparar apenas o ano, mês e dia de uma data
extension Date {
    func isSameDay(as otherDate: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: otherDate)
    }
}
