//
//  Habit.swift
//  HabitTracking
//
//  Created by Tomas Sungaila on 6/5/23.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    let date: Date
}
