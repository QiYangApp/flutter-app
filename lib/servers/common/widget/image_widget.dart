import 'package:QiYang/util/image_util.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ImageFormat { png, jpg, gif, webp }

extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp'][index];
}

class ImageWidget extends StatelessWidget {
  const ImageWidget(this.image,
      {Key key,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.format = ImageFormat.png,
      this.holderImg,
      this.alignment,
      this.errorImg})
      : super(key: key);

  final Alignment alignment;
  final String image;
  final double width;
  final double height;
  final BoxFit fit;
  final ImageFormat format;
  final Widget holderImg;
  final Widget errorImg;

  @override
  ExtendedImage build(BuildContext context) {
    return ImageUtil(image,
            width: width,
            height: height,
            fit: fit,
            holderImg: holderImg,
            errorImg: errorImg,
            alignment: alignment)
        .gen();
  }
}
