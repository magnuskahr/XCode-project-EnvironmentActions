//
//  NotesList.swift
//  EnvironmentActions
//
//  Created by Magnus Jensen on 24/10/2021.
//

import SwiftUI

struct NotesList: View {
    let notes: [Note]
    @State private var isAddingNote = false
    @State private var editingNote: Note?
    var body: some View {
        List(notes) { note in
            Button(note.title) {
                editingNote = note
            }
        }
        .sheet(isPresented: $isAddingNote) {
            NewNoteView()
        }
        .sheet(item: $editingNote) { note in
            EditNoteView(note: note)
        }
        .toolbar {
            Button("New note") {
                isAddingNote = true
            }
        }
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesList(notes: [])
    }
}
