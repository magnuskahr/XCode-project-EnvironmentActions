//
//  NewNoteView.swift
//  EnvironmentActions
//
//  Created by Magnus Jensen on 24/10/2021.
//

import SwiftUI

struct NewNoteView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.createNote) private var create
    
    @State private var title: String = ""
    @State private var description: String = ""
    
    var body: some View {
        Form {
            TextField("Title", text: $title, prompt: Text("Title"))
            TextField("Description", text: $description, prompt: Text("Description"))
            Button("Create") {
                let newNote = Note(title: title, description: description)
                create?(newNote)
                dismiss()
            }
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
    }
}
