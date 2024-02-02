//
//  UserView.swift
//  TestAppSwiftUI
//
//  Created by shaiju on 10/01/24.
//

import SwiftUI

struct UserView: View {
    @Binding var user: Users
    @State var image: UIImage?
    
    var body: some View {
        HStack(alignment: .top, spacing: 10){
            Image(uiImage: image ?? UIImage() )
                .resizable()
                .frame(width: 100,height: 100)
                .onAppear {
                    user.uiImage = { image in
                        self.image = image
                    }
                }
            VStack(alignment: .leading) {
                Text("Name: \(user.firstName ?? "") \(user.lastName ?? "")").font(.system(size: 18, weight: .semibold))
                Text("Age: \(user.age ?? 0)")
                Text("Gender: \(user.gender ?? "")")
                Text("Email: \(user.email ?? "")")
                    .font(.system(size: 14, weight: .regular))
            }
            Spacer()
            
        }.padding()
            .background {
                Color.blue.opacity(0.1)
                    .cornerRadius(3)
                    .shadow(radius: 5, x: 3, y: 3)
            }
        
    }
}

