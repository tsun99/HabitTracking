//
//  Habit.swift
//  HabitTracking
//
//  Created by Tomas Sungaila on 6/5/23.
//

import Foundation

struct Habit: Identifiable {
    var id: Int
    let name: String
    let description: String
    let timeSpent: String
    let date: Date
}
