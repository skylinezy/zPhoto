//
//  ImageItem.swift
//  zPhoto
//
//  Created by Ryan Zi on 4/10/22.
//

import Foundation

struct EXIFInfo{
    var Aperture: String = ""
    var ExposureTime: String = ""
    var ExposureMode: String = ""
    var ExposureBias: String = ""
    var ExposureProgram: String = ""
    var FNumber: String = ""
    var FocalLength: String = ""
    var ISOSpeed: String = ""
    var ShutterSpeed: String = ""
    var WhiteBalance: String = ""
    var CaptureTime: String = ""
    var Manufacturer: String = ""
    var Model: String = ""
}

class ImageItem: Identifiable, ObservableObject{
    var id: String
    var filename: String
    @Published var formats: [String]
    @Published var marked: Bool
    @Published var rating: StarRate
    var exifInfo: EXIFInfo
    
    init(id: String, filename: String, formats: Array<String>, marked: Bool, rating: StarRate, exifInfo: EXIFInfo) {
        self.id = id
        self.filename = filename
        self.formats = formats
        self.marked = marked
        self.rating = rating
        self.exifInfo = exifInfo
    }
}
