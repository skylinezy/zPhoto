//
//  ContentsView.swift
//  zPhoto
//
//  Created by Ryan Zi on 3/31/22.
//

import SwiftUI

let kIconSize: CGFloat = 18

enum MarkersViewMode: Int8 {
    case Large = 0
    case Small = 1
}

struct ImageControlBar: View {
    @EnvironmentObject var sourceModel : SourceModel
    @ObservedObject var viewModel: ContentSelectionModel
    
    @Binding var zoomLevel : Int8
    var onNext: () -> Void
    var onPrev: () -> Void
    
    var body: some View {
        HStack(spacing: 20){
            Button(action:{
                viewModel.selectedImage = sourceModel.prev()
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
                viewModel.selectedImage = sourceModel.next()
            }) {
                Image(systemName: "chevron.right")
                    .font(Font.system(size: kIconSize, weight: .regular))
                    .foregroundColor(.white)
            }
            .buttonStyle(.plain)
        }
    }
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
                ForEach(imageItem.formats, id: \.self) { format in
                    ImageFormatLabel(format: format)
                }
            }
            Text("3820 x 1980")
            Text("\(imageItem.exifInfo.FNumber) / \(imageItem.exifInfo.FocalLength) / ISO\(imageItem.exifInfo.ISOSpeed) / \(imageItem.exifInfo.ShutterSpeed)")
        }
    }
}

struct ToolbarView: View {
    @EnvironmentObject var sourceModel : SourceModel
    @ObservedObject var viewModel: ContentSelectionModel
    
    @Binding var zoomLevel: Int8
    @Binding var showingDetailInfo: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageControlBar(viewModel:viewModel, zoomLevel: $zoomLevel, onNext: {}, onPrev: {})
                .environmentObject(sourceModel)
            
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
    }
}

// Selection model
class ContentSelectionModel: ObservableObject {
    @Published var selectedImage : ImageItem = placeholderImage
    @Published var hasSelection : Bool = false
}

class SourceModel: ObservableObject {
    private var currentIndex : Int = 0
    @Published var imageItems : [ImageItem] = []
    @Published var primaryDirPath : String {
        didSet {
            
        }
    }
    @Published var secondaryDirPath: String {
        didSet {
            
        }
    }
    
    init() {
        imageItems = fakeImages
        primaryDirPath = ""
        secondaryDirPath = ""
    }
    
    func next() -> ImageItem {
        currentIndex += 1
        currentIndex = min(currentIndex, imageItems.count-1)
        return imageItems[currentIndex]
    }
    func prev() -> ImageItem {
        currentIndex -= 1
        currentIndex = max(0, currentIndex)
        return imageItems[currentIndex]
    }
    
}

struct ContentsView: View {
    @EnvironmentObject var sourceModel : SourceModel
    @ObservedObject var viewModel : ContentSelectionModel = ContentSelectionModel()
    
    @State var showingDetailInfo: Bool = false
    @State var zoomLevel: Int8 = 0
    
    @GestureState var magnifyFactor = 1.0
    
    var magnification: some Gesture {
        MagnificationGesture()
            .updating($magnifyFactor) {currentState, gestureState, transaction in
                gestureState = currentState
            }
    }
    
    var body: some View {
        VSplitView {
            GeometryReader {proxy in
                ZStack(alignment: .bottom) {
                    Image(viewModel.selectedImage.filename)
                        .resizable()
                        .aspectRatio(contentMode: magnifyFactor > 1.0 ? .fill : .fit)
                        .scaleEffect(magnifyFactor)
                        .cornerRadius(5)
                        .padding(15)
                        .shadow(radius: 10)
                        .gesture(magnification)
                }//: ZStack
                .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center) // GeometryReader uses top alignment for all its subviews. Force the subviews to aligned center.
            }//:
            .frame(minHeight: 600)
            .opacity(viewModel.hasSelection ? 1.0 : 0.0)
            .overlay(
                ZStack(alignment: .bottomLeading) {
                    if (viewModel.hasSelection) {
                        ToolbarView(viewModel: viewModel, zoomLevel: $zoomLevel, showingDetailInfo: $showingDetailInfo)
                            .environmentObject(sourceModel)
                    }
                    
                    ImageDetailInfoView(info: $viewModel.selectedImage)
                        .frame(width: 220, alignment: .leading)
                        .padding(.horizontal, 30)
                        .padding(.top, 50)
                        .background(LinearGradient(gradient: Gradient(colors:[Color(red: 0, green: 0, blue: 0, opacity: 0.0), Color(red: 0, green: 0, blue: 0, opacity: 0.95)]), startPoint: .trailing, endPoint: .leading))
                        .opacity(showingDetailInfo ? 1.0 : 0.0)
                        .animation(.easeIn(duration: 0.1))
                }
                , alignment: .leading)
            
            ImageListView(selected: viewModel)
                .frame(minHeight: 100)
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
