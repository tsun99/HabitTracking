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
    @StateObject var habits: Habits
    var body: some View {
        
        NavigationView {
            List {
                ForEach(habits.activities, id: \.id) { activity in
                    if activity.idHabit == habit.id {
                        VStack{
                            HStack {
                                Text(activity.info)
                                    .font(.headline)
                                Spacer()
                                VStack {
                                    Text("Time spent:")
                                        .font(.caption)
                                    Text("\(activity.timeDoingActivity())")
                                        .font(.headline)
                                }
                            }
                            
                        }
                    }
                }
                .onDelete(perform: delete)
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
                AddNewActivity(habit: habit, habits: habits)
            }
        }
    }
    func delete(at offsets: IndexSet) {
        let newHabit = Habit(id: habit.id, name: habit.name, description: habit.description, count: habit.count - 1)
        if let i = habits.habits.firstIndex(of: habit) {
            habits.habits[i] = newHabit
        }
        
        habits.activities.remove(atOffsets: offsets)
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habit: Habit(name: "Name", description: "description", count: 0), habits: Habits())
    }
}
