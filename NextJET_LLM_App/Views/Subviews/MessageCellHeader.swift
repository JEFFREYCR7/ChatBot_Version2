//
//  MessageCellHeader.swift
//  NextJET_LLM_App
//
//  Created by 王杰瑞 on 2024/8/6.
//

import SwiftUI

struct MessageCellHeader: View {
    
    private let content: String
    
    init(_ content: String) {
        self.content = content
    }
    var body: some View {
        Text(content)
            .font(.system(size: 14, weight: .semibold))
            .foregroundStyle(.blue)
    }
}

#Preview {
    List {
        MessageCellHeader("You")
        MessageCellHeader("Assistant")
    }
}
