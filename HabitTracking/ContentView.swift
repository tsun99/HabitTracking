//
//  ContentView.swift
//  HabitTracking
//
//  Created by Tomas Sungaila on 6/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var habits = Habits()
    
    @State private var isNewHabitClicked = false
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(habits.habits, id: \.id) { habit in
                        NavigationLink {
                            HabitView(habit: habit, habits: habits)
                        } label: {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(habit.name)
                                        .font(.headline)
                                    Text(habit.description)
                                        .font(.caption)
                                }
                                Spacer()
                                VStack(alignment: .center) {
                                    Text("Total times:")
                                        .font(.caption)
                                    Text("\(habit.count)")
                                        .font(.headline)
                                }
                            }
                            
                        }
                    }
                    .onDelete(perform: delete)
                }
            }
            .navigationTitle("Habit Tracking")
            .toolbar {
                Button {
                    isNewHabitClicked = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isNewHabitClicked) {
                NewHabitView(habits: habits)
            }
        }
    }
    func delete(at offsets: IndexSet) {
        habits.habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
