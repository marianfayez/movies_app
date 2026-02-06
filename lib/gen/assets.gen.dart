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

  /// File path: assets/images/Movies Posters Group.png
  AssetGenImage get moviesPostersGroup =>
      const AssetGenImage('assets/images/Movies Posters Group.png');

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/on_boarding1.png
  AssetGenImage get onBoarding1 =>
      const AssetGenImage('assets/images/on_boarding1.png');

  /// File path: assets/images/on_boarding2.png
  AssetGenImage get onBoarding2 =>
      const AssetGenImage('assets/images/on_boarding2.png');

  /// File path: assets/images/on_boarding3.png
  AssetGenImage get onBoarding3 =>
      const AssetGenImage('assets/images/on_boarding3.png');

  /// File path: assets/images/on_boarding4.png
  AssetGenImage get onBoarding4 =>
      const AssetGenImage('assets/images/on_boarding4.png');

  /// File path: assets/images/on_boarding5.png
  AssetGenImage get onBoarding5 =>
      const AssetGenImage('assets/images/on_boarding5.png');

  /// File path: assets/images/on_boarding6.png
  AssetGenImage get onBoarding6 =>
      const AssetGenImage('assets/images/on_boarding6.png');

  /// File path: assets/images/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/images/splash_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        moviesPostersGroup,
        google,
        onBoarding1,
        onBoarding2,
        onBoarding3,
        onBoarding4,
        onBoarding5,
        onBoarding6,
        splashLogo
      ];
}

class Assets {
  const Assets._();

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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
