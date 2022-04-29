//
//  DirectoryView.swift
//  zPhoto
//
//  Created by Ryan Zi on 3/31/22.
//

import SwiftUI

struct DirectoryView: View {
    @EnvironmentObject var sourceModel : SourceModel
    
    var body: some View {
        VStack {
            SourceView(title: "FUJI_1")
            SourceView(title: "FUJI_2")
        }
    }
}

struct DirectoryView_Previews: PreviewProvider {
    static var previews: some View {
        DirectoryView()
    }
}
