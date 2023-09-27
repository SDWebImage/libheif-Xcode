# libheif + Xcode

[![CI Status](http://img.shields.io/travis/SDWebImage/libheif-Xcode.svg?style=flat)](https://travis-ci.org/SDWebImage/libheif-Xcode)
[![Version](https://img.shields.io/cocoapods/v/libheif.svg?style=flat)](http://cocoapods.org/pods/libheif)
[![License](https://img.shields.io/cocoapods/l/libheif.svg?style=flat)](http://cocoapods.org/pods/libheif)
[![Platform](https://img.shields.io/cocoapods/p/libheif.svg?style=flat)](http://cocoapods.org/pods/libheif)
[![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg?style=flat)](https://swift.org/package-manager/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/SDWebImage/libheif-Xcode)

A wrapper for [libheif](https://github.com/strukturag/libheif) + Xcode project.
This enables Carthage support to build libheif as a framework for Apple's platform. 

This repo also including the CocoaPods's spec file to use libheif.

## Requirements

+ iOS 8+
+ macOS 10.10+
+ tvOS 9+
+ watchOS 2+

## Installation

### Carthage

libheif is (via this repo) available through [Carthage](https://github.com/Carthage/Carthage).

```
github "SDWebImage/libheif-Xcode"
```

### CocoaPods

libheif is available through [CocoaPods](https://github.com/CocoaPods/CocoaPods).

```
pod 'libheif'
```

#### Swift Package Manager (Xcode 11+)

libheif is available through [Swift Package Manager](https://swift.org/package-manager).

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/SDWebImage/libheif-Xcode.git", from: "1.6.1")
    ]
)
```

## HEIF Encoding

libheif itself is not a full function decoder but an abstract layer. It needs [libde265](http://www.libde265.org/) for HEIF decoder support, and [x265](http://x265.org/) for HEIF encoder support.

For CocoaPods user, you can use `libx265` subspec to integrate the x265 codec supports for HEIF encoding.

```ruby
pod 'libheif', :subspecs => ['libde265', 'libx265']
```

Since most of people's usage of this library is for HEIF decoding, and `x265` is under GPLv2 license, we only integrate libheif with the Carthage dependency [libde265-Xcode](https://github.com/SDWebImage/libde265-Xcode). To use x265 for HEIF encoding, try to build it by your own.

## AVIF Decoding

+ aom

libheif from v1.7.0 added the support for [AV1 Image File Format (AVIF)](https://aomediacodec.github.io/av1-avif). To keep the component functional, we only integrate the AVIF support in CocoaPods via `libaom` subspec.

```ruby
pod 'libheif', :subspecs => ['libaom']
```

+ dav1d

libheif from v1.9.0 added the support to use [dav1d](https://code.videolan.org/videolan/dav1d) as AVIF decoder codec.

To use dav1d as decoder codec, use the subspec like this:

```ruby
pod 'libheif', :subspecs => ['libdav1d']
```


## AVIF Encoding

+ aom

libheif from v1.7.0 added the support to use `libaom` as the default AVIF encoder codec. However, libaom does not performent so well on most mobile system.

```ruby
pod 'libheif', :subspecs => ['libaom']
```

+ rav1e

There is another AVIF encoder codec, [rav1e](https://github.com/xiph/rav1e). Which added from v1.8.0 version. For CocoaPods, you can choose to use via `librav1e` subspec.

```ruby
pod 'libheif', :subspecs => ['librav1e']
```

Notes:

1. rav1e supports iOS and macOS only, because Rust language does not supports tvOS or watchOS bitcode format.
2. rav1e only supports AVIF encoding, for AVIF decoding, you can choose to use aom, or dav1d

```ruby
pod 'libheif', :subspecs => ['libdav1d', 'librav1e']
# or if you prefer aom
pod 'libheif', :subspecs => ['libaom', 'librav1e']
```

+ svt-av1

libheif from v1.14.0 added the support to use [svt-av1](https://gitlab.com/AOMediaCodec/SVT-AV1) as AVIF decoder and encoder codec.

To use svt-av1 as encoder and decoder codec, use the subspec like this:

```ruby
pod 'libheif', :subspecs => ['svt-av1']
```

## License

libheif is available under the terms of the GNU Lesser General Public License. See [the LICENSE file](https://github.com/strukturag/libheif/blob/master/COPYING) for more info.


