//
//  Note.swift
//  EnvironmentActions
//
//  Created by Magnus Jensen on 24/10/2021.
//

import Foundation

struct Note: Identifiable, Equatable {
    let id: UUID
    let title: String
    let description: String
    
    init(id: UUID = UUID(), title: String, description: String) {
        self.id = id
        self.title = title
        self.description = description
    }
}
