//
//  HomeFeed.swift
//  Instagram
//
//  Created by Javlonbek on 11/02/22.
//

import SwiftUI

struct HomeFeed: View {
    @Binding var tabSelection: Int
    @ObservedObject var viewModel = Feed()
    @EnvironmentObject var session: SessionStore
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(viewModel.items, id: \.self) { item in
                        if let uid = session.session?.uid!{
                            PostCell(viewModel: viewModel, uid: uid, post: item).listRowInsets(EdgeInsets())
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
                    viewModel.apiFeedList(uid: uid)
                }
            }
        }
    }
}

struct HomeFeed_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeed(tabSelection: .constant(0))
    }
}
