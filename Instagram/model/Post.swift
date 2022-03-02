//
//  Post.swift
//  Instagram
//
//  Created by Javlonbek on 12/02/22.
//

import Foundation

struct Post: Hashable {
    var id = UUID()
    
    var postId: String? = ""
    var caption: String? = ""
    var imgPost: String? = ""
    var time: String? = "February 13, 2021"
    
    var uid: String? = ""
    var displayName: String? = "javlonbek"
    var imgUser: String? = ""
    
    var isLiked: Bool? = false
    
    init(caption: String?, imgPost: String?) {
        self.caption = caption
        self.imgPost = imgPost
    }
    
    init(postId: String, caption: String?, imgPost: String?) {
        self.postId = postId
        self.caption = caption
        self.imgPost = imgPost
    }
}
