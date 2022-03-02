//
//  SignUp.swift
//  InstaClone
//
//  Created by Javlonbek on 10/02/22.
//

import SwiftUI

struct SignUp: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var session: SessionStore
    @State var isLoading = false
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    @State var cpassword = ""
    
    func apiSignUp(email: String, password: String, completion: @escaping (Bool) -> ()){
        isLoading = true
        session.signUp(email: email, password: password, handler: {(res,err) in
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
                TextField("fullname", text: $fullname).padding()
                    .background(.gray.opacity(0.05))
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(.gray.opacity(0.3), lineWidth: 1))
                TextField("email", text: $email).padding().background(.gray.opacity(0.05))
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(.gray.opacity(0.3), lineWidth: 1))
                SecureField("password", text: $password).padding()
                    .background(.gray.opacity(0.05))
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(.gray.opacity(0.3), lineWidth: 1))
                SecureField("cpassword", text: $cpassword).padding()
                    .background(.gray.opacity(0.05))
                    .overlay(RoundedRectangle(cornerRadius: 4).stroke(.gray.opacity(0.3), lineWidth: 1))
                Button {
                    if email.count > 5 && password.count > 5 && password == cpassword {
                        apiSignUp(email: email, password: password) { result in
                            if !result {
                                
                            } else {
                                var user = User(email: email, displayName: fullname, password: password, imgUser: "")
                                user.uid = session.session?.uid
                                DatabaseStore().storeUser(user: user)
                                presentation.wrappedValue.dismiss()
                            }
                        }
                    }
                } label: {
                    Text("sign_up").padding().frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(.blue.opacity(email.count > 5 && password.count > 5 && password == cpassword ? 1 : 0.5))
                        .cornerRadius(4)
                    
                    
                }
                Spacer()
                VStack {
                    Spacer()
                    HStack{
                        Text("dont_have_account").foregroundColor(.gray)
                        
                        Button {
                            presentation.wrappedValue.dismiss()
                        } label: {
                            Text("sign_in").bold()
                        }
                        
                    }
                }
                
            }.padding()
                .navigationBarHidden(true)
            if isLoading {
                ProgressView()
            }
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
