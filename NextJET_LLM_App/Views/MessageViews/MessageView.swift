//
//  MessageView.swift
//  NextJET_LLM_App
//
//  Created by 王杰瑞 
//

import Foundation
import SwiftUI
import SwiftUIIntrospect

import ChatField
import ViewState
import ViewCondition

import CoreViewModels
import CoreModels

struct MessageView: View {
    private var chat: Chat
    
    @Environment(\.modelContext) private var  modelContext
    @Environment(ChatViewModel.self) private var chatViewModel
    @Environment(MessageViewModel.self) private var messageViewModel
    @Environment(OllamaViewModel.self) private var ollamaViewModel
    
    @State private var viewState: ViewState? = nil
    @FocusState private var promptFocuese: Bool
    @State private var prompt: String = ""
    
    init (for chat: Chat) {
        self.chat = chat
    }
    
    var isGenerating: Bool {
        messageViewModel.sendViewState == .loading
    }
    
    var body: some View {
        ScrollViewReader {
            scrollViewProxy in
            List(messageViewModel.messages.indices, id: \.self) {
                index in
                let message = messageViewModel.messages[index]
                
                MessageCellView(message.prompt ?? "")
                    .assistant(false)
                
                MessageCellView(message.response ?? "", viewState: messageViewModel.sendViewState)
                    .assistant(true)
                    .lastMessage(index == messageViewModel.messages.endIndex - 1)
                    .regenerate{
                        regenerateAction(for: message)
                    }
                    .id(message)
            }
            .onAppear {
                scrollToBottom(scrollViewProxy)
            }
            .onChange(of: messageViewModel.messages) {
                scrollToBottom(scrollViewProxy)
            }
            .onChange(of: messageViewModel.messages.last?.response){
                scrollToBottom(scrollViewProxy)
            }
            
            HStack(alignment: .bottom) {
                ChatField("Message", text: $prompt, action: sendAction)
                    .textFieldStyle(CapsuleChatFieldStyle())
                    .focused($promptFocuese)
                
                Button(action: sendAction) {
                    Image(systemName: "arrow.up")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .buttonStyle(.plain)
                .help("Send message")
                .hide(if: isGenerating, removeCompletely: true)
                
                Button(action: messageViewModel.stopGenerate) {
                    Image(systemName: "stop.circle")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .buttonStyle(.plain)
                .help("Stop generation")
                .visible(if: isGenerating, removeCompletely: true)
                
            }
            .padding(.top, 8)
            .padding(.bottom, 16)
            .padding(.horizontal)
        }
        
        .navigationTitle(chat.name)
        .navigationSubtitle(chat.model)
        
        .task {
            initAction()
        }
        .onChange(of: chat) {
            initAction()
        }
    }
    
    private func sendAction() {
        guard prompt.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 else { return }
        
        let message = Message(prompt: prompt, response: nil)
        message.context = chat.messages.last?.context ?? []
        
        message.chat = chat
        
        Task {
            try chatViewModel.modify(chat)
            prompt = ""
            await messageViewModel.send(message)
        }
        
    }
    
    private func regenerateAction(for message: Message) {
        message.context = []
        
        message.response = nil
        
        let lastIndex = messageViewModel.messages.count - 1
        
        if lastIndex > 0 {
            message.context = messageViewModel.messages[lastIndex - 1].context
        }
    }
    
    private func scrollToBottom(_ proxy: ScrollViewProxy) {
        guard messageViewModel.messages.count > 0 else {return}
        let lastIndex = messageViewModel.messages.count - 1
        let lastMessage = messageViewModel.messages[lastIndex]
        
        proxy.scrollTo(lastMessage, anchor: .bottom)
    }
    
    
    private func initAction() {
        try? messageViewModel.fetch(for: chat)
        promptFocuese = true
    }
}


