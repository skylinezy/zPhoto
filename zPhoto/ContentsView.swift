//
//  ContentsView.swift
//  zPhoto
//
//  Created by Ryan Zi on 3/31/22.
//

import SwiftUI

let kIconSize: CGFloat = 18

enum StarRate: Int8, Comparable{
    static func < (lhs: StarRate, rhs: StarRate) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    case Zero   = 0
    case One    = 1
    case Two    = 2
    case Three  = 3
    case Four   = 4
    case Five   = 5
}

struct ImageControlBar: View {
    @Binding var zoomLevel : Int8
    var onNext: () -> Void
    var onPrev: () -> Void
    
    var body: some View {
        HStack(spacing: 20){
            Button(action:{
                onPrev()
            }) {
                Image(systemName: "chevron.left")
                    .font(Font.system(size: kIconSize, weight: .regular))
                    .foregroundColor(.white)
            }
            .buttonStyle(.plain)
            
            Button(action:{
                if (zoomLevel < 5) {
                    zoomLevel += 1;
                }
            }) {
                Image(systemName: "plus.magnifyingglass")
                    .font(Font.system(size: kIconSize, weight: .regular))
                    .foregroundColor(.white)
                
            }
            .buttonStyle(.plain)
            
            Button(action:{
                if (zoomLevel > 0) {
                    zoomLevel -= 1;
                }
            }) {
                Image(systemName: "minus.magnifyingglass")
                    .font(Font.system(size: kIconSize, weight: .regular))
                    .foregroundColor(.white)
            }
            .buttonStyle(.plain)
            
            Button(action:{
                onNext()
            }) {
                Image(systemName: "chevron.right")
                    .font(Font.system(size: kIconSize, weight: .regular))
                    .foregroundColor(.white)
            }
            .buttonStyle(.plain)
        }
    }
}

enum MarkersViewMode: Int8 {
    case Large = 0
    case Small = 1
}

struct BookmarkView: View {
    var mode: MarkersViewMode = .Large
    var onChange: (Bool) -> Void
    @Binding var checked: Bool
    
    var body: some View {
        if (mode == .Large) {
            Button(action:{
                checked.toggle()
            }) {
                Image(systemName: checked ? "bookmark.fill" : "bookmark")
                    .font(Font.system(size: kIconSize, weight: .regular))
                    .foregroundColor(.white)
            }
            .buttonStyle(.plain)
        } else {
            Image(systemName: checked ? "bookmark.fill" : "bookmark")
                .resizable()
                .scaledToFit()
        }
    }
}

struct StarRatingView: View {
    var mode: MarkersViewMode = .Large
    var onChange: (StarRate) -> Void
    @Binding var currentRating: StarRate
    
    func getIconName(isFill : Bool) -> String {
        if (mode == .Large){
            if (isFill == true) {
                return "star.fill"
            }  else {
                return "star"
            }
        } else {
            if (isFill == true) {
                return "circle.fill"
            } else {
                return "circle"
            }
        }
    }
    var body: some View {
        HStack(spacing: mode == .Large ? 8 : 3) {
            Image(systemName: getIconName(isFill: currentRating > .Zero))
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .onTapGesture{
                    if (currentRating == .One) {
                        currentRating = .Zero
                    } else {
                        currentRating = .One
                    }
                    onChange(currentRating)
                }
            Image(systemName: getIconName(isFill: currentRating > .One))
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .onTapGesture{
                    if (currentRating == .Two) {
                        currentRating = .Zero
                    } else {
                        currentRating = .Two
                    }
                    onChange(currentRating)
                }
            Image(systemName: getIconName(isFill: currentRating > .Two))
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .onTapGesture{
                    if (currentRating == .Three) {
                        currentRating = .Zero
                    } else {
                        currentRating = .Three
                    }
                    onChange(currentRating)
                }
            Image(systemName: getIconName(isFill: currentRating > .Three))
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .onTapGesture{
                    if (currentRating == .Four) {
                        currentRating = .Zero
                    } else {
                        currentRating = .Four
                    }
                    onChange(currentRating)
                }
            Image(systemName: getIconName(isFill: currentRating > .Four))
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .onTapGesture{
                    if (currentRating == .Five) {
                        currentRating = .Zero
                    } else {
                        currentRating = .Five
                    }
                    onChange(currentRating)
                }
        }
    }
}

struct ImageFormatLabel: View {
    var format : String = "JPEG"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .stroke(lineWidth: 2)
                .background(Color(red: 74/255.0, green: 74/255.0, blue: 74/255.0, opacity: 0.9))
                
            Text(format)
                .font(.footnote)
                .fontWeight(.semibold)
        }
        .frame(width: 35, height: 15)
    }
}

struct ImageSummaryView: View {
    @Binding var imageItem: ImageItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5){
            HStack{
                Text(imageItem.filename)
                    .font(.title)
                ImageFormatLabel(format: "JPEG")
                ImageFormatLabel(format: "RAW")
            }
            Text("3820 x 1980")
            Text("\(imageItem.exifInfo.FNumber) / \(imageItem.exifInfo.FocalLength) / ISO\(imageItem.exifInfo.ISOSpeed) / \(imageItem.exifInfo.ShutterSpeed)")
        }
    }
}

class ContentSelectionModel: ObservableObject {
    @Published var selectedImage : ImageItem = placeholderImage
    @Published var hasSelection : Bool = false
}

struct ContentsView: View {
    @ObservedObject var viewModel : ContentSelectionModel = ContentSelectionModel()
    
    @State var showingDetailInfo: Bool = false
    @State var zoomLevel: Int8 = 0
    
    var body: some View {
        VSplitView {
            ZStack(alignment: .bottom) {
                
                Image(viewModel.selectedImage.filename)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
                    .padding(10)
                    .shadow(radius: 10)
                
                ZStack(alignment: .bottom) {
                    ImageControlBar(zoomLevel: $zoomLevel, onNext: {}, onPrev: {})
                    
                    HStack(alignment: .bottom, spacing: 20) {
                        
                        ImageSummaryView(imageItem: $viewModel.selectedImage)
                            .frame(width: 250)
                            .offset(x: showingDetailInfo ? -300 : 0)

                        Button(action:{
                            showingDetailInfo.toggle()
                        }) {
                            Image(systemName: showingDetailInfo ? "info.circle.fill": "info.circle")
                                .font(Font.system(size: kIconSize, weight: .regular))
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.plain)
                        
                        Button(action:{
                            
                        }) {
                            Image(systemName: "square.and.arrow.up")
                                .font(Font.system(size: kIconSize, weight: .regular))
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.plain)
                        
                        Spacer()
                    }//: HStack
                    
                    HStack {
                        Spacer()
                        
                        BookmarkView(mode: .Large, onChange: {_ in }, checked: $viewModel.selectedImage.marked)
                        
                        StarRatingView(mode: .Large, onChange: {_ in }, currentRating: $viewModel.selectedImage.rating)
                            .frame(height: 20)
                        
                    }//: HStack
                }//: ZStack
                .padding(.horizontal, 30)
                .padding(.vertical, 20)
                .background(LinearGradient(gradient: Gradient(colors:[Color(red: 0, green: 0, blue: 0, opacity: 0.0), Color(red: 0, green: 0, blue: 0, opacity: 0.75)]), startPoint: .top, endPoint: .bottom))
                
            }//: ZStack
            .frame(minHeight: 600)
            .opacity(viewModel.hasSelection ? 1.0 : 0.0)
            .overlay(
                ImageDetailInfoView(info: $viewModel.selectedImage)
                    .frame(width: 220, alignment: .leading)
                    .padding(.horizontal, 30)
                    .padding(.top, 50)
                    .background(LinearGradient(gradient: Gradient(colors:[Color(red: 0, green: 0, blue: 0, opacity: 0.0), Color(red: 0, green: 0, blue: 0, opacity: 0.95)]), startPoint: .trailing, endPoint: .leading))
                    .opacity(showingDetailInfo ? 1.0 : 0.0)
                , alignment: .leading)
            
            ImageListView(selected: viewModel)
                .frame(minHeight: 100)
                .padding(.vertical, 20)
        }
        .background(Color.black)
    }
}

struct ImageSummaryView_PreviewHelper: View {
    @State var imageItem: ImageItem = fakeImages[0]
    var body: some View {
        ImageSummaryView(imageItem: $imageItem)
    }
}
struct ContentsView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            
            ImageSummaryView_PreviewHelper()
                .previewLayout(.sizeThatFits)
                .padding(20)
            
            ImageFormatLabel(format: "RAW")
                .previewLayout(.sizeThatFits)
                .padding(5)
            
            ImageFormatLabel()
                .previewLayout(.sizeThatFits)
                .padding(5)
        }
    }
}


