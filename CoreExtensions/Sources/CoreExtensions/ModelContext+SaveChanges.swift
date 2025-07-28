//
//  ModelContext+SaveChanges.swift
//  NextJET_LLM_App
//
//  Created by 王杰瑞
//

import SwiftData

public extension ModelContext {
    func saveChanges() throws {
        if self.hasChanges {
            try self.save()
        }
    }
}
