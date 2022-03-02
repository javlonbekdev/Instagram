//
//  HomeUpload.swift
//  Instagram
//
//  Created by Javlonbek on 11/02/22.
//

import SwiftUI

struct HomeUpload: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var tabSelection: Int
    @EnvironmentObject var session: SessionStore
    @ObservedObject var viewModel = Upload()
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var showActionSheet = false
    @State private var isImagePickerDisplay = false
    @State private var wi = UIScreen.main.bounds.width
    @State var caption = ""
    
    func uploadPost() {
        if caption.isEmpty || selectedImage == nil {
            return
        }
        let uid = (session.session?.uid)!
        viewModel.apiUploadPost(uid: uid, caption: caption, image: selectedImage!) { result in
            if result {
                self.selectedImage = nil
                self.caption = ""
                self.tabSelection = 0
            }
        }
    }
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    ZStack(alignment: .topTrailing){
                        if selectedImage != nil {
                            Image(uiImage: selectedImage!)
                                .resizable().scaledToFit()
                            Button {
                                selectedImage = nil
                            } label: {
                                Image(systemName: "clear").font(.title).foregroundColor(.white).padding()
                            }
                        } else {
                            Button {
                                showActionSheet = true
                            } label: {
                                Image(systemName: "camera").frame(maxWidth: wi).frame(height: wi).font(.title).foregroundColor(colorScheme == .dark ? .white : .black)
                            }.actionSheet(isPresented: $showActionSheet) {
                                ActionSheet(
                                    title: Text("Actions"),
                                    buttons: [
                                        .cancel{ print(self.showActionSheet) },
                                        .default(Text("My Photo"), action: {
                                            self.sourceType = .photoLibrary
                                            self.isImagePickerDisplay.toggle()
                                        }),
                                        .default(Text("Take Photo"), action: {
                                            self.sourceType = .camera
                                            self.isImagePickerDisplay.toggle()
                                        })
                                    ])
                            }
                            .sheet(isPresented: self.$isImagePickerDisplay) {
                                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                            }
                        }
                        
                    }.background(.gray.opacity(0.2)).padding(.top, 1)
                    TextField("Caption", text: $caption).padding()
                    Spacer()
                }
                .navigationTitle(Text("Upload"))
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {
                    self.uploadPost()
                }, label: {
                    Image(systemName: "square.and.arrow.up").foregroundColor(.blue)
            }))
            }
        }
    }
}

struct HomeUpload_Previews: PreviewProvider {
    static var previews: some View {
        HomeUpload(tabSelection: .constant(0))
    }
}
