//
//  EditNoteAction.swift
//  EnvironmentActions
//
//  Created by Magnus Jensen on 24/10/2021.
//

import SwiftUI

struct EditNoteAction {
    typealias Editor = (inout EditableNoteData) -> ()
    typealias Action = (Note, Editor) -> ()

    let action: Action

    func callAsFunction(_ note: Note, editor: Editor) {
        action(note, editor)
    }
}

typealias OnNoteEditHandler = (_ note: Note, _ editable: EditableNoteData) -> Void

struct EditNoteActionKey: EnvironmentKey {
    static var defaultValue: EditNoteAction? = nil
}

extension EnvironmentValues {
    var editNote: EditNoteAction? {
        get { self[EditNoteActionKey.self] }
        set { self[EditNoteActionKey.self] = newValue }
    }
}

extension View {
    func onEditNote(_ handler: @escaping OnNoteEditHandler) -> some View {
        let action: EditNoteAction = .init { note, editAction in
            var editable = EditableNoteData(title: note.title, description: note.description)
            editAction(&editable)
            handler(note, editable)
        }
        return self.environment(\.editNote, action)
    }
}
