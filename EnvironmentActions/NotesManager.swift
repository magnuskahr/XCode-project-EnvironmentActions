//
//  NotesManager.swift
//  EnvironmentActions
//
//  Created by Magnus Jensen on 24/10/2021.
//

import Foundation

final class NotesManager: ObservableObject {
    
    @Published private(set) var allNotes: [Note] = []
    
    func create(note: Note) {
        allNotes.append(note)
    }
    
    func update(_ note: Note, with data: EditableNoteData) {
        if let index = allNotes.firstIndex(of: note) {
            let edited = Note(id: note.id, title: data.title, description: data.description)
            allNotes[index] = edited
        }
    }
}
