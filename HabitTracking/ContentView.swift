//
//  ContentView.swift
//  HabitTracking
//
//  Created by Tomas Sungaila on 6/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNewHabitClicked = false
    var body: some View {
        NavigationView {
            VStack{
                
            }
            .navigationTitle("Habit Tracking")
            .toolbar {
                Button {
                    isNewHabitClicked = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
