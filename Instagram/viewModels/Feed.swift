//
//  Feed.swift
//  Instagram
//
//  Created by Javlonbek on 12/02/22.
//

import Foundation

class Feed: ObservableObject {
    @Published var isLoading = false
    @Published var items: [Post] = []
    
    func apiFeedList(uid: String) {
        isLoading = true
        items.removeAll()
        
        DatabaseStore().loadFeeds(uid: uid) { posts in
            self.items = posts!
            self.isLoading = false
        }
    }
    
    func apiRemovePost(uid: String, post: Post) {
        DatabaseStore().removeMyPost(uid: uid, post: post)
        apiFeedList(uid: uid)
    }
    
    func apiLikePost(uid: String, post: Post) {
        DatabaseStore().likeFeedPost(uid: uid, post: post)
    }
    
}
