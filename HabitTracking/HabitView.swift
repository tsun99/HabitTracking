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
                                Spacer()
                                VStack {
                                    Text("Time spent:")
                                    Text("\(activity.timeDoingActivity())")
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
        habits.activities.remove(atOffsets: offsets)
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(habit: Habit(name: "Name", description: "description", count: 0), habits: Habits())
    }
}
