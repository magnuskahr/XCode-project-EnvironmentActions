//
//  CreateNoteAction.swift
//  EnvironmentActions
//
//  Created by Magnus Jensen on 24/10/2021.
//

import SwiftUI

typealias CreateNoteAction = (Note) -> ()

struct CreateNoteActionKey: EnvironmentKey {
    static var defaultValue: CreateNoteAction? = nil
}

extension EnvironmentValues {
    var createNote: CreateNoteAction? {
        get { self[CreateNoteActionKey.self] }
        set { self[CreateNoteActionKey.self] = newValue }
    }
}

extension View {
    func onCreateNote(_ action: @escaping CreateNoteAction) -> some View {
        self.environment(\.createNote, action)
    }
}
