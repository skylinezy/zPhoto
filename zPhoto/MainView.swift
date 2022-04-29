//
//  MainView.swift
//  zPhoto
//
//  Created by Ryan Zi on 3/31/22.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var sourceModel : SourceModel = .init()
    
    var body: some View {
        NavigationView {
            DirectoryView()
                .frame(minWidth: 200)
                .environmentObject(sourceModel)
            
            ContentsView()
                .frame(minWidth: 1200)
                .environmentObject(sourceModel)
        }
        .frame(minWidth: 800, minHeight: 600)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .frame(width: 800, height: 600)
    }
}
