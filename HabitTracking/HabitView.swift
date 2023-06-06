//
//  HabitView.swift
//  HabitTracking
//
//  Created by Tomas Sungaila on 6/5/23.
//

import SwiftUI

struct HabitView: View {
    
    @State private var addActivityPressed = false
    var habit: Habit
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationTitle(habit.name)
            .toolbar {
                Button {
                    addActivityPressed = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $addActivityPressed) {
                AddNewActivity()
            }
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habit: Habit(name: "Name", description: "description", count: 0))
    }
}
