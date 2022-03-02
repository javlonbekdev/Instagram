//
//  Like.swift
//  Instagram
//
//  Created by Javlonbek on 13/02/22.
//

import Foundation

class Like: ObservableObject {
    @Published var isLoading = false
    @Published var items: [Post] = []
    
    func apiLikesList(uid: String) {
        isLoading = true
        items.removeAll()
        
        DatabaseStore().loadLikes(uid: uid) { posts in
            self.items = posts!
            self.isLoading = false
        }
    }
    
    func apiLikePost(uid: String, post: Post) {
        DatabaseStore().likeFeedPost(uid: uid, post: post)
        apiLikesList(uid: uid)
    }
    
    func apiRemovePost(uid: String, post: Post) {
        DatabaseStore().removeMyPost(uid: uid, post: post)
        apiLikesList(uid: uid)
    }
}
