//
//  Habits.swift
//  HabitTracking
//
//  Created by Tomas Sungaila on 6/5/23.
//

import Foundation

class Habits: ObservableObject {
    @Published var habits = [Habit]()
    
}
