//
//  File.swift
//  
//
//  Created by 王杰瑞 on 2024/8/3.
//

import Foundation
import OllamaKit
import SwiftData

@Model
public final class Message: Identifiable {
    @Attribute(.unique) public var id: UUID = UUID()
    
    public var prompt: String?
    public var response: String?
    public var context: [Int]?
    public var done: Bool = false
    public var createdDate: Date = Date.now
    
    
    @Relationship
    public var chat: Chat?
    
    public init(prompt: String?, response: String?) {
        self.prompt = prompt
        self.response = response
    }
    
    @Transient var model: String{
        chat?.model ?? "" 
    }
}


public extension Message {
    func convertToOKGenerateRequestData() -> OKGenerateRequestData{
        var data = OKGenerateRequestData(model: self.model, prompt: self.prompt ?? "")
        
        return data
    }
}
