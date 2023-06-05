//
//  Habits.swift
//  HabitTracking
//
//  Created by Tomas Sungaila on 6/5/23.
//

import Foundation

class Habits: ObservableObject {
    @Published var habits = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                habits = decodedItems
                return
            }
        }
        habits = []
    }
        
}
