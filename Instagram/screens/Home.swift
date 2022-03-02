//
//  Home.swift
//  InstaClone
//
//  Created by Javlonbek on 10/02/22.
//

import SwiftUI

struct Home: View {
    @State private var tabSelection = 0
    var body: some View {
        TabView {
            HomeFeed(tabSelection: $tabSelection).tabItem {
                Image(systemName: "house")
            }.tag(0)
            HomeSearch().tabItem {
                Image(systemName: "magnifyingglass")
            }.tag(1)
            HomeUpload(tabSelection: $tabSelection).tabItem {
                Image(systemName: "camera")
            }.tag(2)
            HomeLike(tabSelection: $tabSelection).tabItem {
                Image(systemName: "heart")
            }.tag(3)
            HomeProfile().tabItem {
                Image(systemName: "person")
            }.tag(4)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
