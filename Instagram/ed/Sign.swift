//
//  Sign.swift
//  InstaClone
//
//  Created by Javlonbek on 10/02/22.
//

import SwiftUI


struct Sign: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("app_name").padding().font(.custom("Billabong", size: 60)).padding()
                NavigationLink("create_new_account") {
                    SignUp()
                }.frame(maxWidth: .infinity).padding(14).background(.blue)
                    .foregroundColor(.white).cornerRadius(5).padding(.horizontal, 30)
                NavigationLink("log_in") {
                    SignIn()
                }.padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct Sign_Previews: PreviewProvider {
    static var previews: some View {
        Sign()
    }
}
