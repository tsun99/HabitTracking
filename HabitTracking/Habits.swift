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
    @Published var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                habits = decodedItems
                
                if let savedItems2 = UserDefaults.standard.data(forKey: "Activities") {
                    if let decodedItems2 = try? JSONDecoder().decode([Activity].self, from: savedItems2) {
                        activities = decodedItems2
                    }
                }
                return
            }
        }
        habits = []
    }
        
}
