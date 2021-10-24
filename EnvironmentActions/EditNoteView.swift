//
//  EditNoteView.swift
//  EnvironmentActions
//
//  Created by Magnus Jensen on 24/10/2021.
//

import SwiftUI

struct EditNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.editNote) private var edit
    
    let note: Note
    @State private var title: String
    @State private var description: String
    
    init(note: Note) {
        self.note = note
        self._title = State(wrappedValue: note.title)
        self._description = State(wrappedValue: note.description)
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $title, prompt: Text("Title"))
            TextField("Description", text: $description, prompt: Text("Description"))
            Button("Save edit") {
                edit?(note) { editable in
                    editable.title = title
                    editable.description = description
                }
                dismiss()
            }
        }
    }
}

struct EditNoteView_Previews: PreviewProvider {
    static var previews: some View {
        EditNoteView(note: .init(title: "A title", description: "A description"))
    }
}
