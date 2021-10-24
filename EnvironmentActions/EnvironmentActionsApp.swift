//
//  EnvironmentActionsApp.swift
//  EnvironmentActions
//
//  Created by Magnus Jensen on 24/10/2021.
//

import SwiftUI

@main
struct EnvironmentActionsApp: App {
    @StateObject private var manager = NotesManager()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                NotesList(notes: manager.allNotes)
            }
            .onCreateNote { note in
                manager.create(note: note)
            }
            .onEditNote { note, editable in
                manager.update(note, with: editable)
            }
        }
    }
}
