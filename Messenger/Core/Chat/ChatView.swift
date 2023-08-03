//
//  ChatView.swift
//  Messenger
//
//  Created by XP India on 03/08/23.
//

import SwiftUI

struct ChatView: View {
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                // Header
                VStack {
                    CircularProfileImageView(user: User.MOCK_USER, size: .xLarge)
                    
                    VStack(spacing: 4) {
                        Text("Gaurav Mahawar")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Messenger")
                            .font(.footnote)
                            .foregroundColor(Color(.gray))
                    }
                }
                
                // Messages
                
            }
            // Messages input view
            Spacer()
            
            ZStack(alignment: .trailing) {
                TextField("Message...", text: $messageText, axis: .vertical)
                    .padding(12)
                    .padding(.trailing, 48)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                    .font(.subheadline)
                
                Button {
                    print("send message")
                } label: {
                    Text("Send")
                        .fontWeight(.semibold)
                }
                .padding(.horizontal)
            }
            .padding()

        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
