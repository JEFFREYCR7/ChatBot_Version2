

import Foundation
import SwiftUI

import ViewState
import ViewCondition
import MarkdownUI

struct MessageCellView: View {
    
    private let content: String
    private var viewState: ViewState? = nil
    
    private var isAssistant: Bool = false
    private var isLastMessage: Bool = false
    private var regenerateAction: () -> Void = {}
    
    init(_ content: String) {
        self.content = content
        self.viewState = .none
    }
    
    init(_ content: String, viewState: ViewState?) {
        self.content = content
        self.viewState = viewState
    }
    
    @State private var isHovered: Bool = false
    
    private var title: String {
        isAssistant ? "NextJET" : "You"
    }
    
    private var isCopyButtionVisible: Bool {
        isHovered && viewState != .loading
    }
    
    private var isRegeneratedButtonVisible: Bool {
        isHovered && isLastMessage && viewState != .loading
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            MessageCellHeader(title)
            
            MessageCellContent(content, viewState: viewState)
                .lastMessage(isLastMessage)
            
            MessageCellFooter(copyAction: copyAction, regenerateAction: regenerateAction)
                .hovered(isHovered)
                .visibleCopyButton(isCopyButtionVisible)
                .visibleRegenerateButton(isRegeneratedButtonVisible)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top)
        .onHover{
            isHovered = $0
        }
    }
    
    public func assistant (_ isAssistant: Bool) -> MessageCellView {
        var view = self
        view.isAssistant = isAssistant
        return view
    }
    
    private func copyAction(){
        let markdown = MarkdownContent(content)
        let plainText = markdown.renderPlainText()
        let pasteBoard = NSPasteboard.general
        pasteBoard.clearContents()
        pasteBoard.setString(plainText, forType: .string)
    }
    
    public func lastMessage(_ isLastMessage: Bool) -> MessageCellView {
        var view = self
        view.isLastMessage = isLastMessage
        
        return view
    }
    
    public func regenerate(_ action: @escaping () -> Void) -> MessageCellView {
        var view = self
        view.regenerateAction = action
        
        return view
    }
}

#Preview {
    List {
        MessageCellView("The quick brown fox jumps over the lazy dog", viewState: .loading)
        MessageCellView("The quick brown fox jumps over the lazy dog")
        
        MessageCellView("The quick brown fox jumps over the lazy dog")
            .assistant(true)
        
        MessageCellView("The quick brown fox jumps over the lazy dog")
            .lastMessage(true)
        
        MessageCellView("The quick brown fox jumps over the lazy dog", viewState: .error(message: "Unexpected error"))
    }
}
