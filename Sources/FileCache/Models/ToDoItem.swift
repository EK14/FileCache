//
//  ToDoItem.swift
//
//
//  Created by Elina Karapetian on 13.07.2024.
//

import Foundation

public struct ToDoItem {
    public let id: String
    public let text: String
    public let importance: ItemImportance
    public let deadline: Date?
    public let isDone: Bool
    public let createdAt: Date
    public let changedAt: Date?
    public let color: String?
    public let category: String?
    public let categoryColor: String?

    public init(id: String? = UUID().uuidString,
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
