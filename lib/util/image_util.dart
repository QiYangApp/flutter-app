import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ImageFormat { png, jpg, gif, webp }

extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp'][index];
}

class ImageUtil extends StatelessWidget {
  const ImageUtil(this.image,
      {Key key,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.format = ImageFormat.png,
      this.holderImg,
      this.errorImg})
      : super(key: key);

  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final ImageFormat format;
  final Widget holderImg;
  final Widget errorImg;

  @override
  Widget build(BuildContext context) {
    if (image.startsWith('http') || image.startsWith('https')) {
      return ExtendedImage.network(
        image,
        width: width,
        height: height,
        fit: fit,
        cache: true,
        // border: Border.all(color: Colors.red, width: 1.0),
        // shape: boxShape,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      );
    }

    return _loadAssetImage(image, height: height, width: width, fit: fit);
  }

  static ImageProvider getAssetImage(String name,
      {ImageFormat format = ImageFormat.png}) {
    return AssetImage(name);
  }

  Widget _loadAssetImage(String holderImg,
      {double height,
      double width,
      BoxFit fit,
      int cacheWidth,
      int cacheHeight,
      Color color}) {
    return Image.asset(
      holderImg,
      height: height,
      width: width,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      color: color,

      /// 忽略图片语义
      excludeFromSemantics: true,
    );
  }
}
