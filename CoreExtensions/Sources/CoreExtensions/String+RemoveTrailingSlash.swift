//
//  File.swift
//  
//
//  Created by 王杰瑞 on 2024/8/3.
//

import Foundation

public extension String {
    func removeTrailingSlash() -> String {
        return self.hasSuffix("/") ? String(self.dropLast()) : self
    }
}
