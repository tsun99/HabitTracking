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
                            HabitView()
                        } label: {
                            VStack(alignment: .leading) {
                                Text(habit.name)
                                    .font(.headline)
                                Text(habit.description)
                                    .font(.caption)
                            }
                            
                        }
                    }
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
