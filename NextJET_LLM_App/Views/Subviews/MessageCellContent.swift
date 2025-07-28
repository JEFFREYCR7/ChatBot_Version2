

import SwiftUI
import MarkdownUI
import ViewState

struct MessageCellContent: View {
    @Environment(\.colorScheme) private var colorScheme
    
    
    private var isLastMessage: Bool = false
    
    private var content: String
    private var viewState: ViewState?
    
    
    init(_ content: String, viewState: ViewState?) {
        self.content = content
        self.viewState = viewState
    }
    
    
    private var theme: String {
        colorScheme == .dark ? "atom-one-dark" : "atom-one-light"
    }
    
    private var generatingViewState: ViewState? {
        content.isEmpty && viewState == .loading ? .loading : nil
    }
    
    private var errorViewState: ViewState? {
        guard let errorMessage = viewState?.errorMessage else {return nil}
        
        return isLastMessage ? .error(message: errorMessage) : nil
    }
    
    
    var body: some View {
        Markdown(content)
            .textSelection(.enabled)
            .markdownCodeSyntaxHighlighter(.codeHighlighter(theme: theme))
            .markdownTextStyle(\.text) {
                FontSize(NSFont.systemFont(ofSize: 16).pointSize)
            }
        
        
            .markdownTextStyle(\.code) {
                FontSize(NSFont.systemFont(ofSize: 16).pointSize)
                FontFamily(.system(.monospaced))
            }
        
            .markdownBlockStyle(\.paragraph) {
                confirguation in
                confirguation.label
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        
        
            .markdownBlockStyle(\.paragraph){configuration in
                configuration.label
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(nsColor: .tertiarySystemFill))
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                        .stroke(.separator, lineWidth: 1))
            }
            .when(generatingViewState, is: .loading) {
                ProgressView()
                    .controlSize(.small)
            }
        
            .whenError(errorViewState) {
                message in
                Text(message)
                    .font(.system(size: 16))
                    .foregroundStyle(.red)
            }
    }
    
    public func lastMessage(_ isLastMessage: Bool) -> MessageCellContent{
        var view = self
        view.isLastMessage = isLastMessage
        
        return view
    }
    
}

#Preview {
    List {
        MessageCellContent("The quick brown fox jumps over the lazy dog", viewState: nil)
        MessageCellContent("The quick brown fox jumps over the lazy dog", viewState: .loading)
        MessageCellContent("The quick brown fox jumps over the lazy dog", viewState: .error(message: "Unexpected error"))
    }
}
