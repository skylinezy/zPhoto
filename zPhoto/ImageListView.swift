//
//  ImageListView.swift
//  zPhoto
//
//  Created by Ryan Zi on 3/31/22.
//

import SwiftUI

struct ImageListControlBar: View {
    var body: some View {
        Text("Image List ToolBar")
    }
}

struct ImageListItem: View {
    
    @ObservedObject var image: ImageItem
    
    var body: some View {
        //GeometryReader {proxy in
            ZStack(alignment: .bottom) {
                Image(image.filename)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(3)
                HStack {
                    BookmarkView(mode: .Small, onChange: {_ in }, checked: $image.marked)
                    StarRatingView(mode: .Small, onChange: {_ in }, currentRating: $image.rating)
                        .padding(1)
                        .disabled(true)
                    Spacer()
                }//: HStack
                .frame(minHeight: 4, maxHeight: 8)
                .padding(.horizontal, 5)
                .padding(.vertical, 5)
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors:[Color(red: 0, green: 0, blue: 0, opacity: 0.0), Color(red: 0, green: 0, blue: 0, opacity: 0.75)]), startPoint: .top, endPoint: .bottom))
            }
            .padding(5)
        //}
        
    }
    
}

struct ImageListView: View {
    @ObservedObject var selected : ContentSelectionModel
    
    var body: some View {
        
        VStack {
            ImageListControlBar()
                .frame(height:20)
                .padding(.vertical, 2)
            
            ScrollView(.horizontal, showsIndicators: true){
                LazyHStack(spacing: 10) {
                    ForEach(fakeImages, id: \.self.id) {image in
                        ZStack{
                            if (selected.selectedImage.id == image.id) {
                                Rectangle()
                                    .stroke(lineWidth: 4.0)
                                    .foregroundColor(.blue)
                                    .background(Color.clear)
                                    .cornerRadius(4)
                            }
                            ImageListItem(image:image)
                                .frame(minWidth: 120)
                                .onTapGesture{
                                    selected.selectedImage = image
                                    selected.hasSelection = true
                                }
                        }
                    } //:ForEach
                } //:LazyHStack
            } //:SCROLLVIEW
        } //:VSTACK
    }
}

struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        Text("hello")
    }
}
