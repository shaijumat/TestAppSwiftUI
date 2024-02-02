//
//  UserDetailsView.swift
//  TestAppSwiftUI
//
//  Created by shaiju on 17/01/24.
//

import SwiftUI

struct UserDetailsView: View {
    
    @Binding var user: Users?
    @State var image: UIImage?
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(uiImage: image ?? UIImage())
                .resizable()
                .frame(width: 100, height: 100)
                .onAppear {
                    user?.uiImage = { image in
                        self.image = image
                    }
                }
            
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Name: \(user?.firstName ?? "") \(user?.lastName ?? "")")
                    Text("Age: \(user?.age ?? 0)")
                    Text("Gender: \(user?.gender ?? "")")
                    Text("Date of birth: \(user?.birthDate ?? "")")
                    Text("Blood Group: \(user?.bloodGroup ?? "")")
                    
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email: \(user?.email ?? "")")
                        .font(.footnote.bold())
                    Text("Phone: \(user?.phone ?? "")")
                        .font(.footnote.bold())
                    
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("Address: \(user?.address?.address ?? ""), \(user?.address?.city ?? ""), \(user?.address?.postalCode ?? "") \n \(user?.address?.state ?? "")")
                        .font(.footnote.bold())
                    Text("Company Address: \(user?.company?.address?.address ?? ""), \(user?.company?.address?.city ?? ""), \(user?.company?.address?.postalCode ?? "") \n \(user?.company?.address?.state ?? "")")
                        .font(.footnote.bold())
                }
                
            }
            
            Spacer()
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("User Details")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background {
            Color.blue.opacity(0.1)
                .cornerRadius(3)
                .shadow(radius: 5, x: 3, y: 3)
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: .constant(nil))
    }
}

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
