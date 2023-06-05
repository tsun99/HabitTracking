//
//  NewHabitView.swift
//  HabitTracking
//
//  Created by Tomas Sungaila on 6/5/23.
//

import SwiftUI

struct NewHabitView: View {
    
    @State var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView(){
            Form {
                Section(header: Text("Name")) {
                    TextField("Name of Habit", text: $name )
                }
                Section(header: Text("Description")) {
                    TextField("Description", text: $description, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(10)
                }
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                Button("Save"){
                    if name == "" && description == "" {
                        dismiss()
                    }
                    let item = Habit(name: name, description: description, date: Date.now)
                    habits.habits.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct NewHabitView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitView(habits: Habits())
    }
}
