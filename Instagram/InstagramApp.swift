//
//  InstagramApp.swift
//  Instagram
//
//  Created by Javlonbek on 10/02/22.
//

import SwiftUI
import Firebase

@main
struct InstagramApp: App {
    @StateObject var session = SessionStore()
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            Starter()
                .environmentObject(session)
        }
    }
}
