# libheif + Xcode

[![CI Status](http://img.shields.io/travis/SDWebImage/libheif-Xcode.svg?style=flat)](https://travis-ci.org/SDWebImage/libheif-Xcode)
[![Version](https://img.shields.io/cocoapods/v/libheif.svg?style=flat)](http://cocoapods.org/pods/libheif)
[![License](https://img.shields.io/cocoapods/l/libheif.svg?style=flat)](http://cocoapods.org/pods/libheif)
[![Platform](https://img.shields.io/cocoapods/p/libheif.svg?style=flat)](http://cocoapods.org/pods/libheif)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/SDWebImage/libheif-Xcode)

A wrapper for [libheif](https://github.com/strukturag/libheif) + Xcode project.
This enables Carthage support to build libheif as a framework for Apple's platform. 

This repo also including the CocoaPods's spec file to use libheif.

## Requirements

+ iOS 8
+ macOS 10.9
+ tvOS 9.0
+ watchOS 2.0

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

## Usage

libheif itself is not a full function decoder but an abstract layer. It needs [libde265](http://www.libde265.org/) for HEIF decoder support, and [x265](http://x265.org/) for HEIF encoder support.

Since most of people's usage of this library is for HEIF decoding, and `x265` is under GPLv2 license, we only integrate libheif with the Carthage dependency [libde265-Xcode](https://github.com/SDWebImage/libde265-Xcode). To use x265 for HEIF encoding, try to build it by your own.

Use libheif as you would normally, this is just a repo that adds an Xcode proj.

## License

libheif is available under the terms of the GNU Lesser General Public License. See [the LICENSE file](https://github.com/strukturag/libheif/blob/master/COPYING) for more info.


