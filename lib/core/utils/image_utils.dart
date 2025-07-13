import 'package:flutter/services.dart' show rootBundle;

enum AssetType { image, svg, lottie }

class ImageUtils {
  static bool isSvg(String assetPath) {
    return assetPath.toLowerCase().endsWith('.svg');
  }

  static AssetType getAssetType(String assetPath) {
    if (assetPath.toLowerCase().endsWith('.svg')) {
      return AssetType.svg;
    } else if (assetPath.toLowerCase().endsWith('.json') ||
        assetPath.toLowerCase().endsWith('.lottie')) {
      return AssetType.lottie;
    } else {
      return AssetType.image;
    }
  }

  static Future<double?> getSvgAspectRatio(String assetPath) async {
    final String svgString = await rootBundle.loadString(assetPath);
    final viewBoxMatch = RegExp(
      r'viewBox="([\d\.\s\-]+)"',
    ).firstMatch(svgString);
    if (viewBoxMatch != null) {
      final parts = viewBoxMatch.group(1)!.split(RegExp(r'\s+'));
      if (parts.length == 4) {
        final width = double.tryParse(parts[2]);
        final height = double.tryParse(parts[3]);
        if (width != null && height != null && width != 0) {
          return height / width;
        }
      }
    }
    return null;
  }
}
