//
//  InboxRowView.swift
//  Messenger
//
//  Created by XP India on 03/08/23.
//

import SwiftUI

struct InboxRowView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircularProfileImageView(user: User.MOCK_USER, size: .medium)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("ivy")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Hello my friend how are you and when are you coming home")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, alignment: .leading)
            }
            
            HStack {
                Text("yesterday")
                
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
