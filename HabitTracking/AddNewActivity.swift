//
//  AddNewActivity.swift
//  HabitTracking
//
//  Created by Tomas Sungaila on 6/5/23.
//

import SwiftUI

struct TimeField: View {
    @Binding var isOneClicked: Bool
    @Binding var isTwoClicked: Bool
    @Binding var date: Date
    @State var title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
            
            Group {
                if isOneClicked {
                    DatePicker(title, selection: $date, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                        
                } else {
                    Text(date, style: .time)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            withAnimation {
                                isOneClicked.toggle()
                                if isTwoClicked {
                                    isTwoClicked.toggle()
                                }
                                
                            }
                        }
                }
            }
        }
    }
}

struct AddNewActivity: View {
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var isStartTimeExpanded = false
    @State private var isEndTimeExpanded = false
    
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    
    var habit: Habit
    @StateObject var habits: Habits
    
    var body: some View {
        
            
        NavigationView {
            
            Form {
                
                VStack(alignment: .leading) {
                    
                    Section {
                        
                        TimeField(isOneClicked: $isStartTimeExpanded, isTwoClicked: $isEndTimeExpanded, date: $startTime, title: "Start Time")
                            .padding(.bottom)
                        
                        TimeField(isOneClicked: $isEndTimeExpanded, isTwoClicked: $isStartTimeExpanded, date: $endTime, title: "End Time")
                            .padding(.vertical)
                        
                    }
                    
                    Section(header: Text("Information")) {
                        
                        TextField("Enter information for the activity", text: $description, axis: .vertical)
                            .padding()
                            .lineLimit(6)
                        
                    }
                }
                
            }
            .navigationTitle("Add Activity")
            .toolbar {
                Button {
                    let activity = Activity(idHabit: habit.id, info: description, startTime: startTime, endTime: endTime)
                    habits.activities.append(activity)
                    dismiss()
                    
                } label: {
                    Text("Add")
                }
            }
            .frame(maxWidth: .infinity)
        }
        
    }
    
}

struct AddNewActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddNewActivity(habit: Habit(name: "null", description: "", count: 0), habits: Habits())
    }
}
