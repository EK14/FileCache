//
//  FileCache.swift
//
//
//  Created by Elina Karapetian on 13.07.2024.
//

import Foundation

public class FileCache {
    public private(set) var todoItems: [ToDoItem] = []
    private var appFolderPath: URL = URL(filePath: "")
    private let manager = FileManager.default
    private var fileName: String
    public var saveAction: (() -> Void)?

    public static let shared = FileCache()

    private init() {
        self.fileName = "todoappcache"
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        self.appFolderPath = url.appendingPathComponent("todoappyandex")
        do {
            try manager.createDirectory(at: appFolderPath, withIntermediateDirectories: true)
        } catch {
            print(error.localizedDescription)
        }
    }

    public func addTask(_ todoItem: ToDoItem) {
        if !todoItems.contains(where: { $0.id == todoItem.id }) {
            todoItems.append(todoItem)
        }
    }

    public func removeTask(_ taskID: String) {
        todoItems.removeAll(where: { $0.id == taskID })
    }

    public func save() {
        let todoItemsData = todoItems.map { $0.json }
        do {
            let fileUrl = appFolderPath.appendingPathComponent("\(fileName).json")
            let jsonData = try JSONSerialization.data(withJSONObject: todoItemsData)
            manager.createFile(atPath: fileUrl.path, contents: jsonData)
        } catch {
            print(error.localizedDescription)
        }
        saveAction?()
    }

    public func upload() {
        let fileUrl = appFolderPath.appendingPathComponent("\(fileName).json")
        if let data = try? Data(contentsOf: fileUrl) {
            if let loadedItems = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                todoItems = loadedItems.compactMap { ToDoItem.parse(json: $0) }
            }
        }
    }
}
