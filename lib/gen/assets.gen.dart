/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/afternoon.jpg
  AssetGenImage get afternoon =>
      const AssetGenImage('assets/images/afternoon.jpg');

  /// File path: assets/images/clouds.png
  AssetGenImage get clouds => const AssetGenImage('assets/images/clouds.png');

  /// File path: assets/images/drizzle.png
  AssetGenImage get drizzle => const AssetGenImage('assets/images/drizzle.png');

  /// File path: assets/images/evening.png
  AssetGenImage get evening => const AssetGenImage('assets/images/evening.png');

  /// File path: assets/images/few_clouds.png
  AssetGenImage get fewClouds =>
      const AssetGenImage('assets/images/few_clouds.png');

  /// File path: assets/images/late_night.jpg
  AssetGenImage get lateNight =>
      const AssetGenImage('assets/images/late_night.jpg');

  /// File path: assets/images/morning.jpg
  AssetGenImage get morning => const AssetGenImage('assets/images/morning.jpg');

  /// File path: assets/images/rain.png
  AssetGenImage get rain => const AssetGenImage('assets/images/rain.png');

  /// File path: assets/images/snow.png
  AssetGenImage get snow => const AssetGenImage('assets/images/snow.png');

  /// File path: assets/images/sunrise.jpg
  AssetGenImage get sunrise => const AssetGenImage('assets/images/sunrise.jpg');

  /// File path: assets/images/sunset.png
  AssetGenImage get sunset => const AssetGenImage('assets/images/sunset.png');

  /// File path: assets/images/suny.png
  AssetGenImage get suny => const AssetGenImage('assets/images/suny.png');

  /// File path: assets/images/thunderstorm.png
  AssetGenImage get thunderstorm =>
      const AssetGenImage('assets/images/thunderstorm.png');

  /// File path: assets/images/windy.png
  AssetGenImage get windy => const AssetGenImage('assets/images/windy.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        afternoon,
        clouds,
        drizzle,
        evening,
        fewClouds,
        lateNight,
        morning,
        rain,
        snow,
        sunrise,
        sunset,
        suny,
        thunderstorm,
        windy
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
