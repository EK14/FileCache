//
//  ToDoItem.swift
//
//
//  Created by Elina Karapetian on 13.07.2024.
//

import Foundation

struct ToDoItem {
    let id: String
    let text: String
    let importance: ItemImportance
    let deadline: Date?
    let isDone: Bool
    let createdAt: Date
    let changedAt: Date?
    let color: String?
    let category: String?
    let categoryColor: String?

    init(id: String? = UUID().uuidString,
         text: String,
         importance: ItemImportance,
         deadline: Date? = nil,
         isDone: Bool,
         createdAt: Date = Date.now,
         changedAt: Date? = nil,
         color: String? = nil,
         category: String? = nil,
         categoryColor: String? = nil) {
        self.id = id ?? UUID().uuidString
        self.text = text
        self.importance = importance
        self.deadline = deadline
        self.isDone = isDone
        self.createdAt = createdAt
        self.changedAt = changedAt
        self.color = color
        self.category = category
        self.categoryColor = categoryColor
    }
}
