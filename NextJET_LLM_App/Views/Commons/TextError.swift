//
//  TextError.swift
//  NextJET_LLM_App
//
//  Created by 王杰瑞
//

import Foundation
import SwiftUI

struct TextError: View {
    
    private var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .foregroundStyle(.red)
    }
}

#Preview {
    TextError(text: AppMessages.generalErrorMessage)
}
