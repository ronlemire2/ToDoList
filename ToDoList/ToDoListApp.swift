//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ron Lemire on 9/5/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self)
        }
    }
    
    // Will allow us to find where our simulator data is saved:
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
        /*
        /Users/imac/Library/Developer/CoreSimulator/Devices/344480B8-6E37-4953-ABBF-E0AFD6FC98A0/data/Containers/Data/Application/B06CC1F4-0812-4D72-BF12-2247A2CF95C2/Library/Application Support/
        */
    }

}
