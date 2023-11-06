import 'package:flutter/material.dart';

/// The `ColorExtension` extension provides a convenient way to convert a hexadecimal color
/// represented as a string (e.g., "#RRGGBB" or "RRGGBB") into a `Color` object in Flutter.

extension ColorExtension on String {
  /// Converts the hexadecimal color string to a Flutter `Color` object.
  ///
  /// The input string should be in the format "#RRGGBB" or "RRGGBB" where RR represents
  /// the red component, GG represents the green component, and BB represents the blue component.
  ///
  /// Example:
  /// ```dart
  /// Color myColor = "#FF5733".toColor();
  /// ```
  toColor() {
    var hexStringColor = this;
    final buffer = StringBuffer();

    if (hexStringColor.length == 6 || hexStringColor.length == 7) {
      buffer.write('ff');
      buffer.write(hexStringColor.replaceFirst("#", ""));
      return Color(int.parse(buffer.toString(), radix: 16));
    }
  }
}
