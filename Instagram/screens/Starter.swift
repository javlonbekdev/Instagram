//
//  ContentView.swift
//  InstaClone
//
//  Created by Javlonbek on 10/02/22.
//

import SwiftUI

struct Starter: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        VStack{
            if session.session != nil {
                Home()
            } else {
                SignIn()
            }
        }.onAppear {
            session.listen()
        }
    }
}

struct Starter_Previews: PreviewProvider {
    static var previews: some View {
        Starter().environmentObject(SessionStore())
    }
}
