import Foundation

let placeholderImage : ImageItem = ImageItem(
    id: "0",
    filename : "PlaceholderImage",
    formats: ["JPEG"],
    marked : false,
    rating : .Zero,
    exifInfo : EXIFInfo(
        Aperture : "2.0",
        ExposureTime : "1/2000s",
        ExposureMode : "Auto",
        ExposureBias : "0 EV",
        ExposureProgram : "Auto",
        FNumber : "F2.0",
        FocalLength: "16mm",
        ISOSpeed : "400",
        ShutterSpeed : "1/2000s",
        WhiteBalance : "Auto",
        CaptureTime : "Jan 23 2022 15:23:34",
        Manufacturer : "Canon",
        Model : "6D Mark II"
    )
)

let fakeImages : [ImageItem] = [
  ImageItem(
    id: "1",
    filename : "ImageList1",
    formats: ["JPEG"],
    marked : true,
    rating : .Zero,
    exifInfo : EXIFInfo(
        Aperture : "2.0",
        ExposureTime : "1/2000s",
        ExposureMode : "Auto",
        ExposureBias : "0 EV",
        ExposureProgram : "Auto",
        FNumber : "F2.0",
        FocalLength: "16mm",
        ISOSpeed : "400",
        ShutterSpeed : "1/2000s",
        WhiteBalance : "Auto",
        CaptureTime : "Jan 23 2022 15:23:34",
        Manufacturer : "Canon",
        Model : "6D Mark II"
    )
  ),
  ImageItem(
    id: "2",
    filename : "ImageList2",
    formats: ["RAW", "JPEG"],
    marked : true,
    rating : .One,
    exifInfo : EXIFInfo(
        Aperture : "2.0",
        ExposureTime : "1/2000s",
        ExposureMode : "Auto",
        ExposureBias : "0 EV",
        ExposureProgram : "Auto",
        FNumber : "F2.0",
        FocalLength: "16mm",
        ISOSpeed : "400",
        ShutterSpeed : "1/2000s",
        WhiteBalance : "Auto",
        CaptureTime : "Jan 23 2022 15:23:34",
        Manufacturer : "Canon",
        Model : "6D Mark II"
    )
  ),
  ImageItem(
    id: "3",
    filename : "ImageList3",
    formats: ["RAW", "JPEG"],
    marked : false,
    rating : .Two,
    exifInfo : EXIFInfo(
        Aperture : "2.0",
        ExposureTime : "1/2000s",
        ExposureMode : "Auto",
        ExposureBias : "0 EV",
        ExposureProgram : "Auto",
        FNumber : "F2.0",
        FocalLength: "16mm",
        ISOSpeed : "400",
        ShutterSpeed : "1/2000",
        WhiteBalance : "Auto",
        CaptureTime : "Jan 23 2022 15:23:34",
        Manufacturer : "Canon",
        Model : "6D Mark II"
    )
  ),
  ImageItem(
    id: "4",
    filename : "ImageList4",
    formats: ["RAW", "JPEG"],
    marked : true,
    rating : .Five,
    exifInfo : EXIFInfo(
        Aperture : "2.0",
        ExposureTime : "1/2000s",
        ExposureMode : "Auto",
        ExposureBias : "0 EV",
        ExposureProgram : "Auto",
        FNumber : "F2.0",
        FocalLength: "16mm",
        ISOSpeed : "400",
        ShutterSpeed : "1/2000s",
        WhiteBalance : "Auto",
        CaptureTime : "Jan 23 2022 15:23:34",
        Manufacturer : "Canon",
        Model : "6D Mark II"
    )
  ),
  ImageItem(
    id: "5",
    filename : "ImageList5",
    formats: ["RAW", "JPEG"],
    marked : false,
    rating : .Zero,
    exifInfo : EXIFInfo(
        Aperture : "2.0",
        ExposureTime : "1/2000s",
        ExposureMode : "Auto",
        ExposureBias : "0 EV",
        ExposureProgram : "Auto",
        FNumber : "F2.0",
        FocalLength: "16mm",
        ISOSpeed : "400",
        ShutterSpeed : "1/2000",
        WhiteBalance : "Auto",
        CaptureTime : "Jan 23 2022 15:23:34",
        Manufacturer : "Canon",
        Model : "6D Mark II"
    )
  ),
  ImageItem(
    id: "6",
    filename : "ImageList6",
    formats: ["RAW", "JPEG"],
    marked : false,
    rating : .Zero,
    exifInfo : EXIFInfo(
        Aperture : "2.0",
        ExposureTime : "1/2000s",
        ExposureMode : "Auto",
        ExposureBias : "0 EV",
        ExposureProgram : "Auto",
        FNumber : "F2.0",
        FocalLength: "16mm",
        ISOSpeed : "400",
        ShutterSpeed : "1/2000s",
        WhiteBalance : "Auto",
        CaptureTime : "Jan 23 2022 15:23:34",
        Manufacturer : "Canon",
        Model : "6D Mark II"
    )
  ),
  ImageItem(
    id: "7",
    filename : "ImageList7",
    formats: ["RAW"],
    marked : false,
    rating : .Zero,
    exifInfo : EXIFInfo(
        Aperture : "2.0",
        ExposureTime : "1/2000s",
        ExposureMode : "Auto",
        ExposureBias : "0 EV",
        ExposureProgram : "Auto",
        FNumber : "F2.0",
        FocalLength: "16mm",
        ISOSpeed : "400",
        ShutterSpeed : "1/2000s",
        WhiteBalance : "Auto",
        CaptureTime : "Jan 23 2022 15:23:34",
        Manufacturer : "Canon",
        Model : "6D Mark II"
    )
  ),
  ImageItem(
    id: "8",
    filename : "ImageList8",
    formats: ["DNG"],
    marked : false,
    rating : .Zero,
    exifInfo : EXIFInfo(
        Aperture : "2.0",
        ExposureTime : "1/2000s",
        ExposureMode : "Auto",
        ExposureBias : "0 EV",
        ExposureProgram : "Auto",
        FNumber : "F2.0",
        FocalLength: "16mm",
        ISOSpeed : "400",
        ShutterSpeed : "1/2000s",
        WhiteBalance : "Auto",
        CaptureTime : "Jan 23 2022 15:23:34",
        Manufacturer : "Canon",
        Model : "6D Mark II"
    )
  ),
  ImageItem(
    id: "9",
    filename : "ImageList9",
    formats: ["RAW"],
    marked : false,
    rating : .Zero,
    exifInfo : EXIFInfo(
        Aperture : "2.0",
        ExposureTime : "1/2000s",
        ExposureMode : "Auto",
        ExposureBias : "0 EV",
        ExposureProgram : "Auto",
        FNumber : "F2.0",
        FocalLength: "16mm",
        ISOSpeed : "400",
        ShutterSpeed : "1/2000s",
        WhiteBalance : "Auto",
        CaptureTime : "Jan 23 2022 15:23:34",
        Manufacturer : "Canon",
        Model : "6D Mark II"
    )
  ),
  ImageItem(
    id: "10",
    filename : "ImageList10",
    formats: ["RAW", "JPEG"],
    marked : false,
    rating : .Zero,
    exifInfo : EXIFInfo(
        Aperture : "2.0",
        ExposureTime : "1/2000s",
        ExposureMode : "Auto",
        ExposureBias : "0 EV",
        ExposureProgram : "Auto",
        FNumber : "F2.0",
        FocalLength: "16mm",
        ISOSpeed : "400",
        ShutterSpeed : "1/2000s",
        WhiteBalance : "Auto",
        CaptureTime : "Jan 23 2022 15:23:34",
        Manufacturer : "Canon",
        Model : "6D Mark II"
    )
  )
]
