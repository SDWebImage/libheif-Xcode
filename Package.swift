// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

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
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/SDWebImage/libde265-Xcode.git", from: "1.0.4")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "libheif",
            dependencies: [.product(name: "libde265", package: "libde265-Xcode")],
            path: ".",
            exclude: ["libheif/libheif/box_fuzzer.cc", "libheif/libheif/color_conversion_fuzzer.cc", "libheif/libheif/encoder_fuzzer.cc", "libheif/libheif/file_fuzzer.cc", "libheif/libheif/heif_encoder_x265.h", "libheif/libheif/heif_encoder_x265.cc", "libheif/libheif/heif_encoder_aom.h", "libheif/libheif/heif_encoder_aom.cc", "libheif/libheif/heif_decoder_aom.h", "libheif/libheif/heif_decoder_aom.cc", "libheif/libheif/heif_decoder_dav1d.h", "libheif/libheif/heif_decoder_dav1d.cc", "libheif/libheif/heif_encoder_rav1e.cc"],
            sources: ["libheif/libheif"],
            publicHeadersPath: "include",
            cSettings: [.define("HAVE_UNISTD_H"), .define("HAVE_LIBDE265"), .unsafeFlags(["-Wno-module-import-in-extern-c"])]
        )
    ],
    cLanguageStandard: .gnu11,
    cxxLanguageStandard: .gnucxx14
)
