//
//  ImageDetailInfoView.swift
//  zPhoto
//
//  Created by Ryan Zi on 4/6/22.
//

import SwiftUI

struct ImageInfoRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack(alignment: .top){
            Text(title)
                .fontWeight(.semibold)
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 5)
    }
}

struct ImageDetailInfoView: View {
    @Binding var info: ImageItem
    
    var body: some View {
        
        VStack{
            HStack{
                Text(info.filename)
                    .font(.title)
                    .padding(.vertical, 10)
                ForEach(info.formats, id: \.self) { format in
                    ImageFormatLabel(format: format)
                }
            }
            
            ScrollView {
                ImageInfoRow(title: "Resolution", value: "3850 X 2040")
                ImageInfoRow(title: "Focus", value: info.exifInfo.FocalLength)
                ImageInfoRow(title: "Aperture", value: info.exifInfo.Aperture)
                ImageInfoRow(title: "ISO", value: info.exifInfo.ISOSpeed)
                ImageInfoRow(title: "Shutter Speed", value: info.exifInfo.ShutterSpeed)
                Rectangle()
                    .frame(height: 20)
                    .background(Color.clear)
                    .foregroundColor(.clear)
                ImageInfoRow(title: "Camera", value: info.exifInfo.Manufacturer + info.exifInfo.Model)
                ImageInfoRow(title: "Captured On", value: info.exifInfo.CaptureTime)
            }
        }
    }
}

struct ImageDetailInfoView_PreviewHelper: View {
    @State var imageItem: ImageItem = fakeImages[3]
    var body: some View {
        ImageDetailInfoView(info: $imageItem)
    }
}

struct ImageDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDetailInfoView_PreviewHelper()
    }
}
