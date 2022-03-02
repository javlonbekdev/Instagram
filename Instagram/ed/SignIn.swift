//
//  SignIn.swift
//  InstaClone
//
//  Created by Javlonbek on 10/02/22.
//

import SwiftUI

struct SignIn: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        NavigationView{
            VStack{
                Text("Instagram").font(.custom("Billabong", size: 60))
                TextField("email", text: $email).padding().background(.gray.opacity(0.05))
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(.gray.opacity(0.3), lineWidth: 1))
                SecureField("password", text: $password).padding()
                    .background(.gray.opacity(0.05))
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(.gray.opacity(0.3), lineWidth: 1))
                Button {
                    
                } label: {
                    Text("Sig")
                }

            }.padding()
                .navigationBarHidden(true)
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
