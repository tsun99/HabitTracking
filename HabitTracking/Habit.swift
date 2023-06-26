//
//  Habit.swift
//  HabitTracking
//
//  Created by Tomas Sungaila on 6/5/23.
//

import Foundation

struct Habit: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var count: Int
    
}

struct Activity: Identifiable, Codable {
    var id = UUID()
    var idHabit = UUID()
    let info: String
    let startTime: Date
    let endTime: Date
    
    var totalTime: TimeInterval {
        return endTime.timeIntervalSince(startTime)
    }
    
    func timeDoingActivity() -> String{
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: totalTime) ?? ""
    }
}
