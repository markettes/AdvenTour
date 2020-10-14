// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'dart:typed_data';

import 'package:flutter/painting.dart';
import 'package:here_sdk/mapview.dart';

class MapImageFactory {
  /// Creates a new map image from the provided image data. Supported formats are PNG and
  /// SVG Tiny. The resulting map image, when used with [sdk.mapview.MapMarker], will be drawn
  /// on the map at its original size.
  ///
  /// Throws an exception when the image data is not in one of the supported formats.
  ///
  /// [imageData] Data to be used for the image.
  /// Throws [MapImageInstantiationException]. Indicates what went wrong when the instantiation was attempted.
  static MapImage _makeMapImageFromData(Uint8List imageData) {}

  /// Creates a new map image from the provided image data. Supported formats are PNG and
  /// SVG Tiny. The supplied dimensions specify desired size when drawn on the map using
  /// [sdk.mapview.MapMarker].
  ///
  /// Throws an exception when the image data is not in one of the supported formats
  /// or if either the height or width is not a positive value.
  ///
  /// [imageData] Data to be used for the image.
  /// [width] Width of the image in pixels.
  /// [height] Height of the image in pixels.
  /// Throws [MapImageInstantiationException]. Indicates what went wrong when the instantiation was attempted.
  static MapImage _makeMapImageFromDataWithSize(Uint8List imageData, int width, int height) {}

  /// Creates a new map image from the provided path to the SVG Tiny or PNG image file
  /// located on internal or external storage. The resulting map image, when used with
  /// [sdk.mapview.MapMarker], will be drawn on the map at its original size.
  ///
  /// Trying to load a file that is not SVG Tiny or PNG results in undefined behavior.
  /// The application needs to have read access to the specified file.
  /// Throws an exception if the path is empty or if the file does not exist.
  ///
  /// [filePath] The path to image file.
  /// Throws [MapImageInstantiationException]. Indicates what went wrong when the instantiation was attempted.
  static MapImage _makeMapImageFromFile(String filePath) {}

  /// Creates a new map image from the provided path to the SVG Tiny or PNG image
  /// located on internal or external storage. The supplied dimensions specify desired size when
  /// drawn on the map using [sdk.mapview.MapMarker].
  ///
  /// Trying to load a file that is not SVG Tiny or PNG results in undefined behavior.
  /// The application needs to have read access to the specified file.
  /// Throws an exception if either the height or width is not a positive value
  /// or if the path is empty or if the file does not exist.
  ///
  /// [filePath] The path to image file.
  /// [width] Width of image in pixels.
  /// [height] Height of image in pixels.
  /// Throws [MapImageInstantiationException]. Indicates what went wrong when the instantiation was attempted.
  static MapImage _makeMapImageFromFileWithSize(String filePath, int width, int height) {}

  /// Creates a new map image from the provided AssetImage.
  ///
  /// Trying to load a file that is not SVG Tiny or PNG results in undefined behavior.
  /// The application needs to have read access to the specified file.
  /// Throws an exception if either the height or width is not a positive value
  /// or if the path is empty or if the file does not exist.
  ///
  /// [asset] The asset image to load from.
  /// Throws [MapImageInstantiationException]. Indicates what went wrong when the instantiation was attempted.
  static MapImage _makeMapImageFromAsset(AssetImage asset) {}
}
