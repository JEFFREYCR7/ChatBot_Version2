//
//  ChatSidebarListView.swift
//  NextJET_LLM_App
//
//  Created by 王杰瑞 
//

import Foundation
import SwiftUI

import CoreModels
import ViewCondition
import CoreViewModels

struct ChatSidebarListView: View {
    @Environment(CommandViewModel.self) private var commandViewModel
    
    @Environment(ChatViewModel.self) private var chatViewModel
    
    private var todayChats: [Chat] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        return chatViewModel.chats.filter{
            calendar.isDate($0.modifiedDate, inSameDayAs: today)
        }
    }
    
    
    private var yesterdayChats: [Chat] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let yesterday = calendar.date(byAdding: .day, value: -1, to: today)!
        
        
        return chatViewModel.chats.filter{
            calendar.isDate($0.modifiedDate, inSameDayAs: yesterday)
        }
    }
    
    private var previousDays: [Chat] {
        let calendar = Calendar.current
        
        let today = calendar.startOfDay(for: Date())
        let yesterday = calendar.date(byAdding: .day, value: -1, to: today)!
        
        return chatViewModel.chats.filter {
            !calendar.isDate($0.modifiedDate, inSameDayAs: today) &&
            !calendar.isDate($0.modifiedDate, inSameDayAs: yesterday)
        }
    }
    
    
    var body: some View {
        @Bindable var commandViewModeBindable = commandViewModel
        
        List(selection: $commandViewModeBindable.selectedChat) {
            Section(header: Text("Today")) {
                
                ForEach(todayChats) { chat in
                    Label(chat.name, systemImage: "bubble")
                        .contextMenu{
                            ChatContextMenu(commandViewModel, for: chat)
                        }
                        .tag(chat)
                }
                
            }
            .hide(if: todayChats.isEmpty, removeCompletely: true)
            
            Section(header: Text("Yestreday")){
                ForEach(yesterdayChats) {chat in
                    Label(chat.name, systemImage: "bubble")
                        .contextMenu{
                            ChatContextMenu(commandViewModel, for: chat)
                        }
                        .tag(chat)
                }
            }
            
            .hide(if: yesterdayChats.isEmpty, removeCompletely: true)
            
            Section(header: Text("Previous Days")) {
                ForEach(previousDays) {
                    chat in
                    Label(chat.name, systemImage: "bubble")
                        .contextMenu {
                            ChatContextMenu(commandViewModel, for: chat)
                        }
                        .tag(chat)
                }
            }
            
            .hide(if: previousDays.isEmpty, removeCompletely: true)
        }
        .listStyle(.sidebar)
        .task {
            try? chatViewModel.fetch()
        }
        .toolbar {
            ToolbarItemGroup {
                Spacer()
                
                Button("New Chat", systemImage: "square.and.pencil") {
                    commandViewModel.isAddChatViewPresented = true
                }
                .buttonStyle(.accessoryBar)
                .help("New Chat(⌘ + N)")
            }
        }
        
        .navigationDestination(for: Chat.self) {
            chat in
            MessageView(for: chat)
        }
        .sheet(isPresented: $commandViewModeBindable.isAddChatViewPresented){
            AddChatView() {
                createdChat in
                
                self.commandViewModel.selectedChat = createdChat
            }
        }
        .sheet(isPresented: $commandViewModeBindable.isRenameChatViewPresented){
            if let chatToRename = commandViewModel.chatToRename {
                RenameChatView(for: chatToRename)
            }
        }
        .confirmationDialog(AppMessages.chatDeletionTitle, 
                            isPresented:$commandViewModeBindable.isDeleteChatConfirmationPresented){
            Button("Cancel", role: .cancel) {}
            Button("Delete", role: .destructive, action: deleteAction)
    
        } message: {
            Text(AppMessages.chatDeletionMessage)
        }
        .dialogSeverity(.critical)
        
    }
    
    func deleteAction() {
        guard let chatToDlete = commandViewModel.chatToDelete else { return }
        try? chatViewModel.delete(chatToDlete)
        
        commandViewModel.chatToDelete = nil
        commandViewModel.selectedChat = nil
        
    }
}
