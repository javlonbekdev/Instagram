//
//  LikePostCell.swift
//  Instagram
//
//  Created by Javlonbek on 12/02/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct LikePostCell: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showingAlert = false
    var viewModel: Like
    var uid: String
    @State var post: Post
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack {
                VStack{
                    if ((post.imgUser?.isEmpty) != nil) {
                        WebImage(url: URL(string: post.imgUser!))
                            .resizable().clipShape(Circle()).scaledToFill().frame(width: 46, height: 46).padding(2)
                    } else {
                        ZStack {
                            Image(systemName: "person").font(.title).foregroundColor(.white)
                        }.frame(width: 46, height: 46).background(.yellow).clipShape(Circle()).padding(2)
                    }
                }.overlay(RoundedRectangle(cornerRadius: 25).stroke(Utils.color2, lineWidth: 2))
                VStack(alignment: .leading, spacing: 3){
                    Text(post.displayName!)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                    Text(post.time!)
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                }.padding(.leading, 15)
                Spacer()
                Button {
                    self.showingAlert = true
                } label: {
                    if uid == post.uid {
                        Image(systemName: "ellipsis")
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .alert(isPresented: $showingAlert) {
                    let title = "Delete"
                    let message = "Do you want to delete this post?"
                    return Alert(title: Text(title), message: Text(message), primaryButton: .destructive(Text("Comfirm"), action: {
                        viewModel.apiRemovePost(uid: uid, post: post)
                    }), secondaryButton: .cancel())
                }
            }.padding(15)
            WebImage(url: URL(string: post.imgPost!))
                .resizable().scaledToFit()
            HStack{
                Button {
                    if post.isLiked! {
                        post.isLiked = false
                    } else {
                        post.isLiked = true
                    }
                    viewModel.apiRemovePost(uid: uid, post: post)
                } label: {
                    if post.isLiked! {
                        Image(systemName: "heart.fill")
                    } else {
                        Image(systemName: "heart")
                    }
                }
                Button {
                    
                } label: {
                    Image(systemName: "bonjour")
                }
                Spacer()
            }.font(.title2).foregroundColor(colorScheme == .dark ? .white : .black).padding()
            Text(post.caption!).padding(10)
        }
    }
}

struct LikePostCell_Previews: PreviewProvider {
    static var previews: some View {
        LikePostCell(viewModel: Like(), uid: "uid", post: Post(caption: "symbolic", imgPost: Utils.image1))
    }
}
