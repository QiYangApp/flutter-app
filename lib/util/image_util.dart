import 'package:QiYang/servers/common/widget/image_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';

class ImageUtil {
  final Alignment alignment;
  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final ImageFormat format;
  final Widget holderImg;
  final Widget errorImg;

  ImageUtil(this.image, {this.alignment, this.width, this.height, this.fit,
    this.format, this.holderImg, this.errorImg});

   ExtendedImage gen() {
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

    return _loadAssetImage();
  }

  static ImageProvider getAssetImage(String name,
      {ImageFormat format = ImageFormat.png}) {
    return AssetImage(name);
  }

  ExtendedImage _loadAssetImage() {
    return ExtendedImage.asset(
      image,
      height: height,
      width: width,
      cacheWidth: width as int,
      cacheHeight: height as int,
      fit: fit,
      // color: color,

      /// 忽略图片语义
      excludeFromSemantics: true,
    );
  }
}
