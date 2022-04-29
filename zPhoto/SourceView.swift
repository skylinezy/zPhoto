//
//  SourceView.swift
//  zPhoto
//
//  Created by Ryan Zi on 3/31/22.
//

import SwiftUI

struct FolderItem: Hashable {
    var icon: String
    var label: String
    var level: Int
}

struct SourceHeader: View {
    var label: String
    var icon: String
    var accessoryIcon: String?
    var accessoryAction: () -> Void
    
    var body: some View {
        HStack(spacing: 0){
            Image(systemName: icon)
                .font(Font.system(size: 18, weight: .regular))
                .foregroundColor(.white)
                .padding(.horizontal, 5)
            Text(label)
                .font(.title2)
                .padding(.horizontal, 5)
                .padding(.vertical, 3)
            
            Spacer()
            
            if (accessoryIcon != nil) {
                
                Button(action: {
                    accessoryAction()
                }) {
                Image(systemName: accessoryIcon!)
                    .font(Font.system(size: 16, weight: .regular))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 5)
                }
                .buttonStyle(.plain)
                
            }
        }
        .padding(.vertical, 5)
    }
}

struct FolderItemView: View {
    let indent: CGFloat = 10
    var item: FolderItem
    
    var body: some View {
        HStack{
            Image(systemName: item.icon)
                .font(.body)
                .foregroundColor(Color.white)
                .padding(.leading, CGFloat(item.level) * indent)
            Text(item.label)
                .fontWeight(.regular)
                .padding(.horizontal, 2)
            Spacer()
        }
    }
}

struct SourceView: View {
    let fake_Folders : [FolderItem] = [
        .init(icon: "folder.fill", label: "DCIM", level: 1),
        .init(icon: "folder.fill", label: "FUJI_001", level: 2),
        .init(icon: "folder.fill", label: "JPEG", level:3)
    ]
    
    var title : String = "SourceView"
    @State var selectedLabel : String = ""
    
    var body: some View {
        VStack(spacing: 2) {
            SourceHeader(label: title, icon: "sdcard.fill", accessoryIcon: "eject.fill", accessoryAction: {})
            List {
                ForEach(fake_Folders, id: \.self) { folderItem in
                    FolderItemView(item: folderItem)
                    .padding(.vertical, 5)
                    .background(Rectangle()
                                    .fill()
                                    .foregroundColor(selectedLabel == folderItem.label ? Color.blue : Color.clear)
                                    .cornerRadius(4))
                    .onTapGesture{
                        selectedLabel = folderItem.label
                    }
                }
            }
        }
    }
}

struct SourceView_Previews: PreviewProvider {
    static var previews: some View {
        SourceView(title: "preview view")
    }
}
