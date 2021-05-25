import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_dream/util/log_utils.dart';

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
      this.holderImg = 'none'})
      : super(key: key);

  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final ImageFormat format;
  final String holderImg;

  @override
  Widget build(BuildContext context) {
    if (image.startsWith('http') || image.startsWith('https')) {
      return CachedNetworkImage(
        imageUrl: image,
        placeholder: (_, __) =>
            _loadAssetImage(holderImg, height: height, width: width, fit: fit),
        errorWidget: (_, __, dynamic error) =>
            _loadAssetImage(holderImg, height: height, width: width, fit: fit),
        width: width,
        height: height,
        fit: fit,
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
