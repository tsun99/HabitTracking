//
//  NewHabitView.swift
//  HabitTracking
//
//  Created by Tomas Sungaila on 6/5/23.
//

import SwiftUI

struct NewHabitView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView(){
            Form {
                
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                Button("Save"){
                    dismiss()
                }
            }
        }
    }
}

struct NewHabitView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitView()
    }
}
