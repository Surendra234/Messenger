//
//  ProfileView.swift
//  Messenger
//
//  Created by XP India on 03/08/23.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        VStack {
            // Header
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(Color(uiColor: .systemGray4))
            
            Text("Surendra Mahawar")
                .font(.title2)
                .fontWeight(.semibold)
            
            // List
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) {
                        option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBackgroundColor)
                            
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                
                Section {
                    Button("Log out") {
                        
                    }
                    
                    Button("Delete Account") {
                        
                    }
                }
                .foregroundColor(.red)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
