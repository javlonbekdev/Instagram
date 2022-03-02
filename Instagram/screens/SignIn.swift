//
//  SignIn.swift
//  Instagram
//
//  Created by Javlonbek on 11/02/22.
//

import SwiftUI

struct SignIn: View {
    @EnvironmentObject var session: SessionStore
    @State var isLoading = false
    @State var email = ""
    @State var password = ""
    
    func apiSignIn(email: String, password: String, completion: @escaping (Bool) -> ()){
            isLoading = true
            session.signIn(email: email, password: password, handler: {(res,err) in
                self.isLoading = false
                if err != nil {
                    print("Check email or password")
                    completion(false)
                }else{
                    print("User signed in")
                    completion(true)
                }
            })
        }
    
    var body: some View {
            NavigationView{
                VStack{
                    Spacer()
                    Text("Instagram").font(.custom("Billabong", size: 60))
                    TextField("email", text: $email).padding().background(.gray.opacity(0.05))
                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(.gray.opacity(0.3), lineWidth: 1))
                    SecureField("password", text: $password).padding()
                        .background(.gray.opacity(0.05))
                        .overlay(RoundedRectangle(cornerRadius: 4).stroke(.gray.opacity(0.3), lineWidth: 1))
                    Button {
                        if email.count > 5 && password.count > 5 {
                            apiSignIn(email: email, password: password) { result in
                                if !result {
                                    
                                }
                            }
                        }
                    } label: {
                        
                        Text("log_in").padding().frame(maxWidth: .infinity).foregroundColor(.white).background(.blue.opacity(email.count > 5 && password.count > 5 ?  1 : 0.5))
                            .cornerRadius(4)
                    }
                    Spacer()
                    HStack{
                        Text("dont_have_account").foregroundColor(.gray)
                        
                        NavigationLink {
                            SignUp()
                        } label: {
                            Text("sign_up").bold()
                        }
                    }
                }
                .padding()
                .navigationBarHidden(true)
                if isLoading {
                    ProgressView()
                }
            }
            .navigationBarBackButtonHidden(true).navigationBarHidden(true)
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn().colorScheme(.dark)
    }
}
