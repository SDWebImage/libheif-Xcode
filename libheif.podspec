#
# Be sure to run `pod lib lint TestLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'libheif'
  s.version          = '1.4.0'
  s.summary          = 'libheif is a ISO/IEC 23008-12:2017 HEIF file format decoder and encoder.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
HEIF is a new image file format employing HEVC (h.265) image coding for the best compression ratios currently possible.
                       DESC

  s.homepage         = 'https://www.libheif.org/'
  s.license          = { :type => 'LGPL' }
  s.author           = { 'struktur AG' => 'opensource@struktur.de' }
  s.source           = { :git => 'https://github.com/strukturag/libheif', :tag => 'v' + s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.7'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.subspec 'libheif' do |ss|
    ss.source_files = 'libheif/*.{h,c,cc}'
    ss.exclude_files = 'libheif/*fuzzer.{h,c,cc}', 'libheif/heif_decoder_libde265.{h,c,cc}', 'libheif/heif_encoder_x265.{h,c,cc}'
    ss.public_header_files = 'libheif/heif.h', 'libheif/heif_version.h'
    ss.preserve_path = 'libheif'
    ss.xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) HAVE_UNISTD_H=1',
      'HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libheif/ ${PODS_TARGET_SRCROOT}/'
    }
  end

  # libde265 decoder
  s.subspec 'libde265' do |ss|
    ss.dependency 'libde265'
    ss.dependency 'libheif/libheif'
    ss.source_files = 'libheif/heif_decoder_libde265.{h,c,cc}'
    ss.private_header_files = 'libheif/heif_decoder_libde265.h'
    ss.preserve_path = 'libheif'
    ss.xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) HAVE_LIBDE265=1',
      'HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libheif/ ${PODS_TARGET_SRCROOT}/'
    }
  end

  # libx265 encoder
  s.subspec 'libx265' do |ss|
    ss.dependency 'libx265'
    ss.dependency 'libheif/libheif'
    ss.source_files = 'libheif/heif_encoder_x265.{h,c,cc}'
    ss.private_header_files = 'libheif/heif_encoder_x265.h'
    ss.preserve_path = 'libheif'
    ss.xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) HAVE_X265=1',
      'HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libheif/ ${PODS_TARGET_SRCROOT}/ ${PODS_ROOT}/libx265/source/' # Fix #include <x265.h>
    }
  end

  # default contains only decoder
  s.default_subspecs = 'libde265'
  s.libraries = 'c++'

  # config the libheif build version string in `heif_version.h`, update when bumped version
  # fix #include <libheif/heif_version.h> cause 'Include of non-modular header inside framework module error'
  s.prepare_command = <<-CMD
                      cp './libheif/heif_version.h.in' './libheif/heif_version.h'
                      sed -i.bak 's/@NUMERIC_VERSION@/0x01040000/g' './libheif/heif_version.h'
                      sed -i.bak 's/@PACKAGE_VERSION@/1.4.0/g' './libheif/heif_version.h'
                      sed -i.bak 's/<libheif\\/heif_version.h>/"heif_version.h"/g' './libheif/heif.h'
                      CMD
end
