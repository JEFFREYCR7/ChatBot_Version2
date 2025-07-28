//
//  File.swift
//  
//
//  Created by 王杰瑞 on 2024/8/3.
//

import Foundation

public extension Optional {
    var isNil: Bool{
        self == nil
    }
    
    var isNotNil: Bool {
        self != nil
    }
}
