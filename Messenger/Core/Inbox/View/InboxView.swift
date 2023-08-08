//
//  InboxView.swift
//  Messenger
//
//  Created by XP India on 03/08/23.
//

import SwiftUI

struct InboxView: View {
    
    @State private var showNewMessageView: Bool = false
    @StateObject private var viewModel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack {
            List {
                ActiveNowView()
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical)
                    .padding(.horizontal, 4 )
                
                ForEach(viewModel.recentMessage) { message in
                    ZStack {
                        NavigationLink(value: message) {
                            EmptyView()
                        }.opacity(0.0)
                        
                        InboxRowView(message: message)
                    }
                }
            }
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.plain)
            .onChange(of: selectedUser, perform: { newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: Message.self, destination: { message in
                if let user = message.user {
                    ChatView(user: user)
                }
            })
            .navigationDestination(for: Route.self, destination: { route in
                switch route {
                case .profileView(let user): ProfileView(user: user)
                case .chatView(let user): ChatView(user: user)
                }
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        if let user {
                            NavigationLink(value: Route.profileView(user)) {
                                CircularProfileImageView(user: user, size: .xSmall)
                            }
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewMessageView.toggle()
                        selectedUser = nil
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(uiColor: .systemGray5))
                    }
                }
            }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
