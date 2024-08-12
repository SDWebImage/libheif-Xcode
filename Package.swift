// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let HAVE_X265: Bool = ProcessInfo.processInfo.environment["HAVE_X265"] == "1"

var packageDependencies: [PackageDescription.Package.Dependency] = [
    .package(url: "https://github.com/SDWebImage/libde265-Xcode.git", from: "1.0.9")
]
var targetDependencies: [PackageDescription.Target.Dependency] = ["libde265"]
var exclude: [String] = ["libheif/libheif/plugins_unix.h",
                         "libheif/libheif/plugins_unix.cc",
                         "libheif/libheif/plugins_windows.h",
                         "libheif/libheif/plugins_windows.cc",
                         "libheif/libheif/plugins/encoder_aom.h",
                         "libheif/libheif/plugins/encoder_aom.cc",
                         "libheif/libheif/plugins/decoder_aom.h",
                         "libheif/libheif/plugins/decoder_aom.cc",
                         "libheif/libheif/plugins/decoder_dav1d.h",
                         "libheif/libheif/plugins/decoder_dav1d.cc",
                         "libheif/libheif/plugins/encoder_rav1e.h",
                         "libheif/libheif/plugins/encoder_rav1e.cc",
                         "libheif/libheif/plugins/encoder_svt.h",
                         "libheif/libheif/plugins/encoder_svt.cc",
                         "libheif/libheif/plugins/encoder_openjpeg.h",
                         "libheif/libheif/plugins/encoder_openjpeg.cc",
                         "libheif/libheif/plugins/decoder_openjpeg.h",
                         "libheif/libheif/plugins/decoder_openjpeg.cc",
                         "libheif/libheif/plugins/encoder_jpeg.h",
                         "libheif/libheif/plugins/encoder_jpeg.cc",
                         "libheif/libheif/plugins/decoder_jpeg.h",
                         "libheif/libheif/plugins/decoder_jpeg.cc",
                         "libheif/libheif/plugins/encoder_ffmpeg.h",
                         "libheif/libheif/plugins/encoder_ffmpeg.cc",
                         "libheif/libheif/plugins/decoder_ffmpeg.h",
                         "libheif/libheif/plugins/decoder_ffmpeg.cc",
                         "libheif/libheif/plugins/encoder_kvazaar.h",
                         "libheif/libheif/plugins/encoder_kvazaar.cc",
                         "libheif/libheif/plugins/encoder_svt.h",
                         "libheif/libheif/plugins/encoder_svt.cc"
]
var defines : [CSetting] = [
    .define("HAVE_UNISTD_H"),
    .define("HAVE_LIBDE265")
]
if HAVE_X265 {
    packageDependencies += [
        .package(url: "https://github.com/SDWebImage/libx265-Xcode.git", from: "3.4.0")
    ]
    targetDependencies += [
        "libx265"
    ]
    defines += [
        .define("HAVE_X265")
    ]
} else {
    exclude += [
        "libheif/libheif/plugins/encoder_x265.h",
        "libheif/libheif/plugins/encoder_x265.cc"
    ]
}

let package = Package(
    name: "libheif",
    platforms: [
        .macOS(.v10_10), .iOS(.v8), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "libheif",
            targets: ["libheif"]),
    ],
    dependencies: packageDependencies,
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "libheif",
            dependencies: targetDependencies,
            path: ".",
            exclude: exclude,
            sources: ["libheif/libheif"],
            publicHeadersPath: "include",
            cSettings: [.headerSearchPath("libheif")] + defines
        )
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx14
)
