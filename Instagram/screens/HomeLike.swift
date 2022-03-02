//
//  HomeLike.swift
//  Instagram
//
//  Created by Javlonbek on 11/02/22.
//

import SwiftUI

struct HomeLike: View {
    @Binding var tabSelection: Int
    @ObservedObject var viewModel = Like()
    @EnvironmentObject var session: SessionStore
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(viewModel.items, id: \.self) { item in
                        if let uid = session.session?.uid!{
                            LikePostCell(viewModel: viewModel, uid: uid, post: item).listRowInsets(EdgeInsets())
                        }
                    }
                }.listStyle(PlainListStyle())
                if viewModel.isLoading {
                    ProgressView()
                }
            }
            .navigationTitle("instagram").navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Image(systemName: "camera").font(.subheadline)
            }.onAppear {
                if let uid = session.session?.uid! {
                    viewModel.apiLikesList(uid: uid)
                }
            }
        }
    }
}

struct HomeLike_Previews: PreviewProvider {
    static var previews: some View {
        HomeLike(tabSelection: .constant(0))
    }
}
