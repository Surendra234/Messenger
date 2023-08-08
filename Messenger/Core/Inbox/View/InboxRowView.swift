//
//  InboxRowView.swift
//  Messenger
//
//  Created by XP India on 03/08/23.
//

import SwiftUI

struct InboxRowView: View {
    let message: Message
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView(user: message.user, size: .medium)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(message.user?.fullName ?? "")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(message.message)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text(message.timestampString)
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

//struct InboxRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        InboxRowView()
//    }
//}
