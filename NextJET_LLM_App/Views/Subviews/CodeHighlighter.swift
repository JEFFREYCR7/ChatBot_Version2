//
//  CodeHighlighter.swift
//  NextJET_LLM_App
//
//  Created by 王杰瑞 on 2024/8/5.
//

import Foundation
import SwiftUI

import Highlightr
import MarkdownUI

struct CodeHighlighter: CodeSyntaxHighlighter {
    
    private let highlightr: Highlightr
    
    
    func highlightCode(_ code: String, language: String?) -> Text {
        let highlightedCode: NSAttributedString?
        
        if let language, !language.isEmpty{
            highlightedCode = highlightr.highlight(code, as: language)
        } else {
            highlightedCode = highlightr.highlight(code)
        }
        
        guard let highlightedCode else { return Text(code)}
        
        var attributedCode = AttributedString(highlightedCode)
        attributedCode.font = .system(size: 16, design: .monospaced)
        
        return Text(attributedCode)
    }
        
    init(theme: String) {
        guard let highlighterInstance = Highlightr() else {
            fatalError("Failed to initialize Highlightr")
        }
        self.highlightr = highlighterInstance
            
        self.highlightr.setTheme(to: theme)
    }
        
}

extension CodeSyntaxHighlighter where Self == CodeHighlighter{
    static func codeHighlighter(theme: String) -> Self {
        CodeHighlighter(theme: theme)
    }
}
