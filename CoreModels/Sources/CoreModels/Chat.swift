// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftData
import Foundation

@Model
public final class Chat: Identifiable {
    
    @Attribute(.unique) public var id: UUID = UUID()
    
    public var name: String
    public var model: String
    public var createdDate: Date = Date.now
    public var modifiedDate: Date = Date.now
    
    @Relationship(deleteRule: .cascade, inverse: \Message.chat)
    public var messages: [Message] = []
    
    public init(name: String, model: String) {
        self.name = name
        self.model = model
    }
    
}
