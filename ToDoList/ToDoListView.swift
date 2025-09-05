//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Ron Lemire on 9/5/25.
//

import SwiftUI

struct ToDoListView: View {
    var toDos = ["Learn Swift",
                 "Build Apps",
                 "Change the World",
                 "Bring the Awesome",
                 "Take a Vacation"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }


                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
    }
}

#Preview {
    ToDoListView()
}


/* Original navigate from view
 struct ToDoListView: View {
     var body: some View {
         NavigationStack {
             VStack {
                 NavigationLink {
                     DetailView()
                 } label: {
                     Image(systemName: "eye")
                     Text("Show the New View!")
                 }
                 .buttonStyle(.borderedProminent)
             }
             .padding()
         }
     }
 }
 */

/* Sections
 Section {
     NavigationLink {
         DetailView()
     } label: {
         Text("Winter")
     }
     Text("Summer")
 } header: {
     Text("Breaks")
 }

 Section {
     Text("Spring")
     Text("Fall")
 } header: {
     Text("Semesters")
 }
 */
