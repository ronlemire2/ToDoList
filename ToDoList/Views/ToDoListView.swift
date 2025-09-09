//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Ron Lemire on 9/5/25.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Query var toDos: [ToDo]
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos) { toDo in
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                                .onTapGesture {
                                    toDo.isCompleted.toggle()
                                    // Save after .toggle wasn't working in video so needed these lines.
                                    // Save after .toggle was working for me so don't need these lines.
                                    /*
                                    guard let _ = try? modelContext.save() else {
                                        print("😡 ERROR: Save after .toggle on ToDoListView did not work.")
                                        return
                                    }
                                    */
                                }
                            NavigationLink {
                                DetailView(toDo: toDo)
                            } label: {
                                Text(toDo.item)
                            }
                            .swipeActions {
                                Button("Delete", role: .destructive) {
                                    modelContext.delete(toDo)
                                    // Delete wasn't working in video so needed these lines.
                                    // Delete was working for me so don't need these lines.
                                    /*
                                    guard let _ = try? modelContext.save() else {
                                        print("😡 ERROR: Save after .delete on ToDoListView did not work.")
                                        return
                                    }
                                    */
                                }
                            }
                        }
                        .font(.title3)
                        
                        HStack {
                            Text(toDo.dueDate.formatted(date: .abbreviated, time: .shortened))
                                .foregroundStyle(.secondary)
                            
                            if toDo.reminderIsOn {
                                Image(systemName: "calendar.badge.clock")
                                    .symbolRenderingMode(.multicolor)
                            }
                        }
                    }

                }
                /* Alternative to .swipeActions
                .onDelete { indexSet in
                    indexSet.forEach({modelContext.delete(toDos[$0])})
                    guard let _ = try? modelContext.save() else {
                        print("😡 ERROR: Save after .delete on ToDoListView did not work.")
                        return
                    }
                }
                */
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ToDoListView()
        //.modelContainer(for: ToDo.self, inMemory: true)
        .modelContainer(ToDo.preview)
}

